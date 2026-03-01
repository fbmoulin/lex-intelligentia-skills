---
name: sentenca-judicial-br
description: Usar quando o usuario pedir para redigir, revisar ou estruturar decisoes judiciais brasileiras — sentencas, decisoes interlocutorias, tutelas, liminares ou qualquer provimento jurisdicional. Triggers: "sentenca", "decisao", "despacho", "julgamento", "FIRAC", "dispositivo", "fundamentacao", "relatorio judicial", "tutela", "liminar", "acordao", "minuta".
---

# Sentenca Judicial BR — Gerador de Decisoes para o Judiciario Brasileiro

## Overview

Skill para geracao de minutas de sentenca e decisoes judiciais no padrao do Poder Judiciario brasileiro, utilizando a metodologia **FIRAC-JB** (Facts, Issues, Rules, Application, Conclusion) adaptada ao sistema de civil law. Cada citacao de jurisprudencia segue o protocolo anti-alucinacao de 3 niveis.

## When to Use

- Redigir minutas de sentenca civel
- Redigir decisoes interlocutorias (tutelas, liminares)
- Redigir despachos fundamentados
- Revisar ou reestruturar decisoes existentes
- Fundamentar com precedentes STJ/STF

**When NOT to Use:**
- Sentencas penais (requer skill separada com dosimetria)
- Acordaos de Tribunal (estrutura distinta com voto e ementa)
- Pareceres ou pecas advocaticias (usar `peticao-analyzer`)

---

## Protocolo Anti-Alucinacao

**OBRIGATORIO:** Toda citacao de jurisprudencia deve seguir o protocolo de 3 niveis (ver `GUIA-ANTI-ALUCINACAO.md`):

| Nivel | Quando | Formato |
|-------|--------|---------|
| CONFIRMADO | Tese amplamente conhecida, Sumula com numero certo | Citar normalmente + "[CONFIRMAR no tribunal]" |
| PROVAVEL | Tendencia jurisprudencial consistente | "Ha tendencia no sentido de..." + "[VERIFICAR]" |
| INCERTO | Sem informacao segura | Declarar incerteza + fornecer links de busca |

---

## Metodologia FIRAC Judicial Brasileiro

A metodologia **FIRAC-JB** e uma adaptacao ao sistema juridico civil-law do Brasil (ver `METODOLOGIA-FIRAC-JB.md`):

| Elemento | Equivalente na Sentenca | Secao |
|----------|------------------------|-------|
| **F**acts | Sintese dos fatos narrados na peticao + provas | RELATORIO |
| **I**ssues | Questoes juridicas controvertidas | Inicio da FUNDAMENTACAO |
| **R**ules | Normas, sumulas, teses STJ/STF aplicaveis | FUNDAMENTACAO (normativa) |
| **A**nalysis | Subsuncao do fato a norma com analise probatoria | FUNDAMENTACAO (analitica) |
| **C**onclusion | Provimento / Desprovimento + Dispositivo | DISPOSITIVO |

### Fundamentacao Analitica — Art. 489, §1°, CPC

Uma decisao **nao esta fundamentada** (nula) quando o juiz:

1. Se limita a indicacao ou reproducao de ato normativo, sem explicar a relacao com a causa
2. Emprega conceitos juridicos indeterminados, sem explicar o motivo concreto da incidencia
3. Invoca motivos que se prestariam a justificar qualquer outra decisao
4. Nao enfrenta todos os argumentos capazes de infirmar a conclusao adotada
5. Se limita a invocar precedente ou sumula, sem identificar fundamentos determinantes nem demonstrar que o caso se ajusta
6. Deixa de seguir sumula ou precedente invocado pela parte, sem demonstrar distincao ou superacao

---

## Estrutura Canonica da Sentenca Brasileira

