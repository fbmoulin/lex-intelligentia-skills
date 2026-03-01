---
name: calculadora-processual
description: Tabelas de referencia para calculos judiciais — juros moratorios e compensatorios, correcao monetaria (IPCA-E, SELIC, INPC), honorarios advocaticios (art. 85 CPC), custas processuais, multas e astreintes. Cada tabela indica formula, indice, termo inicial, fundamentacao e erros comuns. NAO e uma calculadora automatica — e um guia estruturado para o magistrado e gabinete aplicarem a formula correta. Usar quando o usuario precisar consultar indices de correcao, calcular juros, definir honorarios, verificar multas, consultar tabela de custas, calcular astreintes ou fundamentar correcao monetaria em sentenca. Triggers: "juros", "correcao monetaria", "IPCA", "SELIC", "honorarios", "custas", "multa", "astreintes", "calculos judiciais", "liquidacao", "RPV", "precatorio", "art. 85", "art. 523", "art. 537".
---

# Calculadora Processual — Tabelas de Referencia para Calculos Judiciais

## Overview

Skill de referencia estruturada para calculos em decisoes judiciais. Contem tabelas com indice correto, termo inicial, formula e fundamentacao legal para cada tipo de calculo. Nao realiza calculos automaticos — fornece ao magistrado e gabinete a informacao necessaria para aplicar a formula correta na sentenca ou decisao.

## When to Use

- Definir juros e correcao monetaria em sentenca
- Fixar honorarios advocaticios
- Consultar tabela de custas
- Fundamentar multas processuais
- Verificar parametros para RPV/Precatorio

**When NOT to Use:**
- Liquidacao complexa com pericia contabil (requer perito)
- Calculos trabalhistas (indices e regras proprios)
- Calculos tributarios (legislacao especifica)

---

## 1. Juros Moratorios

### Tabela de Juros por Tipo de Obrigacao

| Tipo | Taxa | Termo Inicial | Fundamentacao | Observacao |
|------|------|---------------|---------------|------------|
| Responsabilidade extracontratual | 1% a.m. (CC) ou SELIC | Evento danoso (Sumula 54/STJ) | Art. 398, CC + Sumula 54/STJ | SELIC ja inclui correcao |
| Responsabilidade contratual | 1% a.m. (CC) ou taxa contratual | Citacao valida (art. 405, CC) | Art. 405, CC | Se contrato preve taxa, aplica-se a contratual ate o limite legal |
| Alimentos | 1% a.m. | Citacao | Art. 405, CC | Cada parcela vence no dia fixado |
| Fazenda Publica (pre-EC 113) | 1% a.m. ate 09/12/2021 | Citacao (ou evento danoso se extracontratual) | Art. 1-F, Lei 9.494/97 (redacao LC 150/2015) | IPCA-E para correcao |
| Fazenda Publica (pos-EC 113) | SELIC (juros + correcao) | A partir de 09/12/2021 | Art. 3, EC 113/2021 | SELIC UNICA — sem correcao separada |
| Repetição de indebito | 1% a.m. | Citacao (ou pagamento indevido, se ma-fe) | Art. 405 CC c/c art. 876, CC | Sumula 188/STJ: a partir do pagamento indevido |

### Regra da SELIC como Indice Unico

Quando se aplica SELIC como taxa de juros, **NAO** se aplica correcao monetaria separada, pois a SELIC ja embute componente de correcao. Cumular SELIC + IPCA-E e ERRO (bis in idem).

---

## 2. Correcao Monetaria

### Tabela de Indices por Contexto

