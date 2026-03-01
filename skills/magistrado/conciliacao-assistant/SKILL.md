---
name: conciliacao-assistant
description: |
  Assistente especializado em conciliação e mediação judicial brasileira. Analisa processos para identificar o ZOPA (Zone of Possible Agreement), calcula o valor de equilíbrio baseado em precedentes similares, gera propostas de acordo estratificadas (mínimo / razoável / ótimo), avalia a viabilidade econômica do acordo versus o custo de litigar, produz minutas de termos de acordo homologável, e oferece técnicas de comunicação para condução de sessões de conciliação. Especializado nas áreas mais conciliáveis do Direito Brasileiro: bancário, consumidor, locação, família (alimentos, guarda), trabalhista e reparação de danos. Usar SEMPRE que o usuário precisar de estratégia de conciliação, quiser saber se vale aceitar um acordo, precisar de uma proposta de acordo fundamentada em precedentes, quiser conduzir uma audiência de conciliação, ou mencionar: "acordo", "conciliação", "mediação", "proposta de acordo", "vale a pena aceitar", "termo de acordo", "BATNA", "audiência de conciliação", "CEJUSC". Economiza tempo e aumenta a taxa de resolução de processos.
---

# Conciliação Assistant — IA para Resolução Consensual de Conflitos

## Fundamento: Por que Conciliar?

```
CUSTO DE LITIGAR vs. CUSTO DE CONCILIAR

Duração média de um processo cível no Brasil: 4-7 anos
Custo total (honorários + custas + correção monetária): 25-40% do valor em disputa

FÓRMULA DO VALOR ESPERADO DO LITÍGIO:
VE = (probabilidade de procedência × valor da condenação)
     − (custos do processo × tempo)
     ± (risco de reforma em 2ª instância)

Se VE < valor proposto no acordo → ACEITAR o acordo faz sentido econômico
```

---

## FASE 1 — Análise do Caso para Conciliação

### Perfil do Processo

Antes de qualquer proposta, mapear:

```
ANÁLISE PREDITIVA DO LITÍGIO

1. PROBABILIDADE DE PROCEDÊNCIA: [alta/média/baixa + razão]
   → Baseada em: solidez da prova, jurisprudência local, tese jurídica

2. VALOR ESTIMADO DA CONDENAÇÃO:
   - Dano material: R$ [valor — documentado nos autos]
   - Dano moral: R$ [faixa baseada em precedentes similares]
   - Juros e correção até hoje: R$ [cálculo]
   - Total estimado se procedente: R$ [soma]

3. RISCOS DO LITIGANTE:
   Para o AUTOR:
   - Risco de improcedência: [%]
   - Risco de reforma em recurso: [%]
   - Tempo estimado até trânsito: [anos]
   - Desgaste emocional/reputacional: [relevante?]
   
   Para o RÉU:
   - Risco de condenação integral: [%]
   - Impacto reputacional (caso público?): [sim/não]
   - Precedente negativo para casos similares: [sim/não]
   - Execução e penhora se perder: [impacto]

4. ZOPA — ZONA DE POSSÍVEL ACORDO:
   Piso do autor (mínimo aceitável): R$ [valor]
   Teto do réu (máximo que pagaria): R$ [valor]
   
   [Se ZOPA existe → acordo é matematicamente possível]
   [Se não há ZOPA → explorar ajustes não-financeiros]
```

---

## FASE 2 — Proposta de Acordo por Área

### Bancário — Revisão de Contratos / Cobrança Indevida

```
PARÂMETROS DE ACORDO BANCÁRIO

BASE: STJ Tema 958 (tarifas) + Súmula 541 (capitalização)
      Tabela do BACEN para taxa média do mercado

ESTRUTURA TÍPICA DE ACORDO BANCÁRIO:

Cenário A — Autor questiona juros e tarifas abusivas:
  → Proposta razoável: reajuste do saldo para taxa de mercado BACEN
    + devolução de tarifas vedadas (TAC/TEC) em dobro (art. 42, CDC)
    + quitação do contrato com desconto de X% no saldo ajustado

Cenário B — Banco cobra dívida vencida (réu é devedor):
  → Proposta razoável: pagamento de [60-80%] do saldo atualizado
    sem multa e com parcelamento em [12-36] parcelas
    + exclusão imediata de cadastros de inadimplentes (SCPC/Serasa)

FÓRMULA DE EQUALIZAÇÃO:
Valor do acordo ideal = (saldo principal + juros legais)
                       × (1 - desconto pelo risco do banco)
                       + valor de honorários e custas proporcionais

CLÁUSULA OBRIGATÓRIA: quitação total e recíproca de obrigações
                       + prazo para baixa no cadastro de inadimplentes: 5 dias úteis
```

### Consumidor — Produto/Serviço Defeituoso

