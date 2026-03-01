# Guia Anti-Alucinação — Citação Segura de Jurisprudência com IA

## O Problema

Modelos de linguagem frequentemente "alucinam" referências jurídicas: inventam números de processo, datas de julgamento, nomes de ministros e até o conteúdo de súmulas. Em contexto jurídico, isso é grave — uma citação falsa em peça processual pode configurar má-fé, comprometer a credibilidade do profissional e prejudicar o cliente.

## Protocolo de 3 Níveis

Todo output jurídico gerado pelas skills deste repositório segue este protocolo:

### Nível 1 — CONFIRMADO
```
Quando usar: a tese é amplamente conhecida e verificável em múltiplos julgados.

Formato:
"O STJ consolidou entendimento de que [TESE], conforme se verifica em 
decisões das [Turmas/Seção] sob o [Tema XXX / Repetitivo / Súmula NNN].
[CONFIRMAR número exato no site do tribunal antes de citar]"
```

### Nível 2 — PROVÁVEL
```
Quando usar: a tese é consistente com a lógica da jurisprudência mas o 
número exato não está disponível com segurança.

Formato:
"Há tendência jurisprudencial no sentido de [TESE], sustentada no 
princípio [X] e em decisões da área [Y]. [VERIFICAR no tribunal antes 
de citar em peça ou sentença]"
```

### Nível 3 — INCERTO
```
Quando usar: o modelo não tem informação segura sobre a posição atual.

Formato:
"Não possuo informação segura sobre a posição atual do [STJ/STF/TJ] 
acerca de [TEMA]. Recomendo consultar diretamente:
- STJ: https://scon.stj.jus.br/SCON/
- STF: https://portal.stf.jus.br/jurisprudencia/
- TJ-ES: https://sistemas.tjes.jus.br/esis/"
```

## O que a IA NUNCA deve fazer

| Prática proibida | Risco |
|-----------------|-------|
| Inventar número de REsp, AI, HC | Citação falsa — fraude processual |
| Inventar nome de relator | Citação falsa |
| Inventar data de julgamento | Citação falsa |
| Citar Súmula sem o número | Vagueza não-verificável |
| Afirmar que súmula foi revogada sem certeza | Desinformação |
| Citar "jurisprudência dominante" sem fonte | Argumento vazio |

## Como Verificar — Links dos Tribunais

| Tribunal | URL de busca |
|----------|-------------|
| STJ — Pesquisa de jurisprudência | https://scon.stj.jus.br/SCON/ |
| STJ — Teses repetitivas | https://processo.stj.jus.br/repetitivos/ |
| STF — Jurisprudência | https://portal.stf.jus.br/jurisprudencia/ |
| STF — Súmulas vinculantes | https://portal.stf.jus.br/textos/verTexto.asp?servico=jurisprudenciaSumulaVinculante |
| TJ-ES — ESIS | https://sistemas.tjes.jus.br/esis/ |
| TRF-2 | https://www10.trf2.jus.br/consultas/ |
| TST | https://jurisprudencia.tst.jus.br/ |

## Termos de Busca Recomendados por Área

### Bancário
- `juros abusivos capitalização mensal`
- `tarifas bancárias TAC TEC`
- `alienação fiduciária imóvel consolidação`
- `comissão de permanência cumulação`

### Consumidor
- `negativação indevida dano moral`
- `plano de saúde negativa cobertura`
- `vício do produto substituição prazo`
- `responsabilidade solidária cadeia fornecimento`

### Processual
- `tutela antecipada requisitos periculum fumus`
- `fundamentação analítica nulidade decisão`
- `honorários advocatícios fases cumulação`
- `negócio jurídico processual validade`

### Família e Sucessões
- `guarda compartilhada melhor interesse criança`
- `alimentos binômio necessidade possibilidade`
- `alienação parental caracterização consequências`
- `divórcio partilha bens regime comunhão`
- `inventário extrajudicial requisitos`
- `usucapião familiar abandono do lar`

### Penal
- `dosimetria pena circunstâncias judiciais art 59`
- `regime inicial cumprimento pena`
- `substituição pena restritiva direitos`
- `prisão preventiva fundamentação concreta`
- `tráfico privilegiado redução pena`
- `estelionato fraude eletrônica art 171`

