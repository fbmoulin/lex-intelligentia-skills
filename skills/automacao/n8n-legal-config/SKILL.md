---
name: n8n-legal-config
description: Configuração especializada de nodes n8n Cloud para workflows jurídicos com IA. Usar quando Claude precisa configurar AI Agent nodes, LangChain, OpenAI, Anthropic, Vector Stores (Pinecone, Supabase, Qdrant), HTTP Request, Code, Webhook, ou PostgreSQL para automação jurídica. Inclui parâmetros otimizados para processamento de documentos legais, análise FIRAC, pesquisa jurisprudencial, e RAG com legislação brasileira.
---

# n8n Legal Config - Configuração de Nodes para Workflows Jurídicos

## AI Agent Node - Orquestrador Central

O AI Agent é o hub de orquestração que conecta LLM, memória e ferramentas.

**Conexões obrigatórias:**
- `ai_languageModel`: OpenAI Chat ou Anthropic Chat
- `ai_tool`: Mínimo uma ferramenta

**Conexões recomendadas para jurídico:**
- `ai_memory`: Buffer Window Memory (10-15 mensagens para manter contexto processual)
- `ai_outputParser`: Structured Output Parser para JSON de decisões

**Parâmetros críticos:**

```json
{
  "systemMessage": "Você é um assistente jurídico especializado em [área]. Analise usando metodologia FIRAC+...",
  "maxIterations": 10,
  "returnIntermediateSteps": true
}
```

**Nota:** Sub-nodes resolvem expressões apenas para o primeiro item. Use Loop Over Items para múltiplos documentos.

## Configuração de Modelos LLM

### Anthropic Chat (Claude) - Preferencial para análise jurídica

```json
{
  "model": "claude-sonnet-4-5-20250929",
  "options": {
    "temperature": 0.1,
    "maxTokensToSample": 8192,
    "topK": 40,
    "topP": 0.95
  }
}
```

**Parâmetros jurídicos:**
- Temperature 0.0-0.2: Análises técnicas, citações legais
- Temperature 0.3-0.5: Pareceres, fundamentações
- TopK 20-40: Respostas mais determinísticas

### OpenAI Chat - Análises complementares

```json
{
  "model": "gpt-4o",
  "options": {
    "temperature": 0.2,
    "maxTokens": 4096,
    "frequencyPenalty": 0.3,
    "presencePenalty": 0.1
  }
}
```

**Responses API** (toggle no node): Habilita Web Search para jurisprudência atualizada.

## Vector Store Nodes - RAG Jurídico

### Supabase Vector Store (recomendado para Lex Intelligentia)

**Configuração de conexão:**
```
Host: db.xxx.supabase.co
Port: 6543 (transaction pooler - crítico para performance)
Database: postgres
Schema: public
Match Function: match_documents
```

**Modos de operação:**
1. `Insert Documents`: Inserir jurisprudência, legislação
2. `Retrieve Documents (as Tool for Agent)`: Pesquisa semântica pelo agente
3. `Get Many`: Recuperação direta com limit

**Metadata Filter para jurisprudência:**
```json
{
  "tribunal": "STJ",
  "area": "direito_civil",
  "ano": { "$gte": 2020 }
}
```

### Qdrant - Alta performance

```json
{
  "url": "https://xxx.qdrant.io",
  "collectionName": "jurisprudencia_stj",
  "collectionConfig": {
    "vectors": {
      "size": 1536,
      "distance": "Cosine"
    }
  }
}
```

## HTTP Request Node - Integração com APIs Jurídicas

**Configuração robusta:**
```json
{
  "method": "POST",
  "url": "https://api.tribunal.jus.br/v1/consulta",
  "authentication": "headerAuth",
  "options": {
    "timeout": 60000,
    "retry": {
      "maxTries": 5,
      "waitBetweenTries": 3000
    }
  }
}
```

**Error Handling:**
- `Continue (Using Error Output)`: Roteia para tratamento de erros
- Conecte a branch de erro para logging/notificação

**Backoff exponencial** (além de 5 retries):
```javascript
// No Code node antes do HTTP Request
const attempt = $('Loop').context['currentRunIndex'] || 0;
const delay = Math.min(2000 * Math.pow(2, attempt), 30000);
return [{ json: { delay } }];
```

## Code Node - Processamento de Documentos Jurídicos

**Variáveis úteis:**
```javascript
$json                          // Documento atual
$input.all()                   // Todos os documentos
$('AI Agent').first().json     // Resposta do agente
$execution.id                  // ID para logging
```

**Template para extração de dados processuais:**
```javascript
const documento = $json.texto;

// Extração de número do processo
const numeroProcesso = documento.match(/\d{7}-\d{2}\.\d{4}\.\d\.\d{2}\.\d{4}/)?.[0];

// Extração de partes
const partes = {
  autor: documento.match(/(?:Autor|Requerente|Exequente):\s*([^\n]+)/i)?.[1]?.trim(),
  reu: documento.match(/(?:Réu|Requerido|Executado):\s*([^\n]+)/i)?.[1]?.trim()
};

return [{
  json: {
    numeroProcesso,
    partes,
    textoOriginal: documento
  }
}];
```

**HTTP Request interno:**
```javascript
const response = await this.helpers.httpRequest({
  method: 'GET',
  url: `https://api.stj.jus.br/processo/${$json.numero}`,
  headers: { 'Authorization': `Bearer ${$json.token}` }
});
return [{ json: response }];
```

## Webhook Node - Recebimento de Petições/Documentos

**Configuração de produção:**
```json
{
  "httpMethod": "POST",
  "path": "receber-peticao",
  "authentication": "headerAuth",
  "responseMode": "responseNode",
  "options": {
    "rawBody": true,
    "binaryData": true
  }
}
```

**Timeout n8n Cloud: 100 segundos** - Use polling para processos longos.

## Memory e State Management

### Buffer Window Memory
```json
{
  "sessionIdType": "customKey",
  "sessionKey": "={{ $json.processo_id }}",
  "contextWindowLength": 15
}
```

### Workflow Static Data (persistência entre execuções)
```javascript
const staticData = $getWorkflowStaticData('global');

// Salvar último processamento
staticData.ultimoProcessamento = {
  timestamp: new Date().toISOString(),
  processoId: $json.processo_id
};

// Recuperar
const ultimo = staticData.ultimoProcessamento;
```

**Limitação:** Funciona apenas em produção, não em testes manuais.

## Referências

- Configurações avançadas de Text Splitters: Ver [references/chunking-juridico.md](references/chunking-juridico.md)
- Templates de System Prompts jurídicos: Ver [references/prompts-juridicos.md](references/prompts-juridicos.md)
