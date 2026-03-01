---
name: lex-pkm-juridico
description: Sistema de gestão do conhecimento jurídico pessoal (Personal Knowledge Management) para magistrados, pesquisadores e juristas. Organiza notas de pesquisa, anotações de leituras jurídicas, insights doutrinários, ideias para artigos e livros, conexões entre conceitos e evolução de teses em um segundo cérebro estruturado. Usar quando o usuário precisar capturar insights jurídicos, organizar notas de estudo, criar mapas conceituais de temas jurídicos, conectar ideias entre projetos (livros, artigos, decisões, pós-graduação), processar transcrições de congressos ou webinars jurídicos, ou gerenciar sua base de conhecimento pessoal. Ativar ao ver: "nota", "anotação", "insight", "ideia para artigo", "resumo de leitura", "segundo cérebro", "PKM", "Obsidian", "zettelkasten", "mapa mental", "conectar conceitos", "processar transcrição".
---

# Lex PKM Jurídico — Segundo Cérebro para Magistrados e Pesquisadores

## Filosofia: Zettelkasten Jurídico

O Zettelkasten (caixa de notas) aplicado ao Direito cria uma rede de conhecimento 
viva onde cada conceito aponta para outros, permitindo descobertas não-lineares:

```
CAPTURAR → PROCESSAR → CONECTAR → CRIAR
    │            │           │         │
  Insight    Atomic     Links    Artigo/
  bruto      Note       entre     Livro/
             (+ID)      notas    Decisão
```

---

## Estrutura de Notas Atômicas Jurídicas

### Template: Nota de Conceito Jurídico

```markdown
---
id: [AAAAMMDD-HH-tema-curto]
tipo: conceito | doutrina | jurisprudência | síntese | insight | questão
area: civil | processual | consumidor | bancário | família | outro
tags: [tag1, tag2, tag3]
fonte: [autor, obra, p. XX] | [STJ, REsp XXXX] | [própria reflexão]
status: rascunho | desenvolvida | madura
criada: [data]
conexoes: [ID-nota-1, ID-nota-2]
---

# [Título da nota — uma ideia completa]

## Conceito Central
[A ideia em 1-3 frases. Suficiente para entender sem contexto.]

## Desenvolvimento
[Aprofundamento, nuances, exceções]

## Aplicação Prática
[Como isso se aplica em decisões / peças / pesquisa]

## Questões em Aberto
[O que ainda precisa ser investigado]

## Conexões
- [[ID-nota-relacionada-1]] — [por que conecta]
- [[ID-nota-relacionada-2]] — [por que conecta]

## Fonte
[Citação completa ou link]
```

---

## Tipos de Notas do Sistema

### 1. Notas de Literatura (Leitura)
Para artigos, capítulos de livros, acórdãos lidos:

```markdown
# Leitura: [Título da Obra/Artigo]
**Autor:** [nome]
**Onde:** [livro/revista/periódico]
**Lido em:** [data]
**Relevância para meus projetos:** [alto/médio/baixo + por quê]

## Resumo (em minhas palavras)
[3-5 frases capturando a essência]

## Citações que valem registrar
> "[trecho]" (p. XX)
→ *Minha leitura:* [interpretação/aplicação]

## Insights disparados
- [Ideia que surgiu enquanto lia]
- [Conexão com outro conceito que já sei]
- [Questionamento que surgiu]

## Notas atômicas a criar
- [ ] [[nota sobre tese X]]
- [ ] [[nota sobre conceito Y]]
```

### 2. Notas de Projeto (Livros, Artigos)

```markdown
# Projeto: [Nome do Livro/Artigo]
**Tipo:** livro técnico | ficção | artigo científico | capítulo
**Status:** esboço | escrevendo | revisão | publicado
**Prazo:** [data]

## Tese Central
[Em 1-2 frases: o que este trabalho defende/explora]

## Estrutura Planejada
- Capítulo 1: [título] → notas: [[ID1]], [[ID2]]
- Capítulo 2: [título] → notas: [[ID3]], [[ID4]]

## Lacunas de Pesquisa
- [ ] Preciso aprofundar: [tema]
- [ ] Preciso citar: [jurisprudência/doutrina]

## Ideias Brutas
[Qualquer ideia não processada ainda]
```

### 3. Notas de Audiência / Congresso

