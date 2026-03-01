---
name: audiencia-analyzer
description: Processamento, transcrição, estruturação e análise de audiências judiciais (instrução e julgamento, tentativa de conciliação, depoimento pessoal, oitiva de testemunhas). Converte gravações ou transcrições brutas em atas estruturadas, extrai depoimentos por pergunta e resposta, identifica contradições, prepara resumo para sentença e gera minutas de termos de audiência. Usar quando o usuário precisar transcrever audiência, estruturar ata de audiência, extrair depoimentos, identificar pontos relevantes para sentença, gerar termo de audiência, analisar consistência de depoimentos ou preparar relatório de audiência. Ativar para: "audiência", "ata de audiência", "termo de audiência", "depoimento", "testemunha", "oitiva", "transcrição de audiência", "instrução", "conciliação judicial", "interrogatório".
---

# Audiência Analyzer — Processamento Inteligente de Audiências Judiciais

## Tipos de Audiência e Seus Outputs

### 1. Audiência de Conciliação (art. 334, CPC)

**Output padrão:**
```
TERMO DE AUDIÊNCIA DE CONCILIAÇÃO

Processo nº: [CNJ]
Vara: [vara]  |  Comarca: [comarca]
Data: [data]  |  Horário: [início] às [fim]
Magistrado(a): [nome]
Conciliador(a): [nome, se houver]

PARTES PRESENTES:
□ Autor: [nome] — [advogado/OAB ou pessoalmente]
□ Réu: [nome] — [advogado/OAB ou pessoalmente]
□ Ausente: [quem] — [justificativa ou sem justificativa]

TENTATIVA DE CONCILIAÇÃO:
[☑] Realizada — Resultado: [ACORDO | SEM ACORDO]
[  ] Não realizada — Motivo: [parte ausente / objeto não admite]

[SE ACORDO:]
TERMOS DO ACORDO:
1. [Obrigação 1 — quem, o quê, prazo]
2. [Obrigação 2]
3. Homologação: [sim/aguardando aprovação judicial]
Valor da condenação/acordo: R$ [valor]
Forma de pagamento: [à vista / parcelado em X parcelas de R$ Y]
Honorários advocatícios: [percentual e base de cálculo]

[SE SEM ACORDO:]
Motivo declarado: [síntese da razão do não acordo]
Próximo ato: Audiência de Instrução e Julgamento — [data designada]
```

---

### 2. Audiência de Instrução e Julgamento (art. 358, CPC)

**Estrutura completa:**
```
TERMO DE AUDIÊNCIA DE INSTRUÇÃO E JULGAMENTO

Processo nº: [CNJ]
Vara: [vara]  |  Comarca: [comarca]
Data: [data]  |  Horário início: [hora]  |  Fim: [hora]
Magistrado(a): [nome]

PARTES E PATRONOS:
Autor: [nome] — Adv. [nome], OAB/[UF] nº [número]
Réu: [nome] — Adv. [nome], OAB/[UF] nº [número]

PRELIMINAR — TENTATIVA DE CONCILIAÇÃO (art. 359, CPC):
[Realizada / Frustrada — motivo]

DEPOIMENTO PESSOAL DO AUTOR (se requerido/determinado):
Autor [nome], [qualificação]:

P: [pergunta do juiz / advogado do réu]
R: "[resposta literal ou fiel paráfrase]"

P: [próxima pergunta]
R: "[resposta]"

[Pelo advogado do autor, as seguintes perguntas:]
P: "[pergunta]"
R: "[resposta]"

DEPOIMENTO PESSOAL DO RÉU (se requerido/determinado):
[mesma estrutura]

OITIVA DA TESTEMUNHA DO AUTOR — [nome da testemunha]
[qualificação: nome, profissão, grau de instrução, endereço]
Compromisso legal prestado (art. 458, CPC).

P: [pergunta do juiz]
R: "[resposta]"
P: [pergunta do advogado do autor]
R: "[resposta]"
P: [pergunta do advogado do réu]  
R: "[resposta]"
P: [esclarecimento do juiz]
R: "[resposta]"
Nada mais a declarar. Encerrado o depoimento.

OITIVA DA TESTEMUNHA DO RÉU — [nome]
[mesma estrutura]

ENCERRAMENTO DA INSTRUÇÃO:
Declaradas encerradas as provas orais.

ALEGAÇÕES FINAIS:
□ Debates orais: [sim/não — tempo concedido]
□ Memoriais escritos: prazo de [X] dias para cada parte

JULGAMENTO:
□ Em audiência: [SENTENÇA lida/publicada em seguida]
□ Convertido em diligência: [motivo]
□ Prazo para sentença: [X] dias

Nada mais havendo, encerrou-se a audiência. 
Eu, [Escrevente], lavrei este termo.

Assinaturas: ________ (Juiz) | ________ (Adv. Autor) | ________ (Adv. Réu)
```

