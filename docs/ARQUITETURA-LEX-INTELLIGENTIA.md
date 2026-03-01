# Arquitetura Lex Intelligentia — Como as Skills se Conectam

## Visão Geral

O ecossistema Lex Intelligentia é composto por **21 skills** organizadas em 5 categorias. Cada skill é autônoma (pode ser usada isoladamente), mas o valor máximo emerge quando combinadas em **workflows completos**.

Este documento descreve como as skills se conectam, em que ordem usá-las, e quais dados fluem entre elas.

---

## Mapa de Dependências

```
                         ┌─────────────────────┐
                         │    ENTRADA DE DADOS  │
                         └────────┬────────────┘
                                  │
                    ┌─────────────┼──────────────┐
                    ▼             ▼               ▼
            ┌──────────┐  ┌─────────────┐  ┌───────────┐
            │ PDF/Docs │  │ Áudio/Vídeo │  │ DJE (web) │
            └────┬─────┘  └──────┬──────┘  └─────┬─────┘
                 │               │                │
                 ▼               ▼                ▼
          lex-document-ocr  audiencia-analyzer  dje-monitor
                 │               │                │
                 └───────┬───────┘                │
                         ▼                        │
                  peticao-analyzer ◄───────────────┘
                    (CAPPD)                    (prazos)
                         │
              ┌──────────┼──────────┬──────────────┐
              ▼          ▼          ▼              ▼
   jurisprudencia   tese-juridica  conciliacao  checklist-saneamento
      -miner         -validator    -assistant      (art.357 CPC)
   (3 Níveis)      (5 dimensões)  (ZOPA/BATNA)       │
              │          │                            │
              └────┬─────┘                            │
                   ▼                                  │
          sentenca-judicial-br ◄───────────────────────┘
              (FIRAC-JB)
                   │
                   ├──→ calculadora-processual (juros/correção/honorários)
                   │
                   ├──→ despacho-generator (despachos por fase)
                   │
                   ├──→ relatorio-produtividade (métricas CNJ)
                   │
         ┌─────────┼──────────┐
         ▼         ▼          ▼
   lex-pkm     academic    social-content
   -juridico   -writer-br  -juridico
  (Zettelkasten) (ABNT)   (LinkedIn/IG)
```

---

## Frameworks por Skill

Cada skill core tem um framework de raciocínio estruturado:

| Skill | Framework | Função |
|-------|-----------|--------|
| `sentenca-judicial-br` | **FIRAC-JB** (Facts, Issues, Rules, Application, Conclusion) | Estrutura o raciocínio judicial em 5 etapas mapeadas ao CPC/2015 |
| `peticao-analyzer` | **CAPPD** (Causas, Argumentos, Pedidos, Provas, Defesas) | Extrai informações-chave de peças processuais |
| `jurisprudencia-miner` | **3 Níveis** (Confirmado, Provável, Incerto) | Classifica confiança de citações jurisprudenciais |
| `tese-juridica-validator` | **5 Dimensões** (Normativa, Jurisprudencial, Doutrinária, Fática, Processual) | Valida solidez de argumentos jurídicos |

---

## Workflows Completos

### Workflow 1 — Sentença Cível (mais comum)

**Cenário:** Magistrado recebe autos conclusos para sentença.

```
Passo 1 → peticao-analyzer
          Input:  Texto da petição inicial + contestação
          Output: Mapa CAPPD (causas, argumentos, pedidos, provas, defesas)

Passo 2 → jurisprudencia-miner
          Input:  Questões de direito identificadas no Passo 1
          Output: Precedentes classificados por nível de confiança

Passo 3 → sentenca-judicial-br
          Input:  CAPPD (Passo 1) + Precedentes (Passo 2) + fatos do caso
          Output: Minuta de sentença no padrão FIRAC-JB

Passo 4 → Revisão humana
          Checklist: docs/METODOLOGIA-FIRAC-JB.md (seção Checklist de Validação)
```

**Tempo estimado com skills:** 15-30 minutos (vs. 2-4 horas manual)

---

### Workflow 2 — Monitoramento e Análise de Prazos

**Cenário:** Acompanhar publicações do DJE e preparar pauta.