| Contexto | Indice | Termo Inicial | Fundamentacao | Publicado por |
|----------|--------|---------------|---------------|---------------|
| Dano moral | IPCA-E (ou SELIC) | Arbitramento (Sumula 362/STJ) | Sumula 362/STJ | IBGE |
| Dano material — emergente | IPCA-E (ou SELIC) | Desembolso efetivo | Art. 389, CC | IBGE |
| Dano material — lucros cessantes | IPCA-E (ou SELIC) | Vencimento de cada parcela | Art. 389, CC | IBGE |
| Contratos bancarios | IPCA-E (ou indice contratual) | Vencimento da obrigacao | Contrato + art. 389, CC | IBGE / contrato |
| Fazenda Publica pre-EC 113 | IPCA-E | Dano ou citacao | Lei 9.494/97, art. 1-F | IBGE |
| Fazenda Publica pos-EC 113 | SELIC (unica) | 09/12/2021 em diante | Art. 3, EC 113/2021 | BACEN |
| Salarios e beneficios previdenciarios | INPC | Competencia devida | Legislacao previdenciaria | IBGE |
| Alugueis | IGP-M ou IPCA | Vencimento | Contrato (Lei 8.245/91) | FGV / IBGE |
| Depositos judiciais | SELIC | Deposito | Lei 9.703/98 | BACEN |

### Template para Sentenca — Bloco Correcao

```
Correcao monetaria:
- Indice: [IPCA-E / SELIC / INPC / IGP-M]
- Termo inicial: [DATA/EVENTO]
- Fundamentacao: [LEI/SUMULA]
[SE SELIC:] Juros e correcao ja inclusos na SELIC — NAO cumular com outro indice.
[SE IPCA-E:] Acrescer juros de [TAXA] a contar de [TERMO].
```

---

## 3. Honorarios Advocaticios

### Art. 85, CPC — Tabela de Parametros

| Situacao | Faixa | Base de Calculo | Dispositivo |
|----------|-------|-----------------|-------------|
| Regra geral | 10% a 20% | Valor da condenacao, proveito economico ou valor da causa | Art. 85, §2, CPC |
| Fazenda Publica | Escalonado (vide §3) | Valor da condenacao ou proveito economico | Art. 85, §3, CPC |
| Causa de valor inestimavel/irrisorio | Equidade | Apreciacao equitativa | Art. 85, §8, CPC |
| Cumprimento de sentenca | 10% | Valor do debito | Art. 523, §1, CPC |
| Recurso improvido | Majoracao | Observar limite total | Art. 85, §11, CPC |
| Sucumbencia reciproca | Proporcional | Exito de cada parte | Art. 86, CPC |

### Escalonamento Fazenda Publica (art. 85, §3)

| Faixa de Valor (em SM) | Percentual |
|-------------------------|------------|
| Ate 200 SM | 10% a 20% |
| 200 a 2.000 SM | 8% a 10% |
| 2.000 a 20.000 SM | 5% a 8% |
| 20.000 a 100.000 SM | 3% a 5% |
| Acima de 100.000 SM | 1% a 3% |

**Regras importantes:**
- Percentuais sao cumulativos por faixa (como IR)
- Vedacao de compensacao (art. 85, §14) — honorarios sao direito autonomo do advogado
- Majoracao em grau recursal limitada ao teto da faixa (art. 85, §11)
- Gratuidade nao isenta de honorarios — suspende exigibilidade por 5 anos (art. 98, §3)

### Criterios de Fixacao (art. 85, §2)

Para definir o percentual dentro da faixa, considerar:
1. Grau de zelo do profissional
2. Lugar de prestacao do servico
3. Natureza e importancia da causa
4. Trabalho realizado e tempo exigido

---

## 4. Multas Processuais

### Tabela de Multas mais Comuns

| Multa | Percentual/Valor | Base | Dispositivo | Quando Aplica |
|-------|-------------------|------|-------------|---------------|
| Nao pagamento voluntario | 10% | Valor do debito | Art. 523, §1, CPC | Cumprimento de sentença — prazo 15 dias |
| Litigancia de ma-fe | Ate 10% | Valor da causa | Art. 81, CPC | Dolo processual comprovado |
| Ato atentatório (execucao) | Ate 20% | Valor atualizado do debito | Art. 774, p.u., CPC | Fraude, resistencia, embaraco |
| Ausencia injustificada (conciliacao) | Ate 2% | Valor da causa | Art. 334, §8, CPC | Nao comparecimento sem justificativa |
| Embargos protetorios | 2% (1a) + ate 10% (reincidencia) | Valor da causa | Art. 1.026, §§2-3, CPC | Embargos manifestamente protetorios |
| Contempt of court | Ate R$ 100.000 | Valor fixo | Art. 77, §2, CPC | Descumprimento de ordem judicial |

