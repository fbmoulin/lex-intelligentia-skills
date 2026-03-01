---
name: contrato-analyzer-br
description: |
  Análise completa de contratos brasileiros com checklists especializados por tipo: imóveis (compra e venda, locação, permuta, incorporação), serviços (prestação de serviços, terceirização, SLA, consultoria), bancários/financeiros (mútuo, financiamento, alienação fiduciária, cartão), empresariais (sociedade, franquia, distribuição) e de consumo (CDC). Identifica cláusulas abusivas, riscos contratuais, vícios de forma, ausência de elementos essenciais e inconformidades com o CDC, Código Civil e legislação específica. Usar SEMPRE que o usuário trouxer um contrato para análise, pedir revisão de cláusulas, quiser saber se uma cláusula é abusiva, precisar redigir ou melhorar um contrato, ou mencionar: "analisar contrato", "revisar contrato", "cláusula abusiva", "contrato de locação", "contrato bancário", "financiamento", "compra e venda de imóvel", "prestação de serviços", "contrato empresarial". A análise detecta riscos que advogados levam horas para identificar.
---

# Contrato Analyzer BR — Análise Inteligente de Contratos Brasileiros

## Protocolo Geral de Análise

Para todo contrato, independente do tipo, executar nesta ordem:

```
PASSO 1 → IDENTIFICAR o tipo de contrato e partes envolvidas
PASSO 2 → VERIFICAR requisitos de validade (art. 104, CC)
PASSO 3 → APLICAR checklist específico do tipo
PASSO 4 → MAPEAR cláusulas de risco
PASSO 5 → CLASSIFICAR riscos (CRÍTICO | ALTO | MÉDIO | BAIXO)
PASSO 6 → GERAR relatório estruturado
```

---

## Requisitos Gerais de Validade (Art. 104, CC)

Verificar SEMPRE, em qualquer contrato:

| Requisito | Verificação | Problema se ausente |
|-----------|-------------|---------------------|
| Agente capaz | Partes são maiores e não incapazes? | Anulabilidade (art. 171, II, CC) |
| Objeto lícito | O objeto é permitido por lei? | Nulidade absoluta (art. 166, II, CC) |
| Forma prescrita | A lei exige forma especial (escritura, registro)? | Ineficácia (art. 166, IV, CC) |
| Manifestação de vontade | Há vício de consentimento (dolo, erro, coação)? | Anulabilidade (art. 171, II, CC) |

---

## TIPO A — Contratos de Imóveis

### A1 — Compra e Venda de Imóvel

```
CHECKLIST COMPRA E VENDA

□ IDENTIFICAÇÃO DO BEM
  - Descrição completa: endereço, área, matrícula, RGI (Cartório de Registro)
  - Código do IPTU
  - Benfeitorias incluídas/excluídas explicitadas

□ PREÇO E PAGAMENTO
  - Valor total e forma de pagamento discriminada
  - Índice de correção monetária (se parcelado): qual? IGPM/IPCA/INCC?
  - Multa por atraso do comprador
  - Multa por atraso na escritura pelo vendedor
  - Arras confirmatórias ou penitenciais? (arts. 417-420, CC)
    → Confirmatórias: parte do preço / Penitenciais: pena para desistência

□ VÍCIOS OCULTOS
  - Responsabilidade do vendedor por vícios ocultos (arts. 441-444, CC)?
  - Prazo de denúncia pactuado (legal: 1 ano para imóvel)

□ OBRIGAÇÕES TRIBUTÁRIAS
  - ITBI: quem paga? (praxe: comprador, mas negociável)
  - Débitos de IPTU e condomínio anteriores: quem assume?
  - Certidões negativas de débito exigidas do vendedor?

□ ESCRITURA E REGISTRO
  - Prazo para lavratura da escritura pública (obrigatória > 30 SMN — art. 108, CC)
  - Custos do cartório: quem paga?
  - Quem providencia o registro no CRI?

□ RISCO DE EVICÇÃO (art. 447, CC)
  - Cláusula afastando ou limitando evicção? → risco para o comprador

□ DOCUMENTOS DO VENDEDOR RECOMENDADOS
  - [ ] Certidão de ônus reais (matrícula atualizada)
  - [ ] Certidões de protestos (Serasa, SPC)
  - [ ] Certidões trabalhistas e fiscais (executivos fiscais)
  - [ ] CND municipal (IPTU quitado)

ALERTAS VERMELHOS ← parar e alertar o cliente:
⚠ Imóvel com gravames (hipoteca, penhora, usufruto) na matrícula
⚠ Contrato por instrumento particular em compra acima de 30 salários mínimos
⚠ Cláusula de rescisão sem devolução dos valores pagos → abusiva (STJ Súmula 543)
⚠ Correção pelo INCC após habite-se → ilegal em contratos com construtora
```

### A2 — Contrato de Locação Residencial (Lei 8.245/91)

