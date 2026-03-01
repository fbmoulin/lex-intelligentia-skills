# Arquiteturas Multi-Agent em n8n

## Pattern 1: Gatekeeper (Main Agent + Sub-Agents)

O agente principal orquestra sub-agentes especializados conectados como tools.

```
Main Agent (orchestrator)
├── Email Agent (tool)
├── Task Agent (tool)
├── Calendar Agent (tool)
└── Knowledge Agent (tool)
```

### Implementação JSON

```json
{
  "nodes": [
    {
      "id": "main-agent",
      "name": "Main Agent",
      "type": "@n8n/n8n-nodes-langchain.agent",
      "parameters": {
        "systemMessage": "Você é um orquestrador. Analise a solicitação e delegue para o agente especializado apropriado:\n- Para emails: use email_agent\n- Para tarefas: use task_agent\n- Para pesquisa: use knowledge_agent"
      }
    },
    {
      "id": "email-agent",
      "name": "Email Agent Tool",
      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",
      "parameters": {
        "name": "email_agent",
        "description": "Use para redigir, responder ou gerenciar emails",
        "workflowId": "{{ email_workflow_id }}"
      }
    },
    {
      "id": "task-agent",
      "name": "Task Agent Tool",
      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",
      "parameters": {
        "name": "task_agent",
        "description": "Use para criar, atualizar ou listar tarefas",
        "workflowId": "{{ task_workflow_id }}"
      }
    },
    {
      "id": "knowledge-agent",
      "name": "Knowledge Agent Tool",
      "type": "@n8n/n8n-nodes-langchain.toolWorkflow",
      "parameters": {
        "name": "knowledge_agent",
        "description": "Use para pesquisar documentos e conhecimento da base",
        "workflowId": "{{ knowledge_workflow_id }}"
      }
    }
  ],
  "connections": {
    "Main Agent": {
      "ai_tool": [
        [{ "node": "Email Agent Tool", "type": "ai_tool", "index": 0 }],
        [{ "node": "Task Agent Tool", "type": "ai_tool", "index": 1 }],
        [{ "node": "Knowledge Agent Tool", "type": "ai_tool", "index": 2 }]
      ]
    }
  }
}
```

## Pattern 2: Chained Requests

Sequência predefinida onde output de um agente alimenta o próximo.

```
Query → Agent 1 (Extract) → Agent 2 (Analyze) → Agent 3 (Generate) → Output
```

### Implementação JSON

```json
{
  "nodes": [
    {
      "id": "extract",
      "name": "Extract Agent",
      "type": "@n8n/n8n-nodes-langchain.chainLlm",
      "parameters": {
        "prompt": "Extraia os fatos principais do seguinte texto:\n\n{{ $json.input }}\n\nRetorne em formato estruturado."
      }
    },
    {
      "id": "analyze",
      "name": "Analyze Agent",
      "type": "@n8n/n8n-nodes-langchain.chainLlm",
      "parameters": {
        "prompt": "Analise os seguintes fatos e identifique questões jurídicas:\n\n{{ $json.text }}"
      }
    },
    {
      "id": "generate",
      "name": "Generate Agent",
      "type": "@n8n/n8n-nodes-langchain.chainLlm",
      "parameters": {
        "prompt": "Com base na análise, gere uma recomendação jurídica:\n\n{{ $json.text }}"
      }
    }
  ],
  "connections": {
    "Extract Agent": {
      "main": [[{ "node": "Analyze Agent", "type": "main", "index": 0 }]]
    },
    "Analyze Agent": {
      "main": [[{ "node": "Generate Agent", "type": "main", "index": 0 }]]
    }
  }
}
```

## Pattern 3: Agentic RAG

Agente decide dinamicamente qual fonte consultar.

### Retriever Router

