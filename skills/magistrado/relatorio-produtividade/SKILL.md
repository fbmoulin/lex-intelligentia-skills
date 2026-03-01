---
name: relatorio-produtividade
description: Templates de relatorio de produtividade judicial com metricas CNJ — Metas 1, 2 e 4, acervo, taxa de congestionamento, tempo medio de tramitacao, indice de conciliacao e analise de gargalos. Gera relatorios acionaveis com diagnostico e recomendacoes para melhoria de desempenho da vara. Usar quando o usuario precisar gerar relatorio de produtividade, analisar metricas da vara, verificar metas do CNJ, avaliar acervo, medir tempo medio de processos, analisar taxa de conciliacao, identificar gargalos ou preparar relatorio para corregedoria. Triggers: "produtividade", "meta CNJ", "Meta 1", "Meta 2", "acervo", "congestionamento", "tempo medio", "conciliacao", "gargalos", "relatorio da vara", "corregedoria", "indicadores", "desempenho judicial".
---

# Relatorio Produtividade — Metricas CNJ e Analise de Desempenho Judicial

## Overview

Skill para geracao de relatorios estruturados de produtividade judicial com base nas metricas oficiais do CNJ (Justica em Numeros). Cada template inclui indicadores quantitativos, diagnostico e recomendacoes acionaveis. Projetado para uso mensal/trimestral pelo magistrado e equipe de gabinete.

## When to Use

- Gerar relatorio mensal/trimestral de produtividade
- Avaliar cumprimento das Metas CNJ
- Identificar gargalos na tramitacao
- Preparar relatorio para corregedoria ou inspecao
- Planejar acoes de melhoria do acervo

**When NOT to Use:**
- Estatisticas de Tribunal (escopo distinto — Presidencia/Corregedoria)
- Relatorios de atividade do MP ou Defensoria
- Gestao orcamentaria da vara (requer dados financeiros)

---

## 1. Painel de Indicadores — Visao Geral

```
RELATORIO DE PRODUTIVIDADE — [VARA] — [MES/ANO]

======================================================
INDICADORES-CHAVE
======================================================

| Indicador                    | Valor Atual | Periodo Anterior | Variacao |
|------------------------------|-------------|------------------|----------|
| Acervo total                 | [N]         | [N-1]            | [+/-N%]  |
| Casos novos (mes)            | [N]         | [N-1]            | [+/-N%]  |
| Casos baixados (mes)         | [N]         | [N-1]            | [+/-N%]  |
| Sentencas proferidas         | [N]         | [N-1]            | [+/-N%]  |
| Decisoes interlocutorias     | [N]         | [N-1]            | [+/-N%]  |
| Despachos                    | [N]         | [N-1]            | [+/-N%]  |
| Audiencias realizadas        | [N]         | [N-1]            | [+/-N%]  |
| Taxa de congestionamento     | [N%]        | [N-1%]           | [+/-pp]  |
| Tempo medio ate sentenca     | [N dias]    | [N-1 dias]       | [+/-N%]  |
| Indice de conciliacao        | [N%]        | [N-1%]           | [+/-pp]  |

Periodo de referencia: [DATA_INICIO] a [DATA_FIM]
Fonte dos dados: [SISTEMA — PJe / SAJ / EPROC / PROJUDI]
```

---

## 2. Metas CNJ

### Meta 1 — Julgar mais que distribuir

```
META 1 — JULGAR MAIS PROCESSOS QUE OS DISTRIBUIDOS

Formula: Casos baixados / Casos novos >= 100%

Periodo: [ANO]
Casos novos no periodo: [N]
Casos baixados no periodo: [N]
Indice de atendimento a demanda (IAD): [N/N = X%]

Status: [CUMPRIDA (>=100%) / NAO CUMPRIDA (<100%)]

[SE NAO CUMPRIDA:]
Deficit: [N] processos
Projecao para cumprir ate dezembro: [N processos/mes necessarios]
Recomendacao: [ACAO CONCRETA]
```

**O que conta como "baixado":**
- Sentenca de merito (art. 487, CPC)
- Extincao sem merito (art. 485, CPC)
- Acordo homologado
- Remessa ao juizo competente (redistribuicao)

### Meta 2 — Julgar processos antigos

