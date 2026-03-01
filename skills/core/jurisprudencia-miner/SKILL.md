---
name: jurisprudencia-miner
description: Pesquisa, mineração, análise e validação de jurisprudência dos tribunais brasileiros (STF, STJ, TJ-ES, TRFs, TST). Usar quando o usuário precisar encontrar precedentes judiciais, teses vinculantes, súmulas, acórdãos, repercussões gerais ou recursos repetitivos aplicáveis a um caso concreto. Ativar também para: montar ementas de jurisprudência, identificar divergência jurisprudencial, rastrear evolução de teses, validar citações de acórdãos, construir argumentação jurisprudencial e pesquisar por tema/artigo/número de súmula. Inclui estratégias anti-alucinação para citações jurídicas. Disparar sempre que o usuário mencionar "jurisprudência", "precedente", "súmula", "tese STJ", "repercussão geral", "repetitivo", "acórdão", "julgado" ou "pesquisa de jurisprudência".
---

# Jurisprudência Miner — Pesquisa e Validação de Precedentes Brasileiros

## ⚠️ Protocolo Anti-Alucinação

Citações jurídicas inventadas destroem credibilidade profissional. Esta skill adota 
**verificação obrigatória** antes de qualquer citação:

```
REGRA DE OURO: Nunca inventar número de processo, data de julgamento, 
turma ou relator. Se não tiver certeza, INDICAR que é necessária 
verificação nas fontes oficiais antes de uso profissional.
```

**Fontes primárias para verificação (sempre indicar ao usuário):**
- STF: https://portal.stf.jus.br/jurisprudencia/
- STJ: https://scon.stj.jus.br/
- TJ-ES: https://www.tjes.jus.br/jurisprudencia/
- TRFs: https://www.cjf.jus.br/juris/

---

## Hierarquia dos Precedentes Brasileiros

```
[VINCULANTES — art. 927, CPC]
├── Súmulas Vinculantes do STF
├── Decisões em Controle Concentrado (ADI, ADC, ADPF, ADO)
├── Acórdãos em RE com Repercussão Geral (§§ 2º e 11, art. 927)
├── Acórdãos em REsp/AREsp Repetitivos (§ 2º do art. 927)
└── Enunciados de Súmulas do STF e STJ (persuasivos — § 4º)

[PERSUASIVOS]
├── Súmulas do STJ e STF (não vinculantes)
├── Precedentes das Seções e Cortes Especiais
├── Julgamentos com IAC (Incidente de Assunção de Competência)
└── Jurisprudência dos Tribunais de Justiça e TRFs
```

---

## Banco de Súmulas e Teses por Área

### Direito Bancário

| Referência | Enunciado (síntese) |
|-----------|---------------------|
| Súmula 541/STJ | Capitalização mensal dos juros é admitida em contratos bancários celebrados após 31.3.2000 |
| Súmula 566/STJ | Nos contratos bancários pós-29.12.1990, não incide CMN Res. 15/1964 |
| Súmula 382/STJ | A estipulação de juros remuneratórios superiores a 12% a.a. não indica, por si só, abusividade |
| Súmula 297/STJ | CDC aplica-se às instituições financeiras |
| Súmula 388/STJ | Dano moral pela negativação indevida — in re ipsa |
| Tema 958/STJ (Repetitivo) | Tarifas bancárias: abusividade / legalidade das cobranças |
| Tema 618/STJ (Repetitivo) | Juros remuneratórios: parâmetros para revisão |

### Direito do Consumidor

| Referência | Enunciado (síntese) |
|-----------|---------------------|
| Súmula 297/STJ | CDC aplica-se às instituições financeiras |
| Súmula 469/STJ | CDC aplica-se aos contratos de planos de saúde |
| Súmula 563/STJ | CDC aplica-se às entidades abertas de previdência complementar |
| Súmula 286/STJ | CDC aplica-se ao contrato de arrendamento mercantil |
| Tema 786/STF (RG) | CDC aplica-se a contratos entre brasileiros no exterior |

### Responsabilidade Civil

| Referência | Enunciado (síntese) |
|-----------|---------------------|
| Súmula 37/STJ | Danos morais e materiais são cumuláveis |
| Súmula 227/STJ | PJ pode sofrer dano moral |
| Súmula 370/STJ | Corte de serviços essenciais = dano moral presumido |
| Súmula 403/STJ | Uso não autorizado de imagem = dano moral in re ipsa |
| Súmula 498/STJ | Prazo prescricional para reparação de dano moral: 3 anos |