```
PARÂMETROS DE ACORDO CONSUMIDOR

BASE: CDC arts. 6º, 14, 18, 20, 22 + jurisprudência local do TJSP/TJ-ES

TABELA DE DANO MORAL POR TIPO DE CASO:
(Referência para tribunais estaduais, faixa típica 2024-2025)

| Tipo de Caso | Faixa Típica | Observação |
|---|---|---|
| Negativação indevida | R$ 3.000 - 8.000 | Mais se há provas de dano específico |
| Negativa indevida de plano de saúde | R$ 5.000 - 15.000 | Mais se houve dano à saúde |
| Produto com defeito (dano patrimonial) | Troca + dano moral R$ 1.500-5.000 | |
| Falha de serviço essencial (água, luz) | R$ 2.000 - 6.000 | Por evento |
| Cobranças após quitação | R$ 2.000 - 5.000 | + devolução em dobro (art. 42 CDC) |
| Fraude / clonagem de dados | R$ 5.000 - 20.000 | Maior com prova de dano |

PROPOSTA DE ACORDO CONSUMIDOR (3 NÍVEIS):
🟢 Mínimo: devolução do valor pago + dano moral no piso da tabela
🟡 Razoável: dano material + 50% da tabela + troca do produto/serviço
🔴 Ótimo para o consumidor: teto da tabela + danos materiais integrais + tutela
```

### Família — Alimentos e Guarda

```
PARÂMETROS FAMÍLIA

BASE: Lei 5.478/68 + arts. 1.694-1.710, CC + ECA

ALIMENTOS — CRITÉRIO BINÔMIO (art. 1.694, §1°, CC):
  Necessidade do alimentado × Possibilidade do alimentante

FÓRMULA PRÁTICA DE ALIMENTOS:
  → Sem trabalho formal: estimar renda pelo padrão de vida
    (STJ admite estimativa — REsp 1.218.874)
  → Com CLT: calcular sobre salário líquido
    1 filho: 25-33% | 2 filhos: 33-40% | 3+: até 50%
  → Autônomo/empresário: base nos últimos 12 meses de IR + pró-labore

ACORDO DE GUARDA:
  Guarda compartilhada é a regra (art. 1.583, §2°, CC)
  Proposta de acordo deve definir:
  ✓ Residência de referência
  ✓ Divisão de semanas / fins de semana / feriados
  ✓ Férias escolares (meses de julho e recesso de dezembro/janeiro)
  ✓ Datas especiais (aniversários, Natal, Dia dos Pais/Mães)
  ✓ Comunicação entre os genitores (plataforma, horários)
  ✓ Decisões importantes conjuntas (saúde, escola, viagens internacionais)

TABELA DE DANO MORAL — CASOS DE FAMÍLIA:
  Alienação parental comprovada: R$ 5.000 - 20.000 (+ danos à criança)
  Descumprimento de visitas: R$ 1.000 - 5.000 por evento
```

### Responsabilidade Civil — Acidentes e Danos

```
PARÂMETROS REPARAÇÃO DE DANOS

DANO MATERIAL:
  → Dano emergente: comprovado por nota fiscal, orçamento, recibo
  → Lucros cessantes: "o que razoavelmente deixou de ganhar" (art. 402, CC)
    = renda mensal × meses de incapacidade (comprovado por perícia/atestado)

DANO MORAL — CRITÉRIOS STJ:
  → Intensidade do sofrimento
  → Grau de culpa do ofensor
  → Condição econômica das partes
  → Caráter pedagógico (desestimular reincidência)
  → Vedação ao enriquecimento sem causa

FAIXAS ORIENTATIVAS (por tipo de acidente):
| Tipo | Faixa Dano Moral |
|---|---|
| Acidente de trânsito — lesão leve | R$ 3.000 - 10.000 |
| Acidente de trânsito — lesão grave | R$ 10.000 - 50.000 |
| Erro médico — dano estético | R$ 10.000 - 100.000 |
| Erro médico — morte | R$ 100.000 - 500.000 |
| Acidente de trabalho — incapacidade parcial | Cálculo atuarial |
| Acidente de trabalho — morte | 500 salários + dano moral família |

PROPOSTA MODELO:
🟢 Mínimo: danos materiais comprovados + dano moral no piso da faixa
🟡 Razoável: 70% dos danos totais estimados com pagamento à vista
🔴 Para a vítima insistir: totalidade dos danos + juros desde o evento
```

---

## FASE 3 — Técnicas de Condução da Audiência

### Roteiro de Abertura da Sessão (para o conciliador/magistrado)

```
ABERTURA (3-5 minutos)

"Bom dia a todos. Vou conduzir esta sessão de conciliação com base 
no princípio da autonomia da vontade das partes. Quero esclarecer 
que não estou aqui para julgar quem tem razão — esse é o papel do 
processo judicial. Estou aqui para facilitar um diálogo que pode 
resultar em uma solução que ambos considerem satisfatória.

Regras desta sessão:
1. Cada parte terá oportunidade de falar sem interrupções
2. O que for dito aqui, em caráter privativo, não poderá ser usado 
   como prova no processo judicial
3. Qualquer acordo é voluntário e pode ser encerrado a qualquer momento

Posso contar com a colaboração de vocês?"
```

