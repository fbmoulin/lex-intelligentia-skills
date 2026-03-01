# Templates Modulares de Workflows n8n

## Template 1: AI Agent Básico com Tools

```json
{
  "name": "AI Agent Template",
  "nodes": [
    {
      "id": "webhook-trigger",
      "name": "Webhook Trigger",
      "type": "n8n-nodes-base.webhook",
      "typeVersion": 2,
      "position": [0, 300],
      "parameters": {
        "httpMethod": "POST",
        "path": "agent",
        "responseMode": "responseNode"
      }
    },
    {
      "id": "ai-agent",
      "name": "AI Agent",
      "type": "@n8n/n8n-nodes-langchain.agent",
      "typeVersion": 1.7,
      "position": [250, 300],
      "parameters": {
        "systemMessage": "Você é um assistente útil.",
        "maxIterations": 10
      }
    },
    {
      "id": "openai-chat",
      "name": "OpenAI Chat Model",
      "type": "@n8n/n8n-nodes-langchain.lmChatOpenAi",
      "typeVersion": 1,
      "position": [250, 500],
      "parameters": {
        "model": "gpt-4o",
        "options": { "temperature": 0.3 }
      }
    },
    {
      "id": "calculator",
      "name": "Calculator",
      "type": "@n8n/n8n-nodes-langchain.toolCalculator",
      "typeVersion": 1,
      "position": [450, 500]
    },
    {
      "id": "respond",
      "name": "Respond to Webhook",
      "type": "n8n-nodes-base.respondToWebhook",
      "typeVersion": 1,
      "position": [500, 300],
      "parameters": {
        "respondWith": "json",
        "responseBody": "={{ JSON.stringify({ response: $json.output }) }}"
      }
    }
  ],
  "connections": {
    "Webhook Trigger": {
      "main": [[{ "node": "AI Agent", "type": "main", "index": 0 }]]
    },
    "AI Agent": {
      "main": [[{ "node": "Respond to Webhook", "type": "main", "index": 0 }]],
      "ai_languageModel": [[{ "node": "OpenAI Chat Model", "type": "ai_languageModel", "index": 0 }]],
      "ai_tool": [[{ "node": "Calculator", "type": "ai_tool", "index": 0 }]]
    }
  },
  "settings": { "executionOrder": "v1" }
}
```

## Template 2: RAG Pipeline com Vector Store

```json
{
  "name": "RAG Pipeline",
  "nodes": [
    {
      "id": "trigger",
      "name": "Manual Trigger",
      "type": "n8n-nodes-base.manualTrigger",
      "typeVersion": 1,
      "position": [0, 300]
    },
    {
      "id": "retriever",
      "name": "Vector Store Retriever",
      "type": "@n8n/n8n-nodes-langchain.retrieverVectorStore",
      "typeVersion": 1,
      "position": [200, 300],
      "parameters": {
        "topK": 5
      }
    },
    {
      "id": "supabase",
      "name": "Supabase Vector Store",
      "type": "@n8n/n8n-nodes-langchain.vectorStoreSupabase",
      "typeVersion": 1,
      "position": [200, 500],
      "parameters": {
        "tableName": "documents",
        "queryName": "match_documents"
      }
    },
    {
      "id": "embeddings",
      "name": "OpenAI Embeddings",
      "type": "@n8n/n8n-nodes-langchain.embeddingsOpenAi",
      "typeVersion": 1,
      "position": [400, 500],
      "parameters": {
        "model": "text-embedding-3-small"
      }
    },
    {
      "id": "qa-chain",
      "name": "Question Answer Chain",
      "type": "@n8n/n8n-nodes-langchain.chainRetrievalQa",
      "typeVersion": 1.3,
      "position": [450, 300]
    },
    {
      "id": "llm",
      "name": "Anthropic Chat",
      "type": "@n8n/n8n-nodes-langchain.lmChatAnthropic",
      "typeVersion": 1,
      "position": [450, 100],
      "parameters": {
        "model": "claude-sonnet-4-5-20250929",
        "options": { "temperature": 0.2 }
      }
    }
  ],
  "connections": {
    "Manual Trigger": {
      "main": [[{ "node": "Question Answer Chain", "type": "main", "index": 0 }]]
    },
    "Question Answer Chain": {
      "ai_retriever": [[{ "node": "Vector Store Retriever", "type": "ai_retriever", "index": 0 }]],
      "ai_languageModel": [[{ "node": "Anthropic Chat", "type": "ai_languageModel", "index": 0 }]]
    },
    "Vector Store Retriever": {
      "ai_vectorStore": [[{ "node": "Supabase Vector Store", "type": "ai_vectorStore", "index": 0 }]]
    },
    "Supabase Vector Store": {
      "ai_embedding": [[{ "node": "OpenAI Embeddings", "type": "ai_embedding", "index": 0 }]]
    }
  }
}
```