```json
{
  "id": "router-agent",
  "name": "Router Agent",
  "type": "@n8n/n8n-nodes-langchain.agent",
  "parameters": {
    "systemMessage": "Você é um roteador de consultas. Analise a pergunta e escolha a ferramenta apropriada:\n\n- query_legislation: Para questões sobre leis, códigos, artigos\n- query_jurisprudence: Para precedentes, súmulas, decisões\n- query_doctrine: Para conceitos, teorias, doutrinas\n- web_search: Para informações atuais não encontradas nas bases"
  }
}
```

### Answer Critic (Verificação de Completude)

```json
{
  "nodes": [
    {
      "id": "initial-search",
      "name": "Initial Search",
      "type": "@n8n/n8n-nodes-langchain.chainRetrievalQa"
    },
    {
      "id": "critic",
      "name": "Answer Critic",
      "type": "@n8n/n8n-nodes-langchain.chainLlm",
      "parameters": {
        "prompt": "Avalie se a resposta está completa:\n\nPergunta: {{ $('Trigger').first().json.query }}\nResposta: {{ $json.text }}\n\nRetorne JSON: { \"complete\": true/false, \"missing\": [\"aspectos faltantes\"] }"
      }
    },
    {
      "id": "check-complete",
      "name": "Is Complete?",
      "type": "n8n-nodes-base.if",
      "parameters": {
        "conditions": {
          "conditions": [
            { "leftValue": "={{ JSON.parse($json.text).complete }}", "rightValue": true }
          ]
        }
      }
    },
    {
      "id": "refine-search",
      "name": "Refine Search",
      "type": "@n8n/n8n-nodes-langchain.chainRetrievalQa",
      "parameters": {
        "query": "={{ JSON.parse($('Answer Critic').first().json.text).missing.join(', ') }}"
      }
    }
  ],
  "connections": {
    "Initial Search": {
      "main": [[{ "node": "Answer Critic", "type": "main", "index": 0 }]]
    },
    "Answer Critic": {
      "main": [[{ "node": "Is Complete?", "type": "main", "index": 0 }]]
    },
    "Is Complete?": {
      "main": [
        [{ "node": "Output", "type": "main", "index": 0 }],
        [{ "node": "Refine Search", "type": "main", "index": 0 }]
      ]
    },
    "Refine Search": {
      "main": [[{ "node": "Merge Results", "type": "main", "index": 0 }]]
    }
  }
}
```

## Pattern 4: Single Agent with Scratchpad

Agente mantém estado intermediário para decisões complexas.

```json
{
  "id": "stateful-agent",
  "name": "Stateful Agent",
  "type": "@n8n/n8n-nodes-langchain.agent",
  "parameters": {
    "systemMessage": "Você mantém um scratchpad mental. A cada iteração:\n1. Registre seu raciocínio atual\n2. Identifique próximos passos\n3. Execute ação necessária\n4. Atualize scratchpad com resultados",
    "maxIterations": 15,
    "returnIntermediateSteps": true
  }
}
```

### Acesso aos Passos Intermediários

```javascript
// No Code node após o agente
const steps = $json.intermediateSteps;
const reasoning = steps.map(s => ({
  action: s.action.tool,
  input: s.action.toolInput,
  result: s.observation
}));
return [{ json: { reasoning, finalOutput: $json.output } }];
```

## Contexto e Memória entre Agentes

### Buffer Window Memory Compartilhada

```json
{
  "id": "shared-memory",
  "name": "Shared Memory",
  "type": "@n8n/n8n-nodes-langchain.memoryBufferWindow",
  "parameters": {
    "sessionIdType": "customKey",
    "sessionKey": "={{ $json.conversation_id }}",
    "contextWindowLength": 20
  }
}
```

Conecte o mesmo node de memória a múltiplos agentes para compartilhar contexto conversacional.

## Limites e Considerações

- **Max iterations**: 10-15 é seguro para Cloud (evita timeouts)
- **Tools por agente**: Máximo recomendado de 5-7 para melhor performance
- **Workflow tools**: Preferir sub-workflows para operações complexas
- **Memória**: Use session keys únicas por conversa/processo
