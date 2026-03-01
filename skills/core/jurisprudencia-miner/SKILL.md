---
name: jurisprudencia-miner
description: Usar quando o usuario precisar pesquisar, validar ou analisar jurisprudencia dos tribunais brasileiros (STF, STJ, TJs, TRFs, TST). Usar para encontrar precedentes, sumulas, teses vinculantes, recursos repetitivos ou repercussao geral aplicaveis a um caso. Triggers: "jurisprudencia", "precedente", "sumula", "tese STJ", "repercussao geral", "repetitivo", "acordao", "julgado", "pesquisa jurisprudencial".
---

# Jurisprudencia Miner — Pesquisa e Validacao de Precedentes Brasileiros

## Overview

Skill para pesquisa estruturada e validacao de jurisprudencia brasileira com protocolo anti-alucinacao rigoroso. Nao e um banco de dados de Sumulas — e uma **metodologia de pesquisa** que ensina a encontrar, validar e citar precedentes de forma segura.

## When to Use

- Fundamentar tese com jurisprudencia do STJ/STF
- Identificar divergencia jurisprudencial sobre um tema
- Rastrear evolucao de teses ao longo do tempo
- Validar citacoes de acordaos antes de usar em pecas
- Construir argumentacao jurisprudencial para sentenca ou peticao
- Pesquisar por tema, artigo de lei ou numero de Sumula

**When NOT to Use:**
- Redigir a sentenca (usar `sentenca-judicial-br`)
- Analisar pecas processuais (usar `peticao-analyzer`)
- Validar solidez de uma tese juridica (usar `tese-juridica-validator`)

---

## Protocolo Anti-Alucinacao (OBRIGATORIO)

Citacoes juridicas inventadas destroem credibilidade profissional. Esta skill adota **verificacao obrigatoria** antes de qualquer citacao:

```
REGRA DE OURO: Nunca inventar numero de processo, data de julgamento,
turma ou relator. Se nao tiver certeza, INDICAR que e necessaria
verificacao nas fontes oficiais antes de uso profissional.
```

### Niveis de Confianca

| Nivel | Quando usar | Formato de citacao |
|-------|-------------|-------------------|
| CONFIRMADO | Sumula com numero certo, tese amplamente consolidada | Citar + "[CONFIRMAR no tribunal]" |
| PROVAVEL | Tendencia jurisprudencial consistente | "Ha jurisprudencia no sentido de..." + "[VERIFICAR]" |
| INCERTO | Sem informacao segura da posicao atual | Declarar incerteza + fornecer links de busca |

### Fontes Primarias para Verificacao

| Tribunal | URL de busca |
|----------|-------------|
| STF — Jurisprudencia | https://portal.stf.jus.br/jurisprudencia/ |
| STF — Sumulas Vinculantes | https://portal.stf.jus.br/textos/verTexto.asp?servico=jurisprudenciaSumulaVinculante |
| STJ — Pesquisa | https://scon.stj.jus.br/SCON/ |
| STJ — Teses Repetitivas | https://processo.stj.jus.br/repetitivos/ |
| STJ — Sumulas | https://www.stj.jus.br/sites/portalp/Jurisprudencia/Sumulas |
| TJ-ES — ESIS | https://sistemas.tjes.jus.br/esis/ |
| TRFs — CJF | https://www.cjf.jus.br/juris/ |
| TST | https://jurisprudencia.tst.jus.br/ |

---

## Hierarquia dos Precedentes Brasileiros (art. 927, CPC)

```
[VINCULANTES]
|-- Sumulas Vinculantes do STF
|-- Decisoes em Controle Concentrado (ADI, ADC, ADPF, ADO)
|-- Acordaos em RE com Repercussao Geral
|-- Acordaos em REsp/AREsp Repetitivos
|-- IAC — Incidente de Assuncao de Competencia

[PERSUASIVOS]
|-- Sumulas do STJ e STF (nao vinculantes)
|-- Precedentes das Secoes e Cortes Especiais
|-- Jurisprudencia dos Tribunais de Justica e TRFs
|-- Enunciados do FPPC (Processualistas Civis)
```

---

## Referencia de Sumulas por Area