### Trabalhista
- `vínculo empregatício requisitos subordinação`
- `horas extras intervalo intrajornada`
- `dano moral assédio ambiente trabalho`
- `rescisão indireta hipóteses art 483 CLT`
- `pejotização fraude vínculo empregatício`

### Imobiliário
- `despejo por falta de pagamento purgação mora`
- `usucapião extraordinário requisitos prazo`
- `promessa compra venda adjudicação compulsória`
- `condomínio inadimplência taxa condominial`
- `distrato imobiliário restituição valores`
- `alienação fiduciária imóvel consolidação propriedade`

### Administrativo
- `improbidade administrativa dano ao erário`
- `servidor público estabilidade demissão`
- `concurso público preterição nomeação`
- `responsabilidade civil estado omissão`

---

## Exemplos Práticos — Aplicação dos 3 Níveis

### Exemplo Nível 1 — CONFIRMADO
**Contexto:** Ação de indenização por negativação indevida.
```
Saída correta:
"O STJ consolidou entendimento de que a inscrição indevida em
cadastros restritivos gera dano moral in re ipsa, dispensada a
prova de prejuízo concreto, conforme se verifica no julgamento
do Tema Repetitivo 622 e na Súmula 385/STJ.
[CONFIRMAR número exato do Tema e aplicabilidade da Súmula 385
no site do STJ antes de citar]"
```
**Por que Nível 1:** Tese amplamente conhecida, repetida em milhares de julgados, com tema repetitivo catalogado.

### Exemplo Nível 2 — PROVÁVEL
**Contexto:** Ação revisional de contrato bancário com capitalização de juros.
```
Saída correta:
"Há tendência jurisprudencial no STJ no sentido de que a
capitalização mensal de juros é admitida desde que expressamente
pactuada e o contrato seja posterior à MP 1.963-17/2000,
sustentada no princípio da liberdade contratual e em decisões
da 2ª Seção.
[VERIFICAR no STJ: buscar por 'capitalização mensal juros
contrato posterior MP 1963' — confirmar se há Tema Repetitivo
específico antes de citar]"
```
**Por que Nível 2:** A tese é consistente com a jurisprudência conhecida, mas o número exato do recurso ou tema repetitivo não está disponível com segurança.

### Exemplo Nível 3 — INCERTO
**Contexto:** Responsabilidade civil por dano causado por IA autônoma.
```
Saída correta:
"Não possuo informação segura sobre a posição atual do STJ
acerca da responsabilidade civil por danos causados por
sistemas de inteligência artificial autônoma. O tema é
emergente e pode não ter jurisprudência consolidada.
Recomendo consultar diretamente:
- STJ: https://scon.stj.jus.br/SCON/ (buscar 'inteligência
  artificial responsabilidade civil')
- STF: https://portal.stf.jus.br/jurisprudencia/
- Marco Legal da IA (PL 2338/2023 — verificar status)"
```
**Por que Nível 3:** Tema novo, sem jurisprudência consolidada. Afirmar posição seria alucinação.

---

## Integração com a Skill `jurisprudencia-miner`

A skill `jurisprudencia-miner` aplica este protocolo automaticamente ao pesquisar precedentes:

1. **Classificação automática:** Cada resultado de pesquisa recebe nível 1, 2 ou 3
2. **Marcação explícita:** Tags `[CONFIRMAR]` ou `[VERIFICAR]` inseridas no output
3. **Links de verificação:** URL do tribunal incluída para cada citação
4. **Fallback transparente:** Se não encontrar precedente seguro, diz explicitamente (Nível 3)

**Fluxo recomendado:**
```
jurisprudencia-miner (pesquisa)
  → classifica nível de confiança
  → sentenca-judicial-br (usa na fundamentação)
  → revisor humano (confirma antes de assinar)
```

## Regra de Ouro

> **Uma citação verificada vale mais do que dez inventadas.**
> 
> Se não souber o número exato, diga onde buscar.  
> O profissional que usa IA e verifica é mais confiável que o que não usa IA alguma.