```
Passo 1 → dje-monitor
          Input:  Publicação do Diário (texto bruto)
          Output: Publicações extraídas + prazos calculados

Passo 2 → peticao-analyzer (se houver petição vinculada)
          Input:  Petição referenciada na publicação
          Output: Mapa CAPPD para preparação de despacho/decisão
```

---

### Workflow 3 — Audiência → Sentença

**Cenário:** Audiência de instrução realizada, necessário sentenciar.

```
Passo 1 → audiencia-analyzer
          Input:  Transcrição ou áudio da audiência
          Output: Ata estruturada + análise de contradições + bloco de prova oral

Passo 2 → peticao-analyzer
          Input:  Petição inicial + contestação (já nos autos)
          Output: Mapa CAPPD com questões controversas

Passo 3 → jurisprudencia-miner
          Input:  Questões de direito + análise de prova (Passos 1-2)
          Output: Precedentes fundamentadores

Passo 4 → sentenca-judicial-br
          Input:  CAPPD + Prova oral + Precedentes
          Output: Minuta de sentença com bloco de audiência integrado
```

---

### Workflow 4 — Conciliação Fundamentada

**Cenário:** Pauta de conciliação com proposta de acordo.

```
Passo 1 → peticao-analyzer
          Input:  Petição + contestação
          Output: Mapa CAPPD (especialmente pedidos e valores)

Passo 2 → jurisprudencia-miner
          Input:  Tipo de ação + pedidos
          Output: Parâmetros indenizatórios típicos da jurisprudência

Passo 3 → conciliacao-assistant
          Input:  CAPPD + parâmetros jurisprudenciais
          Output: ZOPA (zona de acordo) + sugestão de proposta + minuta de termo
```

---

### Workflow 5 — Produção Acadêmica

**Cenário:** Escrever artigo científico sobre tema jurídico.

```
Passo 1 → jurisprudencia-miner
          Input:  Tema de pesquisa
          Output: Panorama jurisprudencial + evolução de teses

Passo 2 → lex-pkm-juridico
          Input:  Notas de pesquisa + jurisprudência coletada
          Output: Notas atômicas Zettelkasten organizadas

Passo 3 → academic-writer-br
          Input:  Tese + notas PKM + jurisprudência validada
          Output: Artigo em formato ABNT (estrutura IMRAD)
```

---

### Workflow 6 — Saneamento Completo

**Cenário:** Magistrado precisa sanear processo após fase postulatória.

```
Passo 1 → peticao-analyzer (modo consolidado)
          Input:  Petição inicial + contestação
          Output: CAPPD completo + quadro Pedidos vs Defesas + fatos incontroversos

Passo 2 → checklist-saneamento
          Input:  CAPPD (Passo 1) + preliminares pendentes
          Output: Decisão saneadora completa (5 incisos art. 357)

Passo 3 → calculadora-processual (se necessário)
          Input:  Tipo de perícia/prova
          Output: Honorários periciais de referência

Passo 4 → Revisão humana
          Checklist: cada inciso do art. 357 preenchido e fundamentado
```

---

### Workflow 7 — Despacho Rápido (Rotina Diária)

**Cenário:** Gabinete precisa despachar processos em lote.

```
Passo 1 → peticao-analyzer (resumo)
          Input:  Última petição juntada
          Output: Tipo de providência necessária

Passo 2 → despacho-generator
          Input:  Fase processual + tipo de despacho identificado
          Output: Despacho padronizado com placeholders preenchidos

Passo 3 → Revisão humana
          Validar: artigos corretos, prazos, nomes das partes
```

---

## Categorias e Público-Alvo

| Categoria | Público | Skills |
|-----------|---------|--------|
| `core/` | Qualquer profissional do Direito | sentenca-judicial-br, peticao-analyzer, jurisprudencia-miner, dje-monitor, tese-juridica-validator, calculadora-processual |
| `magistrado/` | Juízes e assessores | audiencia-analyzer, conciliacao-assistant, contrato-analyzer-br, prompt-forge-juridico, despacho-generator, checklist-saneamento, relatorio-produtividade |
| `pesquisador/` | Acadêmicos e pós-graduandos | academic-writer-br, lex-pkm-juridico |
| `automacao/` | Desenvolvedores de legaltech | lex-document-ocr, lex-rag-builder, n8n-workflow-generator, n8n-legal-config |
| `criacao/` | Produtores de conteúdo jurídico | social-content-juridico, ficao-digital-juvenil |

