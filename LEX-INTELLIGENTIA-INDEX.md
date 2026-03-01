# Lex Intelligentia Skills — Index para Claude Desktop

Voce tem acesso a 21 skills juridicas especializadas para o Direito Brasileiro via filesystem MCP.
Quando o usuario acionar um trigger listado abaixo, LEIA o arquivo SKILL.md correspondente e siga suas instrucoes.

## Como Usar

1. Identifique o trigger na mensagem do usuario
2. Leia o arquivo SKILL.md usando o filesystem MCP: `C:\projetos-2026\lex-intelligentia-SKILLS-2026\lex-intelligentia-skills-repo\skills\[categoria]\[skill]\SKILL.md`
3. Siga as instrucoes da skill para gerar o output

## Protocolo Anti-Alucinacao (OBRIGATORIO)

Toda citacao de jurisprudencia deve ser classificada em 3 niveis:
- **NIVEL 1 — CONFIRMADO:** Sumula vinculante, Tema Repetitivo, ADPF com numero exato verificavel
- **NIVEL 2 — PROVAVEL:** Jurisprudencia conhecida mas sem numero exato confirmado — marcar [VERIFICAR]
- **NIVEL 3 — INCERTO:** Tendencia jurisprudencial sem precedente especifico — usar linguagem generica

**NUNCA** invente numeros de REsp, AI, HC, Sumulas ou nomes de relatores.

---

## Catalogo de Skills (21)

### core/ — Fundamentos para qualquer jurista

| Skill | Triggers | Path |
|-------|----------|------|
| sentenca-judicial-br | sentenca, decisao, fundamentacao, dispositivo, FIRAC, tutela, liminar | core/sentenca-judicial-br/ |
| peticao-analyzer | peticao, contestacao, analisar processo, CAPPD | core/peticao-analyzer/ |
| jurisprudencia-miner | jurisprudencia, sumula, tese STJ, precedente | core/jurisprudencia-miner/ |
| dje-monitor | DJE, DOU, prazo processual, intimacao | core/dje-monitor/ |
| tese-juridica-validator | validar argumento, minha tese e, tese solida | core/tese-juridica-validator/ |
| calculadora-processual | juros, correcao monetaria, SELIC, IPCA, honorarios, custas, multa, astreintes | core/calculadora-processual/ |

### magistrado/ — Especificas para a magistratura

| Skill | Triggers | Path |
|-------|----------|------|
| audiencia-analyzer | audiencia, ata, depoimento, oitiva, testemunha, transcricao | magistrado/audiencia-analyzer/ |
| conciliacao-assistant | acordo, conciliacao, ZOPA, CEJUSC, mediacao | magistrado/conciliacao-assistant/ |
| contrato-analyzer-br | contrato, clausula abusiva, locacao, financiamento | magistrado/contrato-analyzer-br/ |
| prompt-forge-juridico | prompt para, instrucao para IA, template juridico | magistrado/prompt-forge-juridico/ |
| despacho-generator | despacho, cite-se, intime-se, emende, ato ordinatorio, audiencia designada | magistrado/despacho-generator/ |
| checklist-saneamento | saneamento, saneador, pontos controvertidos, onus da prova, art. 357 | magistrado/checklist-saneamento/ |
| relatorio-produtividade | produtividade, meta CNJ, acervo, congestionamento, gargalos | magistrado/relatorio-produtividade/ |

### pesquisador/ — Producao academica e gestao do conhecimento

| Skill | Triggers | Path |
|-------|----------|------|
| academic-writer-br | artigo cientifico, ABNT, Qualis, dissertacao | pesquisador/academic-writer-br/ |
| lex-pkm-juridico | nota juridica, PKM, Obsidian, segundo cerebro | pesquisador/lex-pkm-juridico/ |

### automacao/ — Integracao com sistemas e pipelines

| Skill | Triggers | Path |
|-------|----------|------|
| lex-document-ocr | OCR, extrair PDF, processar certidao | automacao/lex-document-ocr/ |
| lex-rag-builder | RAG, vector store, embedding juridico | automacao/lex-rag-builder/ |
| n8n-workflow-generator | n8n, workflow, automacao | automacao/n8n-workflow-generator/ |
| n8n-legal-config | configurar n8n, node juridico, AI Agent node | automacao/n8n-legal-config/ |

### criacao/ — Conteudo e publicacoes

| Skill | Triggers | Path |
|-------|----------|------|
| social-content-juridico | post, carrossel, LinkedIn, Reels juridico | criacao/social-content-juridico/ |
| ficao-digital-juvenil | ficcao, capitulo, personagem adolescente, YA | criacao/ficao-digital-juvenil/ |

---

## Workflows Principais

### Sentenca Civel (mais comum)
1. peticao-analyzer (CAPPD) → 2. jurisprudencia-miner (3 Niveis) → 3. sentenca-judicial-br (FIRAC-JB)

### Saneamento Completo
1. peticao-analyzer (consolidado) → 2. checklist-saneamento (art. 357) → 3. calculadora-processual (honorarios periciais)

### Despacho Rapido
1. peticao-analyzer (resumo) → 2. despacho-generator (modelo por fase)

### Conciliacao Fundamentada
1. peticao-analyzer (CAPPD) → 2. jurisprudencia-miner (parametros) → 3. conciliacao-assistant (ZOPA)

---

## Nota

Este arquivo e um INDEX — as instrucoes completas de cada skill estao no respectivo SKILL.md.
Sempre leia o SKILL.md completo antes de gerar qualquer output.
