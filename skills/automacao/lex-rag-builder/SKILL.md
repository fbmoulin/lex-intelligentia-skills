---
name: lex-rag-builder
description: Construção e otimização de pipelines RAG (Retrieval-Augmented Generation) para sistemas de IA jurídica. Especializado em chunking de documentos jurídicos brasileiros, estratégias de embedding para textos legais, configuração de vector stores (Pinecone, Qdrant, Supabase pgvector, Chroma), pipelines de ingestão de jurisprudência, legislação e doutrina, e otimização de retrieval para perguntas jurídicas. Usar quando o usuário precisar construir uma base de conhecimento jurídico para IA, configurar sistema de busca semântica em documentos legais, criar pipeline de ingestão de acórdãos/legislação, avaliar qualidade do retrieval, otimizar chunking para decisões judiciais ou construir a base vetorial da plataforma Lex Intelligentia. Disparar ao ver: "RAG", "vector store", "embedding jurídico", "base de conhecimento", "busca semântica", "ingestão de acórdãos", "pipeline de documentos", "Pinecone", "Qdrant", "pgvector", "Chroma", "LlamaIndex", "LangChain".
---

# Lex RAG Builder — Pipelines RAG para Direito Brasileiro

## Por que RAG Jurídico Precisa de Estratégia Específica

O RAG genérico falha com documentos jurídicos porque:
- Acórdãos têm estrutura específica (relatório, voto, ementa)
- Legislação tem hierarquia (CF > LC > Lei Ordinária > Decreto)
- A precisão de citação é crítica (número, data, relator)
- Termos jurídicos são polissêmicos (posse ≠ posse em direitos reais)
- Contexto temporal muda tudo (lei vigente vs. lei revogada)

---

## Arquitetura RAG Jurídica

```
INGESTÃO
├── Fontes → (PDF, HTML, API tribunais)
├── Extração → (OCR, parsing, limpeza)
├── Metadados → (tipo, tribunal, data, área)
├── Chunking → (estratégia por tipo de doc)
└── Embedding → (modelo especializado em PT-BR jurídico)
        │
        ▼
VECTOR STORE
├── Índices por área (civil, penal, consumidor...)
├── Filtros de metadados (tribunal, período, tipo)
└── Hierarquia de fontes (vinculante > persuasivo)
        │
        ▼
RETRIEVAL
├── Query reformulation (expansão de termos jurídicos)
├── Hybrid search (semântico + BM25 para jargão)
├── Re-ranking (por relevância jurídica + temporalidade)
└── Context compression (resumo dos trechos relevantes)
        │
        ▼
GENERATION
├── System prompt com persona jurídica
├── Instrução anti-alucinação
└── Formatação de citações (ABNT)
```

---

## Estratégias de Chunking por Tipo de Documento

### Acórdãos do STJ/STF

```python
def chunk_acordao(texto: str) -> list[dict]:
    """
    Estratégia: Chunk por seção estrutural do acórdão
    Preserva: EMENTA | RELATÓRIO | VOTO | ACÓRDÃO como chunks separados
    """
    secoes = {
        "EMENTA": r"EMENTA[\s\S]*?(?=RELATÓRIO|ACÓRDÃO|VOTO)",
        "RELATORIO": r"RELATÓRIO[\s\S]*?(?=VOTO|O EXMO)",
        "VOTO": r"VOTO[\s\S]*?(?=ACÓRDÃO|DECISÃO:|Ante o exposto)",
        "DISPOSITIVO": r"(?:Ante o exposto|ACÓRDÃO)[\s\S]*$"
    }
    
    chunks = []
    for nome_secao, pattern in secoes.items():
        match = re.search(pattern, texto, re.IGNORECASE)
        if match:
            chunks.append({
                "content": match.group(0),
                "metadata": {
                    "secao": nome_secao,
                    "tipo": "acordao",
                    "length": len(match.group(0))
                }
            })
    return chunks
```

### Legislação (Artigos de Lei)