---

## Extração de Depoimentos por Tópico

Quando a transcrição é bruta (gravação ou ata informal), extrair por temas:

### Mapeamento Temático dos Depoimentos

```
QUESTÃO 1: [Ponto controvertido 1]
───────────────────────────────────
Autor declarou: "[trecho relevante]"
Réu declarou: "[trecho relevante]"
Testemunha A declarou: "[trecho relevante]"
Testemunha B declarou: "[trecho relevante]"

CONSISTÊNCIA: [✅ Depoimentos convergentes | ⚠️ Divergência: descrição]

QUESTÃO 2: [Ponto controvertido 2]
[mesma estrutura]
```

---

## Análise de Contradições e Inconsistências

### Tipos de Contradição a Identificar

```
TIPO 1 — CONTRADIÇÃO INTERNA
Mesmo depoente, duas afirmações incompatíveis:
• "[afirmação 1 — momento X do depoimento]"
• "[afirmação 2 — momento Y do depoimento]"
→ Avaliar: memória falha vs. inconsistência proposital

TIPO 2 — CONTRADIÇÃO COM PROVA DOCUMENTAL
Depoimento conflita com documento nos autos:
• Declarou: "[afirmação]"
• Documento (fl. XX) indica: "[conteúdo contraditório]"
→ Relevante para formação da convicção (art. 371, CPC)

TIPO 3 — CONTRADIÇÃO ENTRE DEPOENTES
Duas versões incompatíveis do mesmo fato:
• [Pessoa A] afirma: "[versão A]"
• [Pessoa B] afirma: "[versão B]"
→ Qual depoimento é mais crível? Critérios: coerência, detalhes, ausência de interesse
```

---

## Resumo para Sentença

Ao final da audiência, gerar bloco de fundamentação pronto para inserção na sentença:

```
ANÁLISE DA PROVA ORAL

O conjunto probatório formado nos autos revela que:

[Fato 1 provado]
A prova oral produzida em audiência confirma [fato], especialmente 
pelo depoimento de [testemunha/parte], que declarou [síntese do depoimento relevante].

[Fato 2 controvertido e como ficou decidido]
Embora o réu afirme que [versão do réu], o depoimento da testemunha 
[nome] — que não tem interesse no deslinde da causa — é mais crível 
ao relatar [versão da testemunha], corroborada pelo documento de fls. XX.

[Fato 3 — credibilidade]
O depoimento do autor merece crédito/reservas, pois [razão de 
credibilidade ou descrédito fundamentada nos elementos dos autos].
```

---

## Transcrição de Áudio/Vídeo de Audiência

### Workflow de Transcrição Automática

```
1. RECEBER: arquivo de áudio/vídeo (MP3/MP4/WAV)
2. TRANSCREVER: via Whisper (local) ou API de voz
3. IDENTIFICAR SPEAKERS: Juiz | Advogado Autor | Advogado Réu | 
                          Autor | Réu | Testemunha X
4. FORMATAR: Estrutura P: / R: por speaker
5. REVISAR: Identificar nomes de partes, números de processo
6. GERAR: Ata estruturada no formato TJSP/TJ-ES
```

### Prompt para Transcrição com Claude Vision/API

```
Você está processando a transcrição de uma audiência judicial brasileira.

Identifique os locutores como:
- JUIZ/JUÍZA: quem preside e formula perguntas oficiais
- ADV_AUTOR: advogado da parte autora
- ADV_REU: advogado da parte ré
- AUTOR: depoente que é parte autora
- REU: depoente que é parte ré  
- TEST_[N]: testemunha numerada por ordem de oitiva

Formate cada fala como:
[LOCUTOR]: "[fala]"

Mantenha fidelidade ao conteúdo. Para palavras inaudíveis: [inaudível].
Para incerteza: [sic] após palavra duvidosa.

Transcrição bruta:
[conteúdo]
```

---

## Checklist Pré-Audiência

Para o magistrado se preparar:

- [ ] Leu o relatório do processo (peticao-analyzer)
- [ ] Identificou os pontos controvertidos (art. 357, CPC)
- [ ] Perguntas específicas para cada testemunha preparadas
- [ ] Documentos controvertidos marcados para confrontar
- [ ] Verificou presença das testemunhas (art. 455, CPC)
- [ ] Verificou se há testemunhos a dispensar por acordo das partes

## Checklist Pós-Audiência

- [ ] Ata assinada pelas partes/advogados
- [ ] Gravação salva e indexada ao processo
- [ ] Prazo para memoriais/debates definido e intimado
- [ ] Resumo para sentença gerado (usar este output)
- [ ] Próximo ato agendado se instrução não concluída
