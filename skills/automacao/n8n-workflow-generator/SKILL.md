---
name: n8n-workflow-generator
description: Geração de blueprints JSON de workflows n8n Cloud a partir de descrições em linguagem natural. Usar quando Claude precisa criar, modificar ou compor workflows n8n programaticamente. Inclui schema completo de nodes e connections, padrões de execução paralela, estratégias de manutenção de contexto, e templates modulares para AI workflows, RAG pipelines, e automações jurídicas.
---

# n8n Workflow Generator - Criação Programática de Workflows

## Schema Base do Workflow JSON

```json
{
  "name": "Nome do Workflow",
  "nodes": [],
  "connections": {},
  "settings": {
    "executionOrder": "v1",
    "saveDataErrorExecution": "all"
  },
  "active": false
}
```

## Estrutura de Nodes

**Campos obrigatórios:** `id`, `name`, `type`, `position`

```json
{
  "id": "uuid-unico",
  "name": "Nome Exibido",
  "type": "n8n-nodes-base.httpRequest",
  "typeVersion": 4.1,
  "position": [250, 300],
  "parameters": {},
  "credentials": {
    "httpHeaderAuth": {
      "id": "cred-id",
      "name": "API Key"
    }
  }
}
```

**Convenções de type:**
- Core: `n8n-nodes-base.{nodeName}`
- Triggers: `n8n-nodes-base.{service}Trigger`
- AI/LangChain: `@n8n/n8n-nodes-langchain.{nodeName}`

## Estrutura de Connections

### Conexões básicas (main)

```json
"connections": {
  "Node Origem": {
    "main": [[{ "node": "Node Destino", "type": "main", "index": 0 }]]
  }
}
```

### Conexões para AI nodes

```json
"connections": {
  "AI Agent": {
    "ai_languageModel": [[{ "node": "OpenAI Chat", "type": "ai_languageModel", "index": 0 }]],
    "ai_memory": [[{ "node": "Buffer Memory", "type": "ai_memory", "index": 0 }]],
    "ai_tool": [
      [{ "node": "Calculator", "type": "ai_tool", "index": 0 }],
      [{ "node": "Vector Store Tool", "type": "ai_tool", "index": 1 }]
    ]
  }
}
```

### Branches múltiplas (IF node)

```json
"IF Node": {
  "main": [
    [{ "node": "True Branch", "type": "main", "index": 0 }],
    [{ "node": "False Branch", "type": "main", "index": 0 }]
  ]
}
```

## Padrões de Processamento Paralelo

### Split In Batches + Merge

Para manter contexto em processamento paralelo:

```json
{
  "nodes": [
    {
      "id": "split",
      "name": "Loop Over Items",
      "type": "n8n-nodes-base.splitInBatches",
      "parameters": { "batchSize": 1, "options": { "reset": false } }
    },
    {
      "id": "process",
      "name": "Process Item",
      "type": "n8n-nodes-base.code",
      "parameters": {
        "jsCode": "// Acesso ao contexto do loop\nconst index = $('Loop Over Items').context['currentRunIndex'];\nconst done = $('Loop Over Items').context['noItemsLeft'];\nreturn [{ json: { ...item.json, index } }];"
      }
    },
    {
      "id": "merge",
      "name": "Aggregate Results",
      "type": "n8n-nodes-base.merge",
      "parameters": { "mode": "append" }
    }
  ]
}
```

### Merge Modes

| Mode | Uso |
|------|-----|
| `append` | Concatenar resultados de branches paralelas |
| `combineBySql` | JOIN complexo com AlaSQL |
| `combineByFields` | Correlacionar por campo comum |
| `combineByPosition` | Merge por índice |
| `chooseBranch` | Selecionar uma branch |

## Geração de IDs Únicos

```javascript
function generateNodeId() {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, c => {
    const r = Math.random() * 16 | 0;
    return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
  });
}
```

## Validações Obrigatórias

1. IDs únicos para cada node
2. Nomes de nodes nas connections devem corresponder exatamente
3. Array de nodes não vazio
4. Estrutura de connections com arrays aninhados corretos

**Importante:** Credential IDs são específicos por instância - reconfigurar após import.

## Templates Modulares

Ver [references/templates.md](references/templates.md) para:
- AI Agent básico com tools
- RAG Pipeline com Vector Store
- Webhook → Process → Response
- Error handling centralizado
- Paginação de APIs

## Arquiteturas Multi-Agent

Ver [references/multi-agent.md](references/multi-agent.md) para:
- Pattern Gatekeeper (agente principal + sub-agentes)
- Chained Requests
- Agentic RAG com seleção dinâmica de fontes

## Limites n8n Cloud

| Plano | Execuções/mês | Concorrência |
|-------|---------------|--------------|
| Starter | 2,500 | 5 |
| Pro | 10,000 | 20 |
| Business | 40,000 | Higher |

Timeout de webhooks: 100 segundos