---

## 5. Astreintes (art. 537, CPC)

### Parametros de Fixacao

```
TEMPLATE — FIXACAO DE ASTREINTES

Fixo multa diaria/periodica de R$ [VALOR] por [DIA / SEMANA / MES / DESCUMPRIMENTO],
em caso de descumprimento da obrigacao de [FAZER / NAO FAZER / ENTREGAR],
com termo inicial em [DATA / INTIMACAO / TRANSITO EM JULGADO],
limitada ao valor total de R$ [TETO] (ou sem limite).

Fundamentacao: Art. 537, CPC.
```

**Criterios para definir valor:**
- Proporcionalidade com a obrigacao
- Capacidade economica do devedor
- Suficiencia para coagir (nao pode ser irrisoria)
- Limitacao total (recomendada para evitar enriquecimento sem causa)
- Possibilidade de revisao a qualquer tempo (art. 537, §1)

**Destinatario:** A multa reverte ao CREDOR (nao ao Estado).

---

## 6. Custas e Despesas Processuais

### Tabela de Referencia — Justica Estadual (modelo ES)

| Item | Valor | Base | Observacao |
|------|-------|------|------------|
| Custas iniciais | % sobre valor da causa | Regimento de Custas estadual | Varia por UF |
| Preparo de recurso | % sobre valor da causa ou da condenacao | Art. 1.007, CPC | Complementar em 5 dias se insuficiente |
| Diligencias oficiais de justica | Tabela do Tribunal | Por diligencia | Orcamento previo |
| Pericia judicial | Fixado no despacho | Arbitrado pelo juiz | Art. 465, §2, CPC |
| Atos notariais e de registro | Tabela de emolumentos | Lei estadual | Varia por UF |

### Isencoes e Gratuidade

| Situacao | Isencao | Fundamento |
|----------|---------|------------|
| Gratuidade deferida | Total (suspensa por 5 anos) | Art. 98, CPC |
| Fazenda Publica | Custas ao final | Art. 91, CPC |
| MP como parte | Isento | Art. 128, §5, II, "a", CF |
| Embargos de declaracao | Sem preparo | Art. 1.023, CPC |
| Agravo interno | Sem preparo (maioria dos TJs) | Regimento interno |

---

## 7. RPV e Precatorio

### Limites RPV (Requisicao de Pequeno Valor)

| Ente Federativo | Limite RPV | Fundamentacao |
|-----------------|------------|---------------|
| Uniao Federal | 60 salarios minimos | Art. 17, §1, Lei 10.259/01 |
| Estados (regra geral) | 40 salarios minimos | Art. 87, ADCT (exceto se lei propria) |
| Municipios (regra geral) | 30 salarios minimos | Art. 87, ADCT (exceto se lei propria) |

**Regra:** Valor total da condenacao por beneficiario. Vedado fracionar (Sumula 100/CNJ).

---

## Erros Comuns a Evitar

| Erro | Correto |
|------|---------|
| SELIC + IPCA-E (bis in idem) | SELIC ja inclui correcao — usar sozinha |
| Correcao desde a citacao para dano moral | Desde o ARBITRAMENTO (Sumula 362/STJ) |
| Honorarios sobre valor da causa quando ha condenacao | Base = valor da condenacao (art. 85, §2) |
| Multa do art. 523 contra Fazenda Publica | Fazenda se sujeita ao art. 535, nao ao 523 |
| Astreintes sem teto maximo | Recomendavel fixar limite total |
| Fracionar precatorio em RPVs | Vedado — Sumula 100/CNJ |
| Juros de 1% + SELIC simultaneos | SELIC = juros + correcao |
| Fazenda pos-EC 113 com IPCA-E + juros separados | SELIC unica desde 09/12/2021 |

---

## Integracao no Ecossistema

- **Referenciado por:** `sentenca-judicial-br` (blocos de juros/correcao/honorarios no dispositivo)
- **Referenciado por:** `checklist-saneamento` (honorarios periciais na nomeacao)
- **Referenciado por:** `despacho-generator` (multas, custas, preparo)
- **Complementa:** `peticao-analyzer` (verificar se pedidos de juros/correcao estao corretos)