```
META 2 — IDENTIFICAR E JULGAR PROCESSOS MAIS ANTIGOS

Criterio CNJ [ANO]: Julgar [X%] dos processos distribuidos ate [DATA_CORTE].

Acervo anterior a [DATA_CORTE]: [N] processos
Julgados no periodo: [N]
Percentual atingido: [N%]

Status: [CUMPRIDA / NAO CUMPRIDA]

[SE NAO CUMPRIDA:]
Processos remanescentes: [N]
Os 10 mais antigos:
| # | Processo | Distribuicao | Classe | Assunto | Motivo da demora |
|---|----------|-------------|--------|---------|------------------|
| 1 | [CNJ]    | [DATA]      | [TIPO] | [ASSUNTO] | [MOTIVO]       |
| 2 | [CNJ]    | [DATA]      | [TIPO] | [ASSUNTO] | [MOTIVO]       |
...

Recomendacao: [ACAO CONCRETA — mutirao, pauta concentrada, etc.]
```

### Meta 4 — Priorizar acoes coletivas e precedentes

```
META 4 — ACOES COLETIVAS E PRECEDENTES QUALIFICADOS

Acoes coletivas no acervo: [N]
Julgadas no periodo: [N]
IRDR/IAC em tramitacao: [N]
Processos sobrestados por afetacao: [N]

Status: [EM DIA / PENDENTE]

Recomendacao: [ACAO — priorizar pauta, designar gabinete auxiliar, etc.]
```

---

## 3. Analise do Acervo

```
COMPOSICAO DO ACERVO — [DATA]

Por classe processual:
| Classe                    | Quantidade | % do Acervo | Tempo Medio |
|---------------------------|-----------|-------------|-------------|
| Procedimento Comum        | [N]       | [N%]        | [N dias]    |
| Cumprimento de Sentenca    | [N]       | [N%]        | [N dias]    |
| Execucao Fiscal            | [N]       | [N%]        | [N dias]    |
| Juizado Especial           | [N]       | [N%]        | [N dias]    |
| Cautelares/Tutelas         | [N]       | [N%]        | [N dias]    |
| Outros                     | [N]       | [N%]        | [N dias]    |

Por fase processual:
| Fase                       | Quantidade | % do Acervo |
|----------------------------|-----------|-------------|
| Inicial (ate citacao)      | [N]       | [N%]        |
| Postulatoria (contestacao) | [N]       | [N%]        |
| Saneamento/Instrucao       | [N]       | [N%]        |
| Concluso para sentenca     | [N]       | [N%]        |
| Cumprimento/Execucao       | [N]       | [N%]        |
| Suspenso/Sobrestado        | [N]       | [N%]        |

INSIGHT: [OBSERVACAO — ex: 40% do acervo esta em cumprimento de sentenca, indicando gargalo pos-decisorio]
```

---

## 4. Taxa de Congestionamento

```
TAXA DE CONGESTIONAMENTO

Formula CNJ: 1 - (Baixados / (Novos + Pendentes))

Novos no periodo: [N]
Pendentes no inicio: [N]
Baixados no periodo: [N]

Taxa: [N%]

Referencia nacional (1o grau): ~70-75% (Justica em Numeros [ANO])
Posicao da vara: [ABAIXO/NA MEDIA/ACIMA da referencia]

Interpretacao:
- < 60%: Vara produtiva, acervo sob controle
- 60-75%: Faixa esperada para vara civel de volume medio
- 75-85%: Atencao — acervo crescendo, avaliar gargalos
- > 85%: Critico — risco de acumulo insustentavel
```

---

## 5. Tempo Medio de Tramitacao

```
TEMPO MEDIO POR FASE

| Fase                              | Tempo Medio | Benchmark CNJ | Status    |
|-----------------------------------|-------------|---------------|-----------|
| Distribuicao → Citacao            | [N dias]    | [N dias]      | [OK/ALTO] |
| Citacao → Contestacao             | [N dias]    | [N dias]      | [OK/ALTO] |
| Contestacao → Saneamento          | [N dias]    | [N dias]      | [OK/ALTO] |
| Saneamento → Audiencia            | [N dias]    | [N dias]      | [OK/ALTO] |
| Audiencia → Sentenca              | [N dias]    | [N dias]      | [OK/ALTO] |
| Distribuicao → Sentenca (total)   | [N dias]    | [N dias]      | [OK/ALTO] |
| Sentenca → Transito em julgado    | [N dias]    | [N dias]      | [OK/ALTO] |

GARGALO PRINCIPAL: [FASE] — [N dias] acima da media
CAUSA PROVAVEL: [HIPOTESE — ex: falta de oficial de justica, excesso de pericias, pauta congestionada]
RECOMENDACAO: [ACAO]
```