---

## Entrada e Saída de Cada Skill

| Skill | Input | Output | Alimenta |
|-------|-------|--------|----------|
| `peticao-analyzer` | Texto de peça processual | Mapa CAPPD (JSON/Markdown) | sentenca, conciliacao, tese-validator |
| `jurisprudencia-miner` | Tema ou questão de direito | Precedentes com nível de confiança | sentenca, academic-writer, tese-validator |
| `sentenca-judicial-br` | CAPPD + Precedentes + Fatos | Minuta de sentença (FIRAC-JB) | lex-pkm (arquivo) |
| `dje-monitor` | Texto do DJE | Publicações extraídas + prazos | peticao-analyzer (quando há petição) |
| `tese-juridica-validator` | Argumento jurídico | Score em 5 dimensões + recomendação | sentenca, peticao |
| `audiencia-analyzer` | Transcrição/áudio | Ata estruturada + análise | sentenca (bloco de prova oral) |
| `conciliacao-assistant` | CAPPD + parâmetros | ZOPA + proposta + minuta de termo | — (entrega final) |
| `contrato-analyzer-br` | Texto do contrato | Checklist por tipo + cláusulas-alerta | sentenca, peticao |
| `lex-document-ocr` | PDF/imagem | Texto estruturado extraído | peticao-analyzer, lex-rag-builder |
| `lex-rag-builder` | Documentos jurídicos | Base vetorial (Qdrant/pgvector) | jurisprudencia-miner |
| `academic-writer-br` | Tese + referências | Artigo ABNT formatado | — (entrega final) |
| `lex-pkm-juridico` | Notas, insights, leituras | Vault Zettelkasten organizado | academic-writer, sentenca |
| `social-content-juridico` | Tema jurídico | Posts para LinkedIn/Instagram/Reels | — (entrega final) |
| `ficao-digital-juvenil` | Premissa narrativa | Capítulos YA com precisão jurídica | — (entrega final) |
| `prompt-forge-juridico` | Caso de uso jurídico | Prompt otimizado para LLM | qualquer skill |
| `n8n-workflow-generator` | Fluxo desejado | Workflow n8n JSON | n8n-legal-config |
| `n8n-legal-config` | Node n8n | Configuração otimizada | — (configuração) |
| `despacho-generator` | Fase processual + tipo de despacho | Despacho com placeholders preenchidos | sentenca (quando evolui para decisão) |
| `checklist-saneamento` | CAPPD (peticao-analyzer) | Decisão saneadora completa (art. 357) | sentenca (delimita âmbito) |
| `calculadora-processual` | Tipo de obrigação + partes | Tabela com índice/taxa/termo/fundamentação | sentenca, checklist-saneamento, despacho |
| `relatorio-produtividade` | Dados do sistema processual | Relatório CNJ com diagnóstico + plano de ação | — (entrega final) |

---

## Documentação de Referência

| Documento | Conteúdo |
|-----------|----------|
| [METODOLOGIA-FIRAC-JB.md](./METODOLOGIA-FIRAC-JB.md) | Raciocínio jurídico em 5 etapas + exemplo prático + checklist de validação |
| [GUIA-ANTI-ALUCINACAO.md](./GUIA-ANTI-ALUCINACAO.md) | Protocolo de 3 níveis para citação segura + termos de busca por área |

---

## Quick Start — Primeiro Uso

1. **Instale** as skills conforme o [README](../README.md)
2. **Comece** com `peticao-analyzer` — cole o texto de uma petição e veja o mapa CAPPD
3. **Pesquise** com `jurisprudencia-miner` — peça precedentes sobre o tema identificado
4. **Gere** com `sentenca-judicial-br` — use os outputs anteriores para uma minuta completa
5. **Valide** com o checklist do [METODOLOGIA-FIRAC-JB.md](./METODOLOGIA-FIRAC-JB.md)
6. **Revise** — toda saída de IA é rascunho até revisão humana
