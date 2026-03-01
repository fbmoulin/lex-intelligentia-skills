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

## Regra de Ouro

> **Uma citação verificada vale mais do que dez inventadas.**
> 
> Se não souber o número exato, diga onde buscar.  
> O profissional que usa IA e verifica é mais confiável que o que não usa IA alguma.