```
CHECKLIST LOCAÇÃO RESIDENCIAL

□ IDENTIFICAÇÃO (art. 22, Lei 8.245/91)
  - Imóvel descrito completamente
  - Prazo: determinado (mínimo 30 meses para evitar revisão) ou indeterminado?
  - Destinação: residencial ou mista?

□ ALUGUEL E REAJUSTE
  - Valor mensal e dia de vencimento
  - Índice de reajuste anual (IGP-M ou IPCA) — apenas 1x ao ano permitido
  - Reajuste em prazo inferior a 12 meses → ILEGAL (Lei 10.192/01)

□ GARANTIAS (art. 37, Lei 8.245/91 — apenas UMA é legal)
  - [ ] Caução (máximo 3 meses de aluguel)
  - [ ] Fiança (fiador com imóvel no mesmo município — verificar capacidade econômica)
  - [ ] Seguro fiança
  - [ ] Cessão fiduciária de quotas de fundo de investimento
  ⚠ Mais de uma garantia no mesmo contrato = cláusula nula

□ ENCARGOS
  - IPTU: quem paga? (locador por padrão — pode ser transferido)
  - Seguro de incêndio: responsabilidade do locador (art. 22, VIII)
  - Taxa de administração imobiliária: quem assume?

□ BENFEITORIAS (art. 35-36, Lei 8.245/91)
  - Necessárias: indenizáveis pelo locador, com direito de retenção?
  - Úteis: dependem de autorização do locador?
  - Voluptuárias: locatário pode levantar ao sair?

□ RESCISÃO ANTECIPADA
  - Multa para rescisão antes do prazo: proporcional ao tempo restante?
    → STJ permite cláusula penal proporcional
  - Prazo de aviso prévio (30 dias — art. 6º, Lei 8.245/91)

□ DIREITO DE PREFERÊNCIA (art. 27-34, Lei 8.245/91)
  - Imóvel posto à venda: locatário tem preferência, notificação em 30 dias?
  - Cláusula renunciando ao direito de preferência: permitida

ALERTAS VERMELHOS:
⚠ Reajuste mensal ou bimestral → ilegal
⚠ Cobrança de luvas, prêmio ou taxa na renovação → vedado (art. 43)
⚠ Cláusula de rescisão sem multa proporcional → pode ser questionada
⚠ Imóvel em condomínio: verificar se regulamento permite locação via plataforma (Airbnb)
```

---

## TIPO B — Contratos de Serviços

### B1 — Prestação de Serviços (Cível)

```
CHECKLIST PRESTAÇÃO DE SERVIÇOS

□ OBJETO DO CONTRATO
  - Serviço descrito com precisão suficiente para aferir o cumprimento?
  - Obrigação de MEIO ou de RESULTADO?
    → Meio: advogado, médico (responsabilidade por culpa)
    → Resultado: empreiteiro, programador de site (responsabilidade pelo produto)

□ PRAZO E ENTREGÁVEIS
  - Prazo total + marcos intermediários (milestones)
  - O que constitui "entrega aceita"? (critérios de aceite)
  - Prazo para o contratante aceitar/rejeitar (evitar aceitação tácita)

□ PREÇO E FORMA DE PAGAMENTO
  - Valor fixo, por hora ou por resultado?
  - Cronograma de pagamento atrelado a entregáveis?
  - Correção monetária: índice e periodicidade
  - Condição para pagamento final: aceite formal

□ RESCISÃO
  - Multa por rescisão imotivada do contratante: razoável?
  - Aviso prévio para rescisão: prazo
  - O que acontece com entregáveis parciais na rescisão?

□ PROPRIEDADE INTELECTUAL
  - Obras criadas durante o contrato: de quem é o direito autoral?
  - Cessão de direitos patrimoniais: total ou parcial?
  - Software: transferência ou licença de uso?

□ CONFIDENCIALIDADE (NDA embutido)
  - Prazo da obrigação de sigilo (durante + X anos após encerramento)
  - Definição de "informação confidencial"
  - Penalidade pela violação: específica ou genérica?

□ RESPONSABILIDADE CIVIL
  - Limitação de responsabilidade: até qual valor?
  - Danos indiretos/lucros cessantes: excluídos?
  - Seguro de responsabilidade civil profissional exigido?

□ FORO E RESOLUÇÃO DE CONFLITOS
  - Cláusula arbitral ou foro de eleição?
  - Mediação prévia obrigatória?
```

### B2 — SLA / Contrato de Nível de Serviço (TI/Tecnologia)

```
CHECKLIST SLA TECNOLOGIA

□ DISPONIBILIDADE (Uptime)
  - SLA declarado: 99%? 99,9%? 99,99%?
    → 99% = 87h offline/ano | 99,9% = 8,7h | 99,99% = 52 minutos
  - Janela de manutenção programada incluída ou excluída do cálculo?
  - Como é medido (monitoramento independente ou pelo fornecedor)?

□ TEMPO DE RESPOSTA E RESOLUÇÃO
  - Incidente P1 (crítico): resposta em X min / resolução em Y horas
  - Incidente P2 (alto): resposta em X horas / resolução em Y horas
  - P3 e P4: prazos definidos?

□ PENALIDADES (SLA Credits)
  - Desconto no valor da fatura por violação do SLA?
  - Cap de penalidade: máximo de X% da mensalidade?
  - Processo de solicitação de crédito: automático ou manual?

□ EXCLUSÕES DO SLA (force majeure tecnológico)
  - Ataques DDoS: excluído?
  - Falha de infraestrutura de terceiros (AWS, Azure): excluído?
  - Erros causados pelo próprio cliente: excluído?

□ SEGURANÇA E DADOS (LGPD)
  - Processamento de dados pessoais? → DPA (Data Processing Agreement) incluso?
  - Localização dos dados: Brasil ou exterior?
  - Prazo de retenção e deleção ao término do contrato
  - Plano de resposta a incidentes de segurança
```

