# ⚖️ Lex Intelligentia Skills

> O primeiro ecossistema de Agent Skills para o **Direito Brasileiro**.  
> Desenvolvido por um juiz de direito, para magistrados, advogados e pesquisadores jurídicos.

[![Skills](https://img.shields.io/badge/skills-17-blue?style=flat-square)](./skills)
[![Língua](https://img.shields.io/badge/idioma-Português%20BR-green?style=flat-square)]()
[![Compatível com](https://img.shields.io/badge/compatível%20com-Claude.ai%20·%20Claude%20Code%20·%20API-orange?style=flat-square)]()
[![Licença](https://img.shields.io/badge/licença-MIT-lightgrey?style=flat-square)](./LICENSE)

---

## O que são Agent Skills?

Agent Skills são instruções modulares que ensinam ao Claude como executar tarefas específicas de forma repetível e padronizada. O Claude carrega automaticamente a skill relevante com base no contexto da conversa — sem comandos manuais.

**Cada skill contém:**
- `SKILL.md` com frontmatter YAML (ativa o trigger automático) + instruções completas
- Templates, checklists, fórmulas e referências normativas prontos para uso

> 📖 [Documentação oficial de Skills — Anthropic](https://docs.anthropic.com/pt/docs/claude-code/skills-guide)

---

## 🗺️ Mapa das Skills

### `core/` — Fundamentos para qualquer jurista

| Skill | Descrição | Triggers |
|-------|-----------|---------|
| [`sentenca-judicial-br`](./skills/core/sentenca-judicial-br/) | Geração de minutas de sentença com metodologia FIRAC-JB | `sentença`, `decisão`, `fundamentação`, `dispositivo` |
| [`peticao-analyzer`](./skills/core/peticao-analyzer/) | Análise estruturada de petições e peças processuais | `petição`, `contestação`, `analisar processo` |
| [`jurisprudencia-miner`](./skills/core/jurisprudencia-miner/) | Pesquisa de precedentes com protocolo anti-alucinação | `jurisprudência`, `súmula`, `tese STJ`, `precedente` |
| [`dje-monitor`](./skills/core/dje-monitor/) | Extração e monitoramento de publicações em diários oficiais | `DJE`, `DOU`, `prazo processual`, `intimação` |
| [`tese-juridica-validator`](./skills/core/tese-juridica-validator/) | Validação de argumentos em 5 dimensões contra precedentes | `validar argumento`, `minha tese é`, `tese sólida` |

### `magistrado/` — Específicas para a magistratura

| Skill | Descrição | Triggers |
|-------|-----------|---------|
| [`audiencia-analyzer`](./skills/magistrado/audiencia-analyzer/) | Transcrição, estruturação e análise de audiências judiciais | `audiência`, `ata`, `depoimento`, `oitiva` |
| [`conciliacao-assistant`](./skills/magistrado/conciliacao-assistant/) | Estratégia de acordo baseada em precedentes + minuta de termo | `acordo`, `conciliação`, `ZOPA`, `CEJUSC` |
| [`contrato-analyzer-br`](./skills/magistrado/contrato-analyzer-br/) | Análise de contratos com checklists por tipo | `contrato`, `cláusula abusiva`, `locação`, `financiamento` |
| [`prompt-forge-juridico`](./skills/magistrado/prompt-forge-juridico/) | Gerador de prompts otimizados para automação jurídica | `prompt para`, `instrução para IA`, `template jurídico` |

### `pesquisador/` — Produção acadêmica e gestão do conhecimento

| Skill | Descrição | Triggers |
|-------|-----------|---------|
| [`academic-writer-br`](./skills/pesquisador/academic-writer-br/) | Escrita acadêmica jurídica com normas ABNT completas | `artigo científico`, `ABNT`, `Qualis`, `dissertação` |
| [`lex-pkm-juridico`](./skills/pesquisador/lex-pkm-juridico/) | Sistema Zettelkasten jurídico — segundo cérebro do magistrado | `nota jurídica`, `PKM`, `Obsidian`, `segundo cérebro` |

### `automacao/` — Integração com sistemas e pipelines

| Skill | Descrição | Triggers |
|-------|-----------|---------|
| [`lex-document-ocr`](./skills/automacao/lex-document-ocr/) | OCR e extração estruturada de documentos jurídicos em PDF | `OCR`, `extrair PDF`, `processar certidão` |
| [`lex-rag-builder`](./skills/automacao/lex-rag-builder/) | Pipeline RAG para bases de conhecimento jurídico | `RAG`, `vector store`, `embedding jurídico` |
| [`n8n-workflow-generator`](./skills/automacao/n8n-workflow-generator/) | Geração de workflows n8n para automação jurídica | `n8n`, `workflow`, `automação` |
| [`n8n-legal-config`](./skills/automacao/n8n-legal-config/) | Configuração de nodes n8n para fluxos jurídicos | `configurar n8n`, `node jurídico`, `AI Agent node` |

### `criacao/` — Conteúdo e publicações

| Skill | Descrição | Triggers |
|-------|-----------|---------|
| [`social-content-juridico`](./skills/criacao/social-content-juridico/) | Criação de conteúdo jurídico para LinkedIn, Instagram e Reels | `post`, `carrossel`, `LinkedIn`, `Reels jurídico` |
| [`ficao-digital-juvenil`](./skills/criacao/ficao-digital-juvenil/) | Escrita de ficção YA sobre crimes digitais — precisão jurídica | `ficção`, `capítulo`, `personagem adolescente`, `YA` |

---

## ⚡ Instalação Rápida

### Claude.ai (interface web/mobile)

1. Acesse **Configurações → Skills → Adicionar skill**
2. Cole o conteúdo do `SKILL.md` desejado
3. Salve — o Claude carrega a skill automaticamente quando relevante

### Claude Code (terminal)

```bash
# Clonar o repositório completo
git clone https://github.com/fbmoulin/lex-intelligentia-skills.git ~/.claude/skills/lex-intelligentia

# Ou instalar via marketplace (quando disponível)
/plugin marketplace add lex-intelligentia-skills
```

### API (via system prompt)

Copie o conteúdo do `SKILL.md` desejado e cole no `system` da sua requisição.

---

## 🔄 Mapa de Integração

```
PROCESSO JUDICIAL
      │
      ├──→ peticao-analyzer ──────→ sentenca-judicial-br
      │                                      │
      ├──→ audiencia-analyzer ───────────────┘
      │
      ├──→ dje-monitor ──────────→ agenda de prazos automática
      │
      └──→ lex-document-ocr ──→ lex-rag-builder ──→ jurisprudencia-miner
                                        │
                         ┌──────────────┼──────────────┐
                         ▼              ▼              ▼
              academic-writer-br  social-content   conciliacao-assistant
              (artigos/livros)    (redes sociais)  (proposta de acordo)
                         │
                         ▼
              ficao-digital-juvenil
              (literatura YA)
```

---

## 📋 Requisitos

- **Claude Pro, Max, Team ou Enterprise** com execução de código ativada
- Para Claude Code: Node.js 18+ instalado
- Skills de automação (`n8n-*`, `lex-rag-builder`): requerem conta n8n e/ou Supabase

---

## 🤝 Contribuindo

Contribuições são bem-vindas, especialmente para:

- Novas áreas do Direito Brasileiro (Penal, Tributário, Trabalhista, Ambiental)
- Tribunais não cobertos (TRF-1, TST, TSE, TRFs regionais)
- Correções de jurisprudência desatualizada
- Traduções para uso em sistemas de Direito Lusófono (Portugal, Angola, Moçambique)

**Para contribuir:**
1. Fork o repositório
2. Crie uma branch: `git checkout -b feat/nome-da-skill`
3. Siga o padrão do `SKILL.md` (frontmatter YAML + markdown)
4. Abra um Pull Request com descrição do que a skill faz e por que é útil

---

## 📚 Documentação

| Documento | Conteúdo |
|-----------|----------|
| [METODOLOGIA-FIRAC-JB.md](./docs/METODOLOGIA-FIRAC-JB.md) | Raciocínio jurídico em 5 etapas + exemplo prático + checklist de validação |
| [GUIA-ANTI-ALUCINACAO.md](./docs/GUIA-ANTI-ALUCINACAO.md) | Protocolo de 3 níveis para citação segura + termos de busca por área |
| [ARQUITETURA-LEX-INTELLIGENTIA.md](./docs/ARQUITETURA-LEX-INTELLIGENTIA.md) | Mapa de conexão entre as 17 skills + workflows completos + I/O de cada skill |

---

## ⚠️ Aviso Legal

As skills deste repositório são ferramentas de **apoio** ao trabalho jurídico. Toda saída gerada com IA deve ser **revisada e validada** por profissional habilitado antes de uso em processos reais. As referências jurisprudenciais são orientativas — sempre verificar no tribunal de origem antes de citar em peças ou decisões.

---

## 📄 Licença

[MIT](./LICENSE) — livre para uso pessoal e comercial, com atribuição.

---

<div align="center">

**Desenvolvido por [Felipe](https://github.com/fbmoulin)**  
Juiz de Direito · Desenvolvedor · Pesquisador em IA Jurídica  
*2ª Vara Cível de Cariacica/ES*

*"A tecnologia não substitui o magistrado — amplifica sua capacidade de fazer justiça."*

</div>