```
PODER JUDICIARIO DO ESTADO DO ESPIRITO SANTO
[Comarca/Vara]

Processo n: [numero CNJ]
Autor(es): [nome(s)]
Reu(s): [nome(s)]
Natureza: [classe processual]

SENTENCA

I — RELATORIO

[Sintese objetiva: quem e o autor, o que pediu, fundamentos faticos e juridicos da
inicial; contestacao do reu; eventuais replicas e manifestacoes; provas produzidas]

II — FUNDAMENTACAO

2.1. Da(s) Questao(oes) Preliminar(es)
[Se houver: prescricao, decadencia, ilegitimidade, inepcia, etc.]

2.2. Do Merito
[Analise por topicos das questoes controvertidas]

2.2.1. [Primeira questao de merito]
[Norma aplicavel -> analise fatica -> subsuncao -> conclusao parcial]

2.2.2. [Segunda questao de merito, se houver]

III — DISPOSITIVO

[Resultado: julgo PROCEDENTE / IMPROCEDENTE / PROCEDENTE EM PARTE]
[Condena/absolve / declara / constitui / desconstitui]
[Honorarios advocaticios: art. 85, CPC]
[Custas processuais]
[Prazo recursal: art. 1.009, CPC – 15 dias uteis]

[Cidade], [data].

[Nome do Magistrado]
Juiz(a) de Direito da [X]a Vara Civel de [Comarca]
```

---

## Templates por Area do Direito

### 1. Direito Bancario — Revisao Contratual + Dano Moral

**Questoes tipicas:**
- Capitalizacao de juros (Sumula 541/STJ — permitida se pactuada)
- Tarifa de cadastro (Sumula 566/STJ — licita em contratos posteriores a Resolucao CMN 3.518/2007, de 30/4/2008)
- Juros moratorios legais (art. 406, CC — taxa referencial SELIC; na falta de convencao, aplica-se a taxa de juros para mora fiscal)
- Dano moral por negativacao indevida (jurisprudencia consolidada do STJ — dano moral in re ipsa)

**Fundamentacao padrao para negativacao indevida:**
```
A inscricao indevida do nome do consumidor em cadastros de inadimplentes
configura dano moral in re ipsa, dispensando prova do prejuizo, conforme
entendimento consolidado no Superior Tribunal de Justica em multiplos
julgados das Turmas de Direito Privado. [CONFIRMAR precedente especifico
aplicavel ao caso no site do STJ]
O valor da indenizacao deve observar os criterios da proporcionalidade e
razoabilidade, vedado o enriquecimento sem causa (art. 944, CC).
Considerando as circunstancias do caso — [gravidade da conduta, condicao
economica das partes, carater pedagogico-preventivo] — fixo a indenizacao
por danos morais em R$ [valor].
```

**Observacao:** A Sumula 385/STJ dispoe que, havendo anotacao preexistente
legitima, nao cabe indenizacao por dano moral. Verificar se o autor possui
outras inscricoes vigentes antes de reconhecer o dano in re ipsa.

**Tese STJ sobre tarifa de cadastro (Temas 618/619):**
```
O Superior Tribunal de Justica, por sua Segunda Secao, em julgamento sob
o rito dos recursos repetitivos (REsp 1.251.331/RS — Temas 618/619),
consolidou o entendimento de que e licita a cobranca da tarifa de cadastro
no inicio do relacionamento entre consumidor e instituicao financeira,
nos contratos posteriores a 30/4/2008 (Resolucao CMN 3.518/2007).
Quanto a tarifa de avaliacao do bem, e admitida desde que o servico tenha
sido efetivamente prestado e o valor nao seja abusivo.
```

---

### 2. Direito do Consumidor — CDC

**Questoes tipicas:**
- Vicio do produto/servico (arts. 18 a 25, CDC)
- Fato do produto/servico — responsabilidade objetiva (arts. 12-14, CDC)
- Inversao do onus da prova (art. 6, VIII, CDC)
- Praticas abusivas (art. 39, CDC)