```python
def chunk_lei(texto: str, lei_metadata: dict) -> list[dict]:
    """
    Estratégia: Chunk por artigo, preservando caput + incisos + parágrafos juntos
    Não separar artigo do caput, incisos e parágrafos relacionados
    """
    artigos = re.split(r'(?=\bArt\.\s*\d+)', texto)
    
    chunks = []
    for artigo in artigos:
        if artigo.strip():
            num_artigo = re.search(r'Art\.\s*(\d+)', artigo)
            chunks.append({
                "content": artigo.strip(),
                "metadata": {
                    **lei_metadata,
                    "artigo": num_artigo.group(1) if num_artigo else None,
                    "tipo": "legislacao"
                }
            })
    return chunks
```

### Súmulas e Teses Repetitivas

```python
def chunk_sumulas(texto: str, tribunal: str) -> list[dict]:
    """
    Estratégia: Chunk por súmula individual (número + enunciado)
    Tamanho pequeno mas contexto rico em metadata
    """
    sumulas = re.split(r'(?=Súmula\s+\d+|SÚMULA\s+N[Oº]+\s*\d+)', texto)
    
    chunks = []
    for sumula in sumulas:
        if sumula.strip():
            numero = re.search(r'(?:Súmula|SÚMULA)\s+[Nº]*\s*(\d+)', sumula)
            chunks.append({
                "content": sumula.strip(),
                "metadata": {
                    "tipo": "sumula",
                    "tribunal": tribunal,
                    "numero": int(numero.group(1)) if numero else None,
                    "vinculante": tribunal == "STF" and "VINCULANTE" in sumula.upper()
                }
            })
    return chunks
```

---

## Configuração do Vector Store

### Opção 1: Qdrant (Self-hosted ou Cloud)

```python
from qdrant_client import QdrantClient
from qdrant_client.models import Distance, VectorParams, PointStruct

def setup_qdrant_juridico(client: QdrantClient):
    """
    Coleções separadas por área para controle granular de retrieval
    """
    colecoes = [
        ("jurisprudencia_stj", 1536),   # OpenAI embeddings
        ("jurisprudencia_stf", 1536),
        ("jurisprudencia_tjes", 1536),
        ("legislacao_federal", 1536),
        ("legislacao_estadual", 1536),
        ("doutrina_civil", 1536),
        ("sumulas", 1536),
    ]
    
    for nome, dimensao in colecoes:
        client.create_collection(
            collection_name=nome,
            vectors_config=VectorParams(
                size=dimensao,
                distance=Distance.COSINE
            )
        )
```

### Opção 2: Supabase pgvector (Recomendado para integração n8n)

```sql
-- Extensão
CREATE EXTENSION IF NOT EXISTS vector;

-- Tabela principal de documentos jurídicos
CREATE TABLE documentos_juridicos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conteudo TEXT NOT NULL,
    embedding VECTOR(1536),
    
    -- Metadados jurídicos
    tipo VARCHAR(50),          -- 'acordao' | 'sumula' | 'lei' | 'doutrina'
    tribunal VARCHAR(20),      -- 'STJ' | 'STF' | 'TJES' | null
    area_direito VARCHAR(50),  -- 'civil' | 'consumidor' | 'processual'
    numero_referencia TEXT,    -- número do processo, artigo, súmula
    data_publicacao DATE,
    vigente BOOLEAN DEFAULT true,
    
    -- Hierarquia (para ranking)
    peso_hierarquia SMALLINT DEFAULT 5,  -- 10=STF vinculante, 1=doutrina
    
    created_at TIMESTAMP DEFAULT NOW()
);

-- Índice para busca vetorial
CREATE INDEX ON documentos_juridicos USING ivfflat (embedding vector_cosine_ops)
WITH (lists = 100);

-- Índice para filtros comuns
CREATE INDEX idx_tipo ON documentos_juridicos(tipo);
CREATE INDEX idx_tribunal ON documentos_juridicos(tribunal);
CREATE INDEX idx_area ON documentos_juridicos(area_direito);
```

---

## Modelos de Embedding para PT-BR Jurídico

### Ranking por Adequação ao Direito Brasileiro