```markdown
# Evento: [Nome do Evento/Audiência]
**Data:** [data]
**Tipo:** congresso | palestra | audiência judicial | reunião

## Resumo (3-5 pontos principais)
1.
2.
3.

## Insights Imediatos
- [Algo que mudou meu entendimento sobre X]
- [Ideia para aplicar em projeto Y]

## Follow-ups
- [ ] Verificar: [tema mencionado]
- [ ] Procurar: [obra citada]
- [ ] Contatar: [pessoa]

## Notas atômicas a criar
- [ ] [conceito novo aprendido]
```

### 4. Notas de Pesquisa de Campo (Dados Empíricos)

```markdown
# Pesquisa: [Título]
**Tribunal/Fonte:** [onde foi colhida]
**Período:** [início] a [fim]
**N amostral:** [número de processos/decisões]

## Metodologia
[Como foi feita a coleta]

## Achados Principais
| Dado | Valor | Interpretação |
|------|-------|---------------|
| [dado] | [valor] | [o que significa] |

## Implicações para o argumento
[Como esses dados sustentam ou questionam minha tese]
```

---

## Fluxo PKM Diário

### Rotina Matinal (15 min)
```
1. CAPTURA: Checar inbox de notas (Rascunhos não processados)
2. PRIORIZAR: Qual projeto recebe atenção hoje?
3. CONECTAR: Uma conexão entre notas existentes
```

### Processamento Semanal (1h)
```
1. Processar notas brutas → notas atômicas
2. Atualizar índices dos projetos ativos
3. Identificar lacunas de pesquisa
4. Revisar notas "questão aberta" → respondidas?
```

---

## Mapas do Conhecimento (MOCs — Maps of Content)

Para cada grande área, manter um MOC:

```markdown
# MOC: Direito Bancário — Revisão Contratual

## Conceitos Fundamentais
- [[capitalização-juros-regime-financeiro]]
- [[taxas-bancarias-legalidade]]
- [[responsabilidade-objetiva-bancos-CDC]]

## Jurisprudência Chave
- [[stj-tema-958-tarifas-bancarias]]
- [[stj-sumula-541-capitalizacao]]

## Minhas Teses em Desenvolvimento
- [[tese-abusividade-tarifas-varejo]]
- [[tese-dano-moral-automatico-negativacao]]

## Projetos que usam este MOC
- [[livro-direito-futuro-cap3]]
- [[artigo-ia-contratos-bancarios]]
```

---

## Indexação e Busca

### Tags Padrão do Sistema
```
#conceito-central    — Ideia nuclear de uma área
#doutrina           — Posição doutrinária específica
#jurisprudencia     — Posição jurisprudencial
#divergencia        — Tema controvertido
#tese-propia        — Desenvolvimento pessoal do autor
#em-construcao      — Nota incompleta
#para-artigo        — Material para publicação
#para-sentenca      — Aplicável em decisões judiciais
#para-livro         — Material para livros
#referencia         — Fonte a ser citada
#conexao-forte      — Link muito importante entre notas
```

### IDs das Notas — Convenção
```
AAAAMMDD-XX-tema-curto
20240315-01-capitalizacao-juros
20240315-02-sumula-541-stj
```

---

## Integração com Projetos Lex Intelligentia

### Do PKM para Decisões
```
1. Pesquisar notas por tag #para-sentenca
2. Selecionar notas relevantes ao caso em julgamento
3. Alimentar a skill sentenca-judicial-br com as notas
4. A sentença incorpora o conhecimento acumulado
```

### Do PKM para Livros/Artigos
```
1. Consultar o MOC da área do artigo
2. Verificar notas com tag #para-artigo
3. Verificar lacunas de pesquisa no projeto
4. Usar a skill academic-writer-br para estruturar
```

### Do PKM para Conteúdo Social
```
1. Buscar insights marcados como #insight-publicavel
2. Checar notas recentes sobre temas em alta
3. Alimentar skill social-content-juridico
```

---

## Processamento de Transcrições com IA

Quando o usuário colar uma transcrição (palestra, webinar, audiência):

```
1. RESUMIR os pontos principais em tópicos
2. EXTRAIR insights acionáveis
3. IDENTIFICAR conceitos novos a criar como notas atômicas
4. SUGERIR conexões com notas existentes (baseadas em contexto)
5. LISTAR follow-ups e ações
6. GERAR template de nota de evento preenchido
```

---

## Workflow de Captura Rápida

Para captura em qualquer contexto (mobile, durante leitura):

```markdown
# RÁPIDA: [título breve da ideia]
**Contexto:** [onde estava quando surgiu]
**Data:** [hoje]

[A ideia em 1-3 frases brutas]

→ Processar depois: [ ]
```

Depois, processar para nota atômica completa no fluxo semanal.