**Bloco de inversao do onus:**
```
Reconheco a hipossuficiencia tecnica do autor/consumidor frente ao fornecedor,
razao pela qual inverto o onus da prova, nos termos do art. 6, VIII, do
Codigo de Defesa do Consumidor, cabendo ao reu demonstrar a inexistencia
do vicio alegado ou a ausencia de nexo causal.
```

**Dano moral consumerista:**
```
Na relacao de consumo, o dano moral decorre da situacao vivenciada pelo
consumidor que, privado da efetiva fruicao do bem ou servico contratado,
experimenta constrangimento, angustia e frustracao que transcendem o mero
dissabor cotidiano. [CONFIRMAR precedente especifico no STJ]
```

---

### 3. Acoes Possessorias — Reintegracao e Manutencao

**Requisitos do art. 561, CPC:**
```
Para a procedencia do pedido possessorio, cumpre ao autor demonstrar:
(i) a posse anterior — [analise da prova];
(ii) o esbulho/turbacao praticado pelo reu — [analise da prova];
(iii) a data do esbulho/turbacao — [analise da prova]; e
(iv) a continuacao da perda ou ameaca — [analise da prova].

[Conclusao: estando/nao estando presentes os requisitos legais, julgo
PROCEDENTE/IMPROCEDENTE o pedido de reintegracao/manutencao de posse]
```

---

### 4. Usucapiao

**Mapa das modalidades:**

| Modalidade | Prazo | Dispositivo | Requisitos |
|------------|-------|-------------|------------|
| Extraordinaria | 15 anos (10 com moradia/trabalho) | Art. 1.238, CC | Posse mansa, pacifica, ininterrupta, sem titulo nem boa-fe |
| Ordinaria | 10 anos (5 com moradia) | Art. 1.242, CC | Justo titulo + boa-fe |
| Especial urbana | 5 anos | Art. 183, CF; Art. 1.240, CC | Area <= 250m2, moradia propria, sem outro imovel |
| Especial rural | 5 anos | Art. 191, CF; Art. 1.239, CC | Area <= 50ha, tornando produtiva, sem outro imovel |
| Familiar | 2 anos | Art. 1.240-A, CC | Ex-conjuge/companheiro abandonou o lar |

**Bloco padrao de fundamentacao:**
```
A usucapiao e modalidade originaria de aquisicao de propriedade, fundada
na posse prolongada e qualificada, cujos requisitos encontram-se previstos
nos arts. [X] do Codigo Civil e [Y] da Constituicao Federal.

Analisando as provas produzidas nos autos — especialmente [provas:
testemunhal/documental/pericia] —, constata-se que o autor exerce posse
[mansa/pacifica/ininterrupta] sobre o imovel [descricao] desde [data],
perfazendo o prazo legal de [X] anos exigido para a modalidade pleiteada.

[Ausencia de impugnacao a posse / posse nao contestada / ausencia de
acao possessoria ou petitoria por parte dos confrontantes]
```

---

### 5. Tutela de Urgencia — Tutela Provisoria

**Requisitos do art. 300, CPC:**
```
A tutela provisoria de urgencia pressupoe, nos termos do art. 300 do
CPC/2015, a demonstracao de: (i) probabilidade do direito — fumus boni
iuris; e (ii) perigo de dano ou risco ao resultado util do processo —
periculum in mora.

Quanto a probabilidade do direito: [analise dos elementos probatorios
apresentados com a peticao inicial].

Quanto ao periculum in mora: [analise do risco de dano irreparavel ou
de dificil reparacao].

[Presentes/Ausentes] os requisitos legais, [defiro/indefiro] a tutela
de urgencia pleiteada para [objeto da tutela].
```

---

### 6. Responsabilidade Civil — Dano e Nexo

