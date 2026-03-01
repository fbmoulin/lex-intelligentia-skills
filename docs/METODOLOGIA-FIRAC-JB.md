# Metodologia FIRAC-JB — Raciocínio Jurídico para IA

## O que é o FIRAC?

FIRAC é uma metodologia de raciocínio jurídico estruturado originalmente desenvolvida para o common law (Facts, Issue, Rule, Application, Conclusion). Esta versão — **FIRAC-JB** — é adaptada para o **sistema jurídico brasileiro de civil law**, alinhando cada etapa à estrutura exigida pelo CPC/2015.

## FIRAC-JB — As 5 Etapas

### F — FATOS (→ Relatório, art. 489, I, CPC)
Síntese objetiva dos fatos relevantes ao julgamento.
- Quem são as partes e qual é a relação jurídica entre elas?
- Qual é o evento que deu origem ao litígio?
- Quais fatos são incontroversos e quais são disputados?

### I — ISSUES (→ Questões jurídicas a resolver)
Identificação das questões de direito que devem ser respondidas para julgar o caso.
- Há questões processuais preliminares? (competência, legitimidade, prescrição)
- Qual é a questão de mérito principal?
- Há pedidos subsidiários que precisam de análise separada?

### R — RULES (→ Marco normativo, art. 489, II, CPC)
As normas jurídicas aplicáveis ao caso.
- Qual é a lei ou norma principal que rege a situação?
- Há jurisprudência consolidada do STF/STJ sobre o tema?
- Há súmula, tese repetitiva ou enunciado aplicável?

### A — APPLICATION (→ Subsunção, fundamentação analítica)
Aplicação das normas aos fatos do caso concreto.
- Como os fatos se enquadram (ou não) na norma?
- Os requisitos legais estão preenchidos?
- Como a jurisprudência se aplica a este caso específico?

### C — CONCLUSION (→ Dispositivo, art. 489, III, CPC)
A decisão clara e os seus efeitos.
- Qual é o resultado do julgamento?
- Quais são as consequências (condenação, prazo, multa, custas, honorários)?
- Há recurso cabível e efeito em que é recebido?

## Mapeamento FIRAC-JB → CPC/2015

| FIRAC-JB | Estrutura CPC | Exigência Legal |
|----------|--------------|-----------------|
| FATOS | Relatório | Art. 489, I |
| ISSUES | Questões preliminares + ponto de mérito | Arts. 337, 357 |
| RULES | Marco normativo + jurisprudência | Art. 489, II + §1° |
| APPLICATION | Subsunção analítica | Art. 489, §1°, I-VI |
| CONCLUSION | Dispositivo | Art. 489, III |

## Fundamentação Analítica — Art. 489, §1°, CPC

Uma decisão judicial **não está fundamentada** (nula) quando o juiz:

1. Se limitar à indicação, à reprodução ou à paráfrase de ato normativo, sem explicar sua relação com a causa
2. Empregar conceitos jurídicos indeterminados, sem explicar o motivo concreto de sua incidência no caso
3. Invocar motivos que se prestariam a justificar qualquer outra decisão
4. Não enfrentar todos os argumentos deduzidos no processo capazes de, em tese, infirmar a conclusão adotada pelo julgador
5. Se limitar a invocar precedente ou enunciado de súmula, sem identificar seus fundamentos determinantes nem demonstrar que o caso sob julgamento se ajusta àqueles fundamentos
6. Deixar de seguir enunciado de súmula, jurisprudência ou precedente invocado pela parte, sem demonstrar a existência de distinção no caso em julgamento ou a superação do entendimento

## Aplicação na Geração de Sentença com IA

Ao usar a skill `sentenca-judicial-br`, o Claude aplica o FIRAC-JB automaticamente, garantindo que:

- O relatório não seja mero copia-e-cola da petição
- Cada argumento das partes seja enfrentado (inc. IV, art. 489, §1°)
- Cada citação de súmula venha acompanhada de demonstração de aplicabilidade (inc. V)
- O dispositivo seja claro, sem ambiguidades sobre a procedência e os efeitos

## Por que civil law precisa de adaptação?

No common law, o FIRAC tem ênfase na análise de casos (case law) e o raciocínio é fortemente indutivo. No civil law brasileiro:

- A lei codificada é o ponto de partida (dedutivo)
- A jurisprudência consolida a interpretação da lei (não a cria)
- A estrutura da sentença tem formato legalmente exigido
- O contraditório exige enfrentamento expresso dos argumentos das partes

O FIRAC-JB preserva a lógica de estruturação do raciocínio, adaptando os elementos à realidade do processo civil brasileiro.