---

## 6. Indice de Conciliacao

```
CONCILIACAO — [PERIODO]

Audiencias de conciliacao designadas: [N]
Audiencias realizadas: [N]
Acordos obtidos: [N]
Indice de conciliacao: [N%] (acordos / audiencias realizadas)

Acordos em outras fases (peticionamento): [N]
Total de solucoes consensuais: [N]

Referencia CNJ: ~12-15% (1o grau civel)

[SE ABAIXO DA MEDIA:]
Fatores possiveis:
- [  ] Partes sem advogado presente
- [  ] Materia com baixo potencial conciliatorio (ex: fazenda publica)
- [  ] Ausencia de conciliador capacitado
- [  ] Audiencia virtual sem preparo previo

Recomendacoes:
1. [ACAO 1 — ex: semana de conciliacao, pauta concentrada]
2. [ACAO 2 — ex: capacitacao de conciliadores, nucleo de mediacao]
```

---

## 7. Diagnostico de Gargalos

```
ANALISE DE GARGALOS — [PERIODO]

TOP 5 GARGALOS IDENTIFICADOS:

1. [GARGALO]: [DESCRICAO]
   - Impacto: [N processos afetados]
   - Causa raiz: [ANALISE]
   - Acao sugerida: [RECOMENDACAO]
   - Prazo estimado: [PRAZO]
   - Responsavel: [MAGISTRADO / SECRETARIA / TJ]

2. [GARGALO]: [DESCRICAO]
   - Impacto: [N processos afetados]
   - Causa raiz: [ANALISE]
   - Acao sugerida: [RECOMENDACAO]

3. [GARGALO]: ...
4. [GARGALO]: ...
5. [GARGALO]: ...
```

### Gargalos Tipicos e Solucoes

| Gargalo | Causa Comum | Solucao Sugerida |
|---------|-------------|------------------|
| Citacao demorada | Falta de oficiais / endereco incorreto | Citacao eletronica (art. 246, §1), convênio com Correios |
| Pericia lenta | Poucos peritos cadastrados | Ampliar cadastro, fixar prazos curtos com cobranca |
| Pauta congestionada | Audiencias longas demais | Otimizar tempo por audiencia, pautas concentradas |
| Processos conclusos parados | Volume excessivo | Mutirao de sentencas, estagiarios para minutas |
| Cumprimento de sentenca sem citacao | Endereco desatualizado | Oficios a Receita/CNIS, pesquisa SISBAJUD |
| Execucao fiscal inativa | Falta de bens | Verificacao SISBAJUD/RENAJUD periodica, prescrição intercorrente |

---

## 8. Plano de Acao

```
PLANO DE ACAO — [PERIODO SEGUINTE]

PRIORIDADE 1 (Impacto imediato):
- [ ] [ACAO] — Meta: [N] processos — Prazo: [DATA]
- [ ] [ACAO] — Meta: [N] processos — Prazo: [DATA]

PRIORIDADE 2 (Medio prazo):
- [ ] [ACAO] — Meta: [INDICADOR] — Prazo: [DATA]
- [ ] [ACAO] — Meta: [INDICADOR] — Prazo: [DATA]

PRIORIDADE 3 (Estrutural):
- [ ] [ACAO] — Meta: [INDICADOR] — Prazo: [DATA]

RESPONSAVEIS:
- Magistrado: [ACOES]
- Diretor de Secretaria: [ACOES]
- Assessores: [ACOES]
- CEJUSC: [ACOES]
```

---

## Erros Comuns a Evitar

| Erro | Correto |
|------|---------|
| Confundir baixados com sentenciados | Baixados inclui extincoes, acordos e redistribuicoes |
| Meta 1 calculada por sentencas | Meta 1 = baixados / distribuidos |
| Congestionamento = pendentes/novos | Formula: 1 - (baixados / (novos + pendentes)) |
| Ignorar processos sobrestados no acervo | Sobrestados contam no acervo ate o julgamento do precedente |
| Conciliacao = % de sentencas | Conciliacao = acordos / audiencias realizadas |
| Comparar varas de competencias distintas | Benchmarks devem respeitar a matéria (civel, familia, fazenda) |

---

## Integracao no Ecossistema

- **Standalone:** Nao depende de outras skills para funcionar (dados vem do sistema processual)
- **Complementa:** `checklist-saneamento` (tempo medio na fase de saneamento como metrica)
- **Complementa:** `despacho-generator` (volume de despachos como indicador de produtividade)