**Tripe da responsabilidade civil subjetiva (art. 186, CC):**
```
A responsabilidade civil subjetiva, na forma do art. 186 c/c art. 927
do Codigo Civil, exige a presenca concomitante de tres elementos:
(a) conduta antijuridica [comissiva/omissiva];
(b) dano [material/moral/estetico]; e
(c) nexo de causalidade entre a conduta e o dano.

[Analise de cada elemento com as provas dos autos]
```

**Responsabilidade objetiva (art. 927, paragrafo unico, CC):**
```
Cuida-se de hipotese de responsabilidade civil objetiva, fundada no
risco da atividade desenvolvida pelo reu (art. 927, paragrafo unico, CC),
prescindindo da demonstracao de culpa, bastando a prova do dano e do nexo
de causalidade.
```

---

## Juros de Mora e Correcao Monetaria — Termos Iniciais

**ATENCAO:** O termo inicial dos juros de mora varia conforme a natureza da responsabilidade. Erro neste ponto e motivo frequente de embargos de declaracao.

### Responsabilidade Extracontratual (ilicito civil, CDC, acidente)
```
Juros de mora: desde o EVENTO DANOSO (Sumula 54/STJ).
[CONFIRMAR Sumula 54/STJ — "Os juros moratorios fluem a partir
do evento danoso, em caso de responsabilidade extracontratual"]

Correcao monetaria sobre dano MATERIAL: desde cada desembolso
(Sumula 43/STJ — "Incide correcao monetaria sobre divida por
ato ilicito a partir da data do efetivo prejuizo").
[CONFIRMAR Sumula 43/STJ]

Correcao monetaria sobre dano MORAL: desde o arbitramento
(Sumula 362/STJ — "A correcao monetaria do valor da
indenizacao do dano moral incide desde a data do
arbitramento").
[CONFIRMAR Sumula 362/STJ]
```

### Responsabilidade Contratual (inadimplemento de contrato)
```
Juros de mora: desde a CITACAO (art. 405, CC).

Correcao monetaria: desde o vencimento da obrigacao.
```

### Fazenda Publica (EC 113/2021, art. 3)
```
Debitos judiciais contra a Fazenda Publica: aplica-se
exclusivamente a taxa SELIC, que ja engloba juros de mora
E correcao monetaria. Nao cumulam IPCA + juros separados.

Termo inicial: desde a citacao (precatorios) ou desde o
transito em julgado (RPV), conforme o caso.
```

### Indice de Correcao — Relacoes Privadas
```
Regra geral: IPCA-E (indice oficial de inflacao).
NAO aplicar Selic em relacoes privadas (Selic e para
Fazenda Publica — EC 113/2021).
```

---

## Tratamento da Tutela Provisoria na Sentenca

Quando houver pedido de tutela de urgencia (deferida ou indeferida antes da sentenca), INCLUIR tratamento expresso no dispositivo:

### Se a tutela foi DEFERIDA e a sentenca e de procedencia
```
Confirmo a tutela de urgencia anteriormente deferida (fls. XX),
que subsistira ate o transito em julgado, nos termos do
art. 1.012, §1, V, do CPC.
```

### Se a tutela foi DEFERIDA e a sentenca e de improcedencia
```
Revogo a tutela de urgencia anteriormente deferida (fls. XX),
cessando seus efeitos com a publicacao desta sentenca.
```

### Se a tutela foi INDEFERIDA e a sentenca e de procedencia
```
[Nao ha necessidade de mencionar a tutela indeferida — a
sentenca de procedencia ja atende ao pedido. Caso haja
interesse em eficacia imediata, fundamentar com art. 1.012,
§1, CPC]
```

### Se houve pedido mas NAO foi apreciado
```
Quanto a tutela de urgencia requerida, julgo prejudicado o
pedido ante o julgamento do merito da demanda.
```

### Recurso cabivel
```
Registre-se que a presente sentenca esta sujeita a recurso de
apelacao, no prazo de 15 (quinze) dias uteis (art. 1.009, CPC),
a ser dirigido ao Tribunal de Justica do Estado do Espirito
Santo.
```

---