| Modelo | Dimensões | Custo | Qualidade Jurídica BR | Recomendação |
|--------|-----------|-------|----------------------|--------------|
| `text-embedding-3-large` (OpenAI) | 3072 | Alto | ⭐⭐⭐⭐ | Produção |
| `text-embedding-3-small` (OpenAI) | 1536 | Médio | ⭐⭐⭐ | Dev/Testes |
| `intfloat/multilingual-e5-large` | 1024 | Grátis | ⭐⭐⭐ | Self-hosted |
| `neuralmind/bert-large-portuguese-cased` | 1024 | Grátis | ⭐⭐⭐⭐ | PT-BR nativo |
| `voyageai/voyage-law-2` | 1024 | Médio | ⭐⭐⭐⭐⭐ | Especializado jurídico |

**Recomendação para Lex Intelligentia:**
- Produção: `voyage-law-2` (especializado em documentos jurídicos)
- Fallback: `text-embedding-3-large` (mais disponível)

---

## Query Reformulation para Buscas Jurídicas

```python
EXPANSION_DICT = {
    # Termos comuns → termos jurídicos precisos
    "cobrar juros abusivos": ["juros remuneratórios abusivos", "capitalização mensal", 
                               "Súmula 382 STJ", "taxa média mercado BACEN"],
    "processo por acidente": ["responsabilidade civil extracontratual", "nexo causal",
                               "dano material", "dano moral", "art. 186 CC"],
    "reclamar produto com defeito": ["vício do produto", "art. 18 CDC", 
                                      "responsabilidade solidária", "prazo decadencial 90 dias"],
    "reintegração de posse": ["art. 561 CPC", "posse anterior", "esbulho", 
                               "periculum in mora possessório"],
}

def expand_query_juridica(query: str) -> list[str]:
    """
    Expande query do usuário com termos técnicos equivalentes
    para melhorar recall da busca semântica
    """
    queries_expandidas = [query]
    for termo_comum, expansoes in EXPANSION_DICT.items():
        if termo_comum.lower() in query.lower():
            queries_expandidas.extend(expansoes)
    return queries_expandidas
```

---

## Avaliação de Qualidade do RAG

### Métricas Específicas para RAG Jurídico

```python
def avaliar_rag_juridico(qa_pairs: list[dict]) -> dict:
    """
    Métricas:
    - Precisão: O chunk recuperado realmente responde a pergunta?
    - Recall: Todos os chunks relevantes foram recuperados?
    - Faithfulness: A resposta gerada é fiel aos chunks recuperados?
    - Citação Válida: As citações (número, data, relator) estão corretas?
    """
    metricas = {
        "precisao": [],
        "recall": [],
        "faithfulness": [],
        "citacoes_validas": []
    }
    
    for par in qa_pairs:
        # Avaliar via Claude como juiz
        # ...
        pass
    
    return {
        "precisao_media": sum(metricas["precisao"]) / len(metricas["precisao"]),
        "recall_medio": sum(metricas["recall"]) / len(metricas["recall"]),
        "faithfulness_media": sum(metricas["faithfulness"]) / len(metricas["faithfulness"]),
        "citacoes_validas_pct": sum(metricas["citacoes_validas"]) / len(metricas["citacoes_validas"])
    }
```

---

## Sistema Prompt para Geração com RAG Jurídico

```
Você é um assistente jurídico especializado em Direito Brasileiro.

REGRAS DE OURO:
1. Use APENAS as informações dos documentos fornecidos como contexto.
2. Se a informação não estiver no contexto, diga "não encontrei informação 
   suficiente nos documentos disponíveis".
3. Cite SEMPRE a fonte (tribunal, número, data) para cada afirmação jurídica.
4. Nunca invente números de processo, datas ou nomes de relatores.
5. Indique o grau de hierarquia da fonte (vinculante > persuasivo).

CONTEXTO RECUPERADO:
{context}

PERGUNTA:
{query}

RESPOSTA (com citações):
```

---

## Integração com n8n — Workflow RAG

```json
{
  "name": "Lex RAG - Consulta Jurídica",
  "nodes": [
    {"name": "Receber Pergunta", "type": "webhook"},
    {"name": "Reformular Query", "type": "code"},
    {"name": "Buscar no Vector Store", "type": "supabase"},
    {"name": "Re-rank por Hierarquia", "type": "code"},
    {"name": "Gerar Resposta", "type": "anthropic"},
    {"name": "Validar Citações", "type": "anthropic"},
    {"name": "Retornar Resposta", "type": "respond-to-webhook"}
  ]
}
```
