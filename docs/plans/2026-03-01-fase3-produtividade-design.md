# Fase 3 — 4 Skills de Produtividade Judicial

**Data:** 2026-03-01
**Status:** APROVADO
**Objetivo:** Criar 4 novas skills focadas em acelerar o trabalho diario do magistrado e gabinete.

## Skills a Criar

### 1. despacho-generator (magistrado/)
- 20+ modelos de despacho por fase processual (inicial, saneamento, instrucao, pos-sentenca)
- Cada modelo: texto completo com placeholders + variacoes + artigos corretos
- ~250 linhas estimadas

### 2. calculadora-processual (core/)
- Tabelas de referencia: juros, correcao, honorarios, custas, multas
- Formulas por tipo + indice correto + termo inicial + fundamentacao
- Referencia cruzada com sentenca-judicial-br (juros/EC 113)
- ~200 linhas estimadas

### 3. relatorio-produtividade (magistrado/)
- Templates de relatorio com metricas CNJ (Metas 1/2/4)
- Secoes: acervo, tempo medio, conciliacao, gargalos
- Analise acionavel com recomendacoes
- ~180 linhas estimadas

### 4. checklist-saneamento (magistrado/)
- Checklist art. 357 CPC (5 incisos)
- Template de decisao saneadora completa
- Integracao com peticao-analyzer (CAPPD → pontos controvertidos)
- ~200 linhas estimadas

## Ordem de Implementacao

1. despacho-generator (maior volume diario)
2. checklist-saneamento (maior complexidade decisoria)
3. calculadora-processual (referencia transversal)
4. relatorio-produtividade (complementar)

## Integracao no Ecossistema

- despacho-generator: alimentado por peticao-analyzer + dje-monitor
- checklist-saneamento: consome CAPPD do peticao-analyzer
- calculadora-processual: referenciado por sentenca-judicial-br
- relatorio-produtividade: standalone (dados externos)

## Apos Implementacao

- Adicionar ao README (tabela de skills)
- Atualizar ARQUITETURA-LEX-INTELLIGENTIA.md (mapa de dependencias)
- Sincronizar com skills-individuais/
- Testar com caso bancario onde aplicavel