**ATENCAO:** As sinteses abaixo sao orientativas. SEMPRE verificar o enunciado completo no site do tribunal antes de usar em pecas ou decisoes. Sumulas podem ser revogadas, superadas ou ter redacao diferente da sintese aqui apresentada.

### Direito Bancario

| Referencia | Sintese orientativa | Status |
|-----------|--------------------|---------|
| Sumula 297/STJ | CDC aplica-se as instituicoes financeiras | [VERIFICAR enunciado completo] |
| Sumula 382/STJ | Juros remuneratorios acima de 12% a.a. nao indicam, por si so, abusividade | [VERIFICAR enunciado completo] |
| Sumula 541/STJ | Capitalizacao mensal de juros em contratos bancarios | [VERIFICAR enunciado completo] |
| Sumula 566/STJ | Tarifa de cadastro em contratos bancarios pos-Resolucao CMN 3.518/2007 | [VERIFICAR enunciado completo] |

### Direito do Consumidor

| Referencia | Sintese orientativa | Status |
|-----------|--------------------|---------|
| Sumula 297/STJ | CDC aplica-se as instituicoes financeiras | [VERIFICAR enunciado completo] |
| Sumula 469/STJ | CDC aplica-se aos contratos de planos de saude | [VERIFICAR enunciado completo] |
| Sumula 563/STJ | CDC e entidades abertas de previdencia complementar | [VERIFICAR enunciado completo] |

### Responsabilidade Civil

| Referencia | Sintese orientativa | Status |
|-----------|--------------------|---------|
| Sumula 37/STJ | Cumulacao de danos morais e materiais | [VERIFICAR enunciado completo] |
| Sumula 227/STJ | Pessoa juridica pode sofrer dano moral | [VERIFICAR enunciado completo] |
| Sumula 403/STJ | Uso nao autorizado de imagem e dano moral | [VERIFICAR enunciado completo] |

### Processo Civil

| Referencia | Sintese orientativa | Status |
|-----------|--------------------|---------|
| Art. 927, CPC | Hierarquia de precedentes vinculantes | Lei — nao precisa verificar |
| Art. 489, §1, CPC | Requisitos de fundamentacao analitica | Lei — nao precisa verificar |
| Art. 926, CPC | Dever de uniformizacao e coerencia | Lei — nao precisa verificar |

**Nota:** Foram removidas referencias com descricao incorreta da versao anterior desta skill. Ao pesquisar Sumulas em areas como Familia, Posse, Execucao — sempre consultar diretamente no site do STJ.

---

## Estrategias de Pesquisa por Situacao

### Situacao 1: "Preciso de jurisprudencia para fundamentar [tese X]"

**Processo:**
1. Identificar a area do direito e o ponto juridico especifico
2. Mapear palavras-chave: nome da tese, artigo de lei, parte da ementa
3. Sugerir busca nas fontes primarias com os termos corretos
4. Apresentar Sumulas e temas repetitivos conhecidos (com nivel de confianca)
5. Indicar o caminho de verificacao para uso profissional

**Template de output:**
```
PESQUISA JURISPRUDENCIAL — [Tema]

[PALAVRAS-CHAVE SUGERIDAS]
- "[termo 1]" AND "[termo 2]"
- "[artigo X]" AND "[principio]"

[REFERENCIAS CONHECIDAS] (verificar nas fontes antes de usar)
- Sumula XXX/STJ: [sintese] — [VERIFICAR enunciado completo]
- Tema YYY/STJ (Repetitivo): [sintese da tese] — [VERIFICAR]
- RG Tema ZZZ/STF: [sintese] — [VERIFICAR]

[LINKS PARA VERIFICACAO]
- STJ: https://scon.stj.jus.br/SCON/
- STF: https://portal.stf.jus.br/jurisprudencia/

IMPORTANTE: Confirme numero, data e relator antes de usar em
pecas processuais ou decisoes.
```

### Situacao 2: "Preciso identificar divergencia sobre [questao]"

**Processo:**
1. Apresentar as correntes doutrinarias/jurisprudenciais existentes
2. Mapear os tribunais que adotam cada posicao
3. Identificar se STJ/STF ja pacificou (Sumula, repetitivo, RG) ou se ha IRDR pendente
4. Recomendar posicao mais segura para o caso concreto