---

## TIPO C — Contratos Bancários e Financeiros

```
CHECKLIST CONTRATOS BANCÁRIOS

□ TAXA DE JUROS
  - Taxa nominal ao mês E ao ano (ambas devem constar — art. 1º, Lei 7.357)
  - Taxa Efetiva vs. CET (Custo Efetivo Total — Res. BCB 4.524/2016)
  - CET inclui: juros + tarifas + tributos + seguros + outros encargos
  - Comparar CET com taxa média do mercado (BCB publica mensalmente)

□ CAPITALIZAÇÃO
  - Capitalização de juros (juros sobre juros): expressamente autorizada?
  - Período de capitalização: mensal? diário?
  - Súmula 541, STJ: capitalização mensal permitida se pactuada expressamente
  - Súmula 539, STJ: é lícita a cobrança de juros acima de 12% ao ano

□ TARIFAS BANCÁRIAS (Res. CMN 3.919/2010)
  - Tarifa de cadastro: cobrada apenas na abertura, não na renovação
  - Tarifa de avaliação de bem (financiamentos): permitida se vinculada a avaliação real
  - TAC (Tarifa de Abertura de Crédito): VEDADA desde 2011 (Res. CMN 3.919)
  - TEC (Tarifa de Emissão de Carnê): VEDADA desde 2011
  - ⚠ Cobranças de TAC/TEC após 2011 → devolução em dobro (art. 42, CDC)

□ GARANTIAS BANCÁRIAS
  - Alienação fiduciária de imóvel (Lei 9.514/97): cláusula de consolidação?
  - Alienação fiduciária de veículo: registro no DETRAN obrigatório
  - Hipoteca: registro no CRI obrigatório
  - Aval/Fiança: sócio-cônjuge precisa de outorga uxória (art. 1.647, III, CC)

□ SEGUROS VINCULADOS
  - Seguro de vida vinculado ao financiamento: obrigatório ou opcional?
  - Proibição de venda casada (art. 39, I, CDC)
  - Possibilidade de contratar seguro em outra seguradora?

□ CLÁUSULAS DE RENEGOCIAÇÃO E MORA
  - Taxa de mora: máximo 2% ao mês (CDC) ou 1% ao mês (CC)?
  - Multa por inadimplemento: máximo 2% (CDC)
  - Capitalização dos juros de mora: vedada durante inadimplemento

BANDEIRAS VERMELHAS — REVISAR COM PRIORIDADE:
⚠ CET não informado ou divergente → violação de norma BCB
⚠ Capitalização diária sem previsão expressa → questionar
⚠ Seguro obrigatório de seguradora do próprio banco → venda casada ilegal
⚠ Multa de mora superior a 2% → reduzir para o limite legal
```

---

## Relatório Padrão de Análise Contratual

Após aplicar o checklist, gerar sempre neste formato:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RELATÓRIO DE ANÁLISE CONTRATUAL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

TIPO DE CONTRATO: [tipo]
PARTES: [parte A] × [parte B]
DATA: [data do contrato]
VALOR: R$ [valor ou "não informado"]
VIGÊNCIA: [prazo]

RISCOS CRÍTICOS (ação imediata):
🔴 [Risco 1 — cláusula X — impacto — como resolver]
🔴 [Risco 2]

RISCOS ALTOS (renegociar antes de assinar):
🟠 [Risco 3]
🟠 [Risco 4]

RISCOS MÉDIOS (registrar e monitorar):
🟡 [Risco 5]

PONTOS POSITIVOS:
✅ [O que está bem redigido / protegido]

CLÁUSULAS AUSENTES RECOMENDADAS:
+ [Cláusula 1 que deveria existir]
+ [Cláusula 2]

PARECER FINAL:
[APROVADO / APROVADO COM RESSALVAS / NÃO RECOMENDADO ASSINAR]
[Síntese em 2-3 linhas]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Referências Normativas Rápidas

| Tipo | Base Legal Principal |
|------|---------------------|
| Contratos em geral | Arts. 104, 421-480, CC/2002 |
| Contratos de consumo | CDC — Lei 8.078/90 |
| Locação | Lei 8.245/91 |
| Imóveis/escritura | Art. 108, CC |
| Financiamentos bancários | Res. CMN 3.919/2010; Lei 7.357 |
| Alienação fiduciária imóvel | Lei 9.514/97 |
| Proteção de dados | LGPD — Lei 13.709/18 |
| Terceirização | Lei 6.019/74 (reforma 2017) |
| Franquia | Lei 13.966/19 |
