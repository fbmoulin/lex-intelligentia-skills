# Estratégias de Chunking para Documentos Jurídicos

## Text Splitters Disponíveis no n8n

### Recursive Character Text Splitter (Recomendado para RAG)

Tenta parágrafos → sentenças → caracteres. Melhor para preservar estrutura legal.

```json
{
  "chunkSize": 1500,
  "chunkOverlap": 200,
  "separators": ["\n\n", "\n", "Art.", "§", ". ", " "]
}
```

### Token Splitter

Alinha com limites de contexto do modelo.

```json
{
  "chunkSize": 800,
  "chunkOverlap": 100,
  "encoding": "cl100k_base"
}
```

## Configurações por Tipo de Documento

### Legislação (Códigos, Leis)
- ChunkSize: 500-800 tokens
- Overlap: 50-100 tokens
- Separators: `["Art.", "§", "\n\n"]`
- Preserva artigos como unidades

### Jurisprudência (Acórdãos)
- ChunkSize: 1200-1500 tokens
- Overlap: 150-200 tokens
- Separators: `["\n\n", "EMENTA:", "VOTO:", "ACÓRDÃO:"]`
- Mantém contexto de fundamentação

### Petições e Pareceres
- ChunkSize: 1000-1200 tokens
- Overlap: 150 tokens
- Separators: `["\n\n", "DO DIREITO", "DOS FATOS", "DO PEDIDO"]`

### Contratos
- ChunkSize: 800-1000 tokens
- Overlap: 100 tokens
- Separators: `["CLÁUSULA", "\n\n", ". "]`

## Metadata Enrichment

Adicionar metadata para filtragem posterior:

```javascript
// No Code node após chunking
const chunks = $input.all();
return chunks.map((item, index) => ({
  json: {
    ...item.json,
    metadata: {
      tribunal: "STJ",
      processo: $('Extract').first().json.numero,
      tipo: "acordao",
      chunkIndex: index,
      totalChunks: chunks.length
    }
  }
}));
```

## Performance no n8n Cloud

- Batch size máximo: 100 chunks por inserção
- Use `Split In Batches` com size=50 para evitar timeouts
- Aguarde 1-2 segundos entre batches para APIs de embedding