### Situacao 3: "Qual a evolucao jurisprudencial sobre [tema]?"

**Processo:**
1. Marcos temporais relevantes (pre e pos-CPC/2015, pre e pos-CDC, etc.)
2. Reviravolta jurisprudencial — indicar quando houve overruling
3. Estado atual consolidado
4. Tendencias identificadas nos julgamentos recentes

---

## Formato de Ementa Estruturada

Para apresentar jurisprudencia, sempre usar:

```
[AREA DO DIREITO]. [TEMA ESPECIFICO]. [TESE CENTRAL].

[Desenvolvimento: fatos -> questao -> aplicacao da norma -> conclusao]

[Dispositivo legal aplicado]

[Tribunal], [Orgao julgador], [Tipo de recurso] n. [numero],
Rel. Min./Des. [nome], j. [data], [publicacao].
```

---

## Pesquisa Tematica por Artigo de Lei

Quando o usuario informar um artigo, identificar:
- Controversias interpretativas conhecidas
- Sumulas relacionadas (com [VERIFICAR])
- Teses em repercussao geral / recursos repetitivos
- Enunciados do FPPC aplicaveis
- Doutrina majoritaria

---

## Common Mistakes

| Erro | Como evitar |
|------|------------|
| Citar Sumula com descricao inventada pelo LLM | SEMPRE verificar enunciado completo no site do tribunal — LLMs frequentemente atribuem descricoes erradas a numeros corretos |
| Confiar em numero de REsp gerado por IA | Nunca citar numero de processo sem verificar na fonte — usar nivel PROVAVEL ou INCERTO |
| Ignorar superacao de precedente | Verificar se a Sumula/tese ainda e vigente — pode ter sido cancelada ou superada |
| Citar ementa sem ler o acordao | A ementa pode nao refletir a tese completa — verificar ratio decidendi |
| Nao fazer distinguishing | Ao aplicar precedente, demonstrar que os fatos do caso se ajustam (art. 489, §1, V, CPC) |
| Tratar Sumula persuasiva como vinculante | Apenas Sumulas Vinculantes do STF vinculam — Sumulas do STJ sao persuasivas (art. 927, IV, CPC) |
| Banco de Sumulas desatualizado | Sumulas podem ser revogadas a qualquer tempo — sempre verificar data da ultima atualizacao |

---

## Integracao com Outras Skills

| De | Para | Uso |
|----|------|-----|
| `peticao-analyzer` | **jurisprudencia-miner** | Teses identificadas na peca -> pesquisar precedentes |
| **jurisprudencia-miner** | `sentenca-judicial-br` | Precedentes encontrados -> fundamentar decisao |
| **jurisprudencia-miner** | `tese-juridica-validator` | Tese + precedentes -> validar solidez |
| `lex-rag-builder` | **jurisprudencia-miner** | Base vetorial de ementas -> busca semantica |

---

## Checklist de Qualidade da Citacao Juridica

Antes de usar qualquer citacao em peca ou decisao:

- [ ] Numero do processo verificado na fonte oficial
- [ ] Data de julgamento confirmada
- [ ] Relator correto
- [ ] Turma/Secao/Pleno correto
- [ ] Tese fixada fiel ao acordao (nao apenas a ementa)
- [ ] Vigencia confirmada (nao houve superacao do precedente)
- [ ] Aplicabilidade ao caso concreto justificada (distinguishing se necessario)
- [ ] Nivel de confianca (CONFIRMADO/PROVAVEL/INCERTO) declarado

---

## Workflow de Uso

1. **Receber** a questao juridica ou tese a fundamentar
2. **Classificar** a area do direito e o tipo de pesquisa
3. **Consultar** Sumulas e temas repetitivos conhecidos (com nivel de confianca)
4. **Sugerir** termos de busca para fontes primarias
5. **Formatar** o output com ementa estruturada
6. **Aplicar** checklist de qualidade em cada citacao
7. **Encaminhar** para `sentenca-judicial-br` ou `tese-juridica-validator`