### Técnicas por Fase da Negociação

```
EXPLORAÇÃO DE INTERESSES (não posições):
Pergunta-chave: "O que é mais importante para você nesta situação?"
→ Descobre: segurança financeira? Velocidade? Reconhecimento? Relacionamento?

ANCORAGEM ESTRATÉGICA:
- A primeira proposta ancora a negociação
- Proposta inicial = 120-150% do valor-alvo (para o autor)
- Nunca faça a primeira proposta se puder evitar

TÉCNICA DA CONCESSÃO DECRESCENTE:
  Concessão 1: redução de R$ 5.000
  Concessão 2: redução de R$ 2.000
  Concessão 3: redução de R$ 500
  → Sinaliza que o limite foi atingido

SILÊNCIO ESTRATÉGICO:
  Após apresentar uma proposta, aguardar em silêncio.
  Quem fala primeiro, tipicamente cede.

REFRAME DE IMPASSE:
  "Deixando o dinheiro de lado por um momento — há algo além do valor 
  que poderia tornar este acordo mais aceitável para você?"

TÉCNICA DO APELO À REALIDADE (para advogados inflados):
  "Baseado nos precedentes que vemos nos tribunais desta comarca, 
  quais são as expectativas realistas de uma condenação? 
  Quanto tempo esse processo levaria e qual seria o custo?"
```

### Sessão Privada (Caucus)

```
QUANDO USAR SESSÃO PRIVADA:
- Quando há impasse público que nenhuma parte quer ceder
- Quando uma parte está sendo pressionada pela outra
- Quando há informação sensível que não pode ser compartilhada

PERGUNTAS DO CAUCUS PARA O AUTOR:
"Fora desta sala, qual seria o valor mínimo que você aceitaria?"
"Se o processo levasse 5 anos, ainda valeria a pena?"
"Há algo além do dinheiro que você precisa?"

PERGUNTAS DO CAUCUS PARA O RÉU:
"Qual o máximo que sua empresa/você consegue pagar hoje?"
"Há condições de pagamento que tornariam o acordo mais viável?"
"Existe risco reputacional se este caso se tornar público?"
```

---

## FASE 4 — Minuta do Termo de Acordo

```
TERMO DE CONCILIAÇÃO/MEDIAÇÃO

Processo nº: [CNJ]
Vara/Juízo: [identificação]
Data: [data]

PARTES:
Autor/Requerente: [nome completo, CPF/CNPJ, endereço]
Réu/Requerido: [nome completo, CPF/CNPJ, endereço]
Representantes/Advogados: [nomes e OAB]

OBJETO: [descrição resumida do conflito]

CONDIÇÕES DO ACORDO:

1. OBRIGAÇÃO PRINCIPAL:
   O(A) [réu/autor] obriga-se a [pagar/fazer/não fazer] o valor/a obrigação 
   de R$ [valor por extenso] ao(à) [beneficiário], nos seguintes termos:
   - Forma: [à vista / parcelado em X parcelas de R$ Y]
   - Data(s) de pagamento: [data(s)]
   - Dados bancários para pagamento: [banco, agência, conta, PIX]

2. OBRIGAÇÕES ACESSÓRIAS: [se houver — retirar do cadastro de inadimplentes, 
   entrega de documento, obrigação de fazer ou não fazer]

3. QUITAÇÃO:
   As partes declaram que, com o cumprimento das obrigações acima, 
   outorgam-se PLENA, GERAL e IRREVOGÁVEL quitação, nada mais tendo 
   a reclamar uma da outra, a qualquer título, em relação ao objeto 
   deste processo e de todo o evento que lhe deu origem.

4. DESCUMPRIMENTO:
   Em caso de descumprimento das obrigações acordadas, fica estabelecida 
   multa de [10-20]% sobre o valor total do acordo, sem prejuízo da 
   execução imediata (art. 515, II, CPC).

5. CUSTAS E HONORÁRIOS:
   As custas processuais e honorários advocatícios ficam [compensados / 
   a cargo de cada parte na proporção de 50%].

Assim, devidamente assistidas por seus advogados e cientes dos termos 
acima, as partes firmam o presente acordo, que, homologado, valerá como 
título executivo judicial (art. 515, II, CPC).

[Local], [data].

___________________________    ___________________________
Autor                           Réu
[Nome]                          [Nome]

___________________________    ___________________________
Advogado(a) do Autor            Advogado(a) do Réu
OAB/[UF] nº [número]            OAB/[UF] nº [número]

HOMOLOGO o presente acordo.
[Local], [data].

___________________________
[Nome do Magistrado/Conciliador]
[Cargo]
```