### Processo Civil (CPC 2015)

| Referência | Enunciado (síntese) |
|-----------|---------------------|
| Súmula 293/STJ | Cabe agravo contra decisão que não admite RE/REsp |
| Tema 1.076/STJ | Honorários recursais: cabimento e cálculo |
| Enunciados do FPPC | Fórum Permanente de Processualistas Civis |

### Família

| Referência | Enunciado (síntese) |
|-----------|---------------------|
| Súmula 655/STJ | Prazo decadencial no reconhecimento de filiação |
| Súmula 529/STJ | No divórcio, partilha de bem gravado com cláusula de incomunicabilidade |
| Tema 1.010/STJ | Alimentos gravídicos |

---

## Estratégias de Pesquisa por Situação

### Situação 1: "Preciso de jurisprudência para fundamentar [tese X]"

**Processo:**
1. Identificar a área do direito e o ponto jurídico específico
2. Mapear palavras-chave: nome da tese, artigo de lei, parte da ementa
3. Sugerir busca nas fontes primárias com os termos corretos
4. Apresentar as súmulas e temas repetitivos conhecidos
5. Indicar o caminho de verificação para uso profissional

**Template de output:**
```
📌 PESQUISA JURISPRUDENCIAL — [Tema]

🔑 Palavras-chave sugeridas para busca:
• "[termo 1]" AND "[termo 2]"
• "[artigo X]" AND "[princípio]"

📚 Referências conhecidas (verificar nas fontes antes de usar):
• Súmula XXX/STJ: [enunciado]
• Tema YYY/STJ (Repetitivo): [síntese da tese fixada]
• RG Tema ZZZ/STF: [síntese]

🔗 Links para verificação:
• STJ: [url de busca]
• STF: [url de busca]

⚠️ Importante: Confirme número, data e relator antes de usar em 
   peças processuais ou decisões.
```

### Situação 2: "Preciso identificar se existe divergência sobre [questão]"

**Processo:**
1. Apresentar as correntes doutrinárias/jurisprudenciais existentes
2. Mapear os tribunais que adotam cada posição
3. Identificar se STJ/STF já pacificou a questão ou se há IRDR/repetitivo pendente
4. Recomendar posição mais segura para o caso concreto

### Situação 3: "Qual a evolução jurisprudencial sobre [tema]?"

**Processo:**
1. Marcos temporais relevantes (pré e pós-CPC/2015, pré e pós-CDC, etc.)
2. Reviravolta jurisprudencial — indicar quando houve overruling
3. Estado atual consolidado
4. Tendências identificadas nos julgamentos recentes

---

## Formato de Ementa Estruturada

Para apresentar jurisprudência, sempre usar:

```
[ÁREA DO DIREITO]. [TEMA ESPECÍFICO]. [TESE CENTRAL].

[Desenvolvimento: fatos → questão → aplicação da norma → conclusão]

[Dispositivo legal aplicado]

[Tribunal], [Órgão julgador], [Tipo de recurso] n. [número], 
Rel. Min./Des. [nome], j. [data], [publicação].
```

---

## Pesquisa Temática por Artigo de Lei

Quando o usuário informar um artigo, identificar:
- Controvérsias interpretativas conhecidas
- Súmulas relacionadas
- Teses em repercussão geral / recursos repetitivos
- Enunciados do FPPC aplicáveis
- Doutrina majoritária

---

## Integração com n8n (automação)

Para workflows automáticos de pesquisa jurisprudencial via n8n, combinar com:
- **HTTP Request** para APIs dos tribunais (quando disponíveis)
- **AI Agent** para análise e classificação dos resultados
- **Vector Store** para indexação e recuperação semântica de ementas

---

## Checklist de Qualidade da Citação Jurídica

Antes de usar qualquer citação em peça ou decisão:
- [ ] Número do processo verificado na fonte oficial
- [ ] Data de julgamento confirmada
- [ ] Relator correto
- [ ] Turma/Seção/Pleno correto
- [ ] Tese fixada fiel ao acórdão (não apenas à ementa)
- [ ] Vigência confirmada (não houve superação do precedente)
- [ ] Aplicabilidade ao caso concreto justificada (distinguishing se necessário)
