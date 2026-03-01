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

---

## Exemplo Prático — Caso Consumidor (Negativação Indevida)

### F — FATOS
> Maria da Silva adquiriu eletrodoméstico em 15/03/2025 na loja Eletro Total Ltda. O pagamento foi realizado à vista via Pix. Apesar da quitação comprovada pelo extrato bancário, em 10/05/2025, Maria constatou inscrição de seu nome no SCPC/Serasa por suposta dívida de R$ 2.500,00, vinculada à mesma compra. Notificou extrajudicialmente a ré, que não providenciou a baixa. Pretende indenização por danos morais e declaração de inexistência do débito.
>
> **Fatos incontroversos:** compra realizada, pagamento via Pix.
> **Fato controvertido:** legitimidade da negativação.

### I — ISSUES
1. **Preliminar:** Há necessidade de litisconsórcio com o órgão de proteção ao crédito? (Não — Súmula 359/STJ)
2. **Mérito principal:** A negativação é indevida?
3. **Consequência:** Há dano moral indenizável? Em que valor?

### R — RULES
- **CDC, art. 14:** Responsabilidade objetiva do fornecedor de serviços.
- **CDC, art. 43, §1°:** Comunicação prévia ao consumidor antes da inscrição.
- **CC, art. 186 c/c art. 927:** Obrigação de reparar dano causado por ato ilícito.
- **Súmula 385/STJ:** Da anotação irregular em cadastro de proteção ao crédito, não cabe indenização por dano moral quando preexistente legítima inscrição, ressalvado o direito ao cancelamento. [CONFIRMAR — Nível 1]
- **Jurisprudência consolidada STJ:** Negativação indevida gera dano moral in re ipsa (presumido). [CONFIRMAR — Nível 1]

### A — APPLICATION (Subsunção)
> O comprovante de pagamento via Pix demonstra a quitação integral do débito. A ré não comprovou fato impeditivo, modificativo ou extintivo do direito da autora (art. 373, II, CPC). A manutenção da negativação após quitação configura ato ilícito por falha na prestação do serviço (art. 14, CDC). Não há inscrição preexistente legítima (afastada a incidência da Súmula 385/STJ). O dano moral é presumido (in re ipsa), dispensando prova de prejuízo concreto. Quanto ao quantum, considerando a capacidade econômica das partes, a extensão temporal da negativação (3 meses) e o caráter punitivo-pedagógico, fixa-se em R$ 8.000,00.

### C — CONCLUSION (Dispositivo)
> JULGO PROCEDENTE o pedido para: (a) DECLARAR inexistente o débito de R$ 2.500,00; (b) DETERMINAR a exclusão definitiva do nome da autora dos cadastros restritivos, no prazo de 5 dias, sob pena de multa diária de R$ 500,00; (c) CONDENAR a ré ao pagamento de R$ 8.000,00 a título de danos morais, com correção monetária (Súmula 362/STJ) a partir desta data e juros de mora de 1% ao mês desde o evento danoso (Súmula 54/STJ). Condeno a ré nas custas processuais e honorários advocatícios de 15% sobre o valor da condenação (art. 85, §2°, CPC). P.R.I.

---

## Checklist de Validação — Sentença Gerada por IA

Use este checklist para validar qualquer minuta gerada pela skill `sentenca-judicial-br`:

### Estrutura (Art. 489, CPC)
- [ ] Relatório identifica partes, pedidos e argumentos — não é cópia da petição
- [ ] Fundamentação contém marco normativo explícito (leis, súmulas, teses)
- [ ] Dispositivo é claro sobre procedência total/parcial/improcedência
- [ ] Dispositivo especifica consequências (valor, prazo, custas, honorários)

### Fundamentação Analítica (Art. 489, §1°, CPC)
- [ ] Não se limita a reproduzir texto de lei sem explicar aplicação ao caso
- [ ] Não usa conceitos indeterminados sem justificativa concreta
- [ ] Não usa motivação genérica ("por todo o exposto") aplicável a qualquer caso
- [ ] Enfrenta TODOS os argumentos relevantes das partes
- [ ] Cada súmula citada tem demonstração de aplicabilidade ao caso
- [ ] Cada precedente afastado tem justificativa de distinção (distinguishing)

### Protocolo Anti-Alucinação
- [ ] Toda citação jurisprudencial tem nível de confiança indicado (1/2/3)
- [ ] Nenhum número de REsp, AI, HC ou AgInt foi inventado
- [ ] Nenhum nome de ministro relator foi inventado
- [ ] Nenhuma data de julgamento foi inventada
- [ ] Súmulas citadas têm número verificável
- [ ] Marcações `[CONFIRMAR]` ou `[VERIFICAR]` presentes onde necessário

### Coerência Interna
- [ ] A fundamentação sustenta logicamente o dispositivo (não há contradição)
- [ ] Valores de condenação são justificados na fundamentação
- [ ] Juros e correção monetária têm termo inicial correto e fundamentado
- [ ] Honorários observam faixa legal (10-20% sobre condenação)

---

## Erros Comuns na Aplicação do FIRAC-JB com IA

| Erro | Exemplo | Como evitar |
|------|---------|-------------|
| **Relatório narrativo demais** | Reproduzir toda a petição inicial | Limitar a fatos relevantes para a decisão |
| **Fundamentação genérica** | "Conforme pacífica jurisprudência..." sem citar qual | Sempre vincular à fonte (Súmula, Tema, REsp) |
| **Subsunção ausente** | Citar a norma e pular para o dispositivo | Explicar POR QUE os fatos se enquadram na norma |
| **Dispositivo ambíguo** | "Julgo procedente em parte" sem especificar o quê | Listar cada pedido e se foi acolhido ou não |
| **Alucinação de precedente** | Inventar "REsp 1.234.567/SP" | Usar protocolo de 3 níveis do Guia Anti-Alucinação |
| **Não enfrentar argumento** | Ignorar a tese da defesa de prescrição | Abordar expressamente cada argumento relevante |
| **Honorários sem faixa** | "Condeno em honorários" sem percentual | Especificar % e base de cálculo (art. 85, §2°, CPC) |