## Formulas para Honorarios Advocaticios (art. 85, CPC)

**Regra geral:**
```
Os honorarios advocaticios sao fixados em [X]% sobre [o valor da
condenacao / o valor da causa / o valor arbitrado na liquidacao],
nos termos do art. 85, §§ 2 e 3, do CPC/2015, observados os criterios
do grau de zelo profissional, lugar de prestacao do servico, natureza e
importancia da causa, trabalho realizado e tempo exigido.
```

**Para Fazenda Publica (art. 85, §§ 3 e 8):**
```
Condeno a Fazenda Publica ao pagamento de honorarios advocaticios,
fixados sobre o valor da condenacao conforme a escala do art. 85, § 3,
do CPC/2015:
- Ate 200 salarios minimos: [X]% (entre 10% e 20%)
- De 200 a 2.000 SM: [Y]% (entre 8% e 10%)
[...]
```

---

## Checklist Pre-Sentenca

Antes de redigir, verificar:

- [ ] Partes corretamente identificadas (qualificacao completa)
- [ ] Numero CNJ do processo
- [ ] Pedidos do autor mapeados (certos, determinados e cumulados)
- [ ] Defesas/excecoes do reu mapeadas
- [ ] Provas produzidas catalogadas
- [ ] Prescricao/decadencia verificadas
- [ ] Questoes preliminares identificadas
- [ ] Normas aplicaveis (CC, CDC, CPC, CF, legislacao especial)
- [ ] Sumulas e teses vinculantes aplicaveis (STJ/STF) — numeros verificados
- [ ] Valor para honorarios
- [ ] Custas processuais (isencao, gratuidade judiciaria)
- [ ] Protocolo anti-alucinacao aplicado em todas as citacoes

---

## Linguagem e Estilo Judicial

**Evitar:**
- Gerundio excessivo: "estando presentes" -> "presentes estao"
- Expressoes coloquiais
- Prolixidade desnecessaria na fundamentacao
- Transcricao integral de peticoes

**Preferir:**
- Construcoes objetivas e diretas
- Citacao as normas com artigo e codigo/lei
- Remissao as sumulas pelo numero
- Fundamentacao analitica (nao apenas citacao de precedentes)

**Tom:** tecnico, impessoal, imparcial, fundamentado (art. 489, CPC).

---

## Common Mistakes

| Erro | Como evitar |
|------|------------|
| Citar Sumula com numero inventado | Protocolo anti-alucinacao — Nivel 2 ou 3 se nao tiver certeza |
| Relatorio como copia da peticao | Sintetizar os fatos relevantes em linguagem propria |
| Fundamentacao generica ("conforme jurisprudencia dominante") | Citar norma + demonstrar subsuncao ao caso concreto (art. 489, §1) |
| Nao enfrentar argumento da parte contraria | Art. 489, §1, IV — todos os argumentos capazes de infirmar devem ser enfrentados |
| Dispositivo ambiguo | Ser explicito: "julgo PROCEDENTE o pedido para CONDENAR o reu a..." |
| Esquecer honorarios ou custas | Sempre incluir no dispositivo — verificar o checklist |
| Confundir resp. subjetiva com objetiva | Verificar se ha previsao legal de risco (art. 927, p.u.) ou relacao de consumo |
| Negativacao indevida + inscricao preexistente | Sumula 385/STJ afasta dano moral se ha anotacao legitima anterior |

---

## Workflow de Uso

1. **Receber** a sintese dos fatos (ou peticao inicial + contestacao)
2. **Identificar** a area do direito e o template aplicavel
3. **Mapear** os pedidos e as defesas
4. **Selecionar** as normas e precedentes relevantes
5. **Aplicar** protocolo anti-alucinacao nas citacoes
6. **Redigir** seguindo a estrutura FIRAC-JB
7. **Verificar** o checklist pre-sentenca (incluindo art. 489, §1)
8. **Entregar** a minuta para revisao do magistrado