## Template 3: Error Handling Centralizado

```json
{
  "name": "Error Handler",
  "nodes": [
    {
      "id": "error-trigger",
      "name": "Error Trigger",
      "type": "n8n-nodes-base.errorTrigger",
      "typeVersion": 1,
      "position": [0, 300]
    },
    {
      "id": "format-error",
      "name": "Format Error",
      "type": "n8n-nodes-base.code",
      "typeVersion": 2,
      "position": [200, 300],
      "parameters": {
        "jsCode": "const error = $json;\nreturn [{\n  json: {\n    timestamp: new Date().toISOString(),\n    workflow: error.workflow?.name,\n    node: error.execution?.lastNodeExecuted,\n    message: error.execution?.error?.message,\n    executionUrl: `https://app.n8n.cloud/workflow/${error.workflow?.id}/executions/${error.execution?.id}`\n  }\n}];"
      }
    },
    {
      "id": "notify",
      "name": "Send Notification",
      "type": "n8n-nodes-base.httpRequest",
      "typeVersion": 4.1,
      "position": [400, 300],
      "parameters": {
        "method": "POST",
        "url": "={{ $vars.SLACK_WEBHOOK }}",
        "sendBody": true,
        "bodyParameters": {
          "parameters": [
            { "name": "text", "value": "🚨 Workflow Error: {{ $json.workflow }} - {{ $json.message }}" }
          ]
        }
      }
    }
  ],
  "connections": {
    "Error Trigger": {
      "main": [[{ "node": "Format Error", "type": "main", "index": 0 }]]
    },
    "Format Error": {
      "main": [[{ "node": "Send Notification", "type": "main", "index": 0 }]]
    }
  }
}
```

## Template 4: Paginação de API

```json
{
  "name": "API Pagination",
  "nodes": [
    {
      "id": "init",
      "name": "Initialize",
      "type": "n8n-nodes-base.set",
      "typeVersion": 3.2,
      "position": [0, 300],
      "parameters": {
        "assignments": {
          "assignments": [
            { "name": "page", "value": 1, "type": "number" },
            { "name": "hasMore", "value": true, "type": "boolean" },
            { "name": "allResults", "value": "={{ [] }}", "type": "array" }
          ]
        }
      }
    },
    {
      "id": "loop",
      "name": "Loop",
      "type": "n8n-nodes-base.splitInBatches",
      "typeVersion": 3,
      "position": [200, 300],
      "parameters": {
        "batchSize": 1,
        "options": { "reset": true }
      }
    },
    {
      "id": "fetch",
      "name": "Fetch Page",
      "type": "n8n-nodes-base.httpRequest",
      "typeVersion": 4.1,
      "position": [400, 300],
      "parameters": {
        "url": "https://api.example.com/data",
        "qs": { "page": "={{ $json.page }}", "limit": 100 }
      }
    },
    {
      "id": "check",
      "name": "Has More?",
      "type": "n8n-nodes-base.if",
      "typeVersion": 2,
      "position": [600, 300],
      "parameters": {
        "conditions": {
          "conditions": [
            { "leftValue": "={{ $json.data.length }}", "rightValue": 0, "operator": { "type": "number", "operation": "gt" } }
          ]
        }
      }
    },
    {
      "id": "increment",
      "name": "Next Page",
      "type": "n8n-nodes-base.set",
      "typeVersion": 3.2,
      "position": [800, 200],
      "parameters": {
        "assignments": {
          "assignments": [
            { "name": "page", "value": "={{ $json.page + 1 }}", "type": "number" }
          ]
        }
      }
    },
    {
      "id": "aggregate",
      "name": "Aggregate",
      "type": "n8n-nodes-base.aggregate",
      "typeVersion": 1,
      "position": [800, 400]
    }
  ],
  "connections": {
    "Initialize": {
      "main": [[{ "node": "Loop", "type": "main", "index": 0 }]]
    },
    "Loop": {
      "main": [[{ "node": "Fetch Page", "type": "main", "index": 0 }]]
    },
    "Fetch Page": {
      "main": [[{ "node": "Has More?", "type": "main", "index": 0 }]]
    },
    "Has More?": {
      "main": [
        [{ "node": "Next Page", "type": "main", "index": 0 }],
        [{ "node": "Aggregate", "type": "main", "index": 0 }]
      ]
    },
    "Next Page": {
      "main": [[{ "node": "Loop", "type": "main", "index": 0 }]]
    }
  }
}
```

## Posicionamento de Nodes

Grid recomendado para legibilidade:
- Horizontal: incrementos de 200-250px
- Vertical: incrementos de 150-200px
- Sub-nodes (LLM, embeddings): 200px abaixo do node principal
