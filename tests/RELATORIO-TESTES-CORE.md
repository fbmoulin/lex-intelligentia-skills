# Relatório de Testes — 3 Core Skills

**Data:** 2026-03-01
**Caso de teste:** Consumidor — Veículo com Vício Oculto (Câmbio CVT)
**Workflow testado:** peticao-analyzer → jurisprudencia-miner → sentenca-judicial-br

---

## Resumo Executivo

| Skill | Score | Veredicto |
|-------|-------|-----------|
| `peticao-analyzer` | **9/10** | Framework CAPPD sólido. 3 gaps menores. |
| `jurisprudencia-miner` | **8.5/10** | Anti-alucinação robusto (zero fabricações). 4 gaps de profundidade. |
| `sentenca-judicial-br` | **8.5/10** | FIRAC-JB funciona bem. 5 gaps técnicos-jurídicos. |

**Pipeline completo:** Funciona. O fluxo CAPPD → Precedentes → FIRAC-JB produz uma sentença utilizável como minuta inicial. Todas as marcações anti-alucinação estão presentes. A fundamentação analítica atende ao art. 489, §1°, CPC.

---

## Gaps Encontrados e Melhorias Propostas

### peticao-analyzer (3 gaps)

| # | Gap | Impacto | Melhoria proposta |
|---|-----|---------|-------------------|
| P1 | Sem template de análise conjunta (petição + contestação) | MÉDIO | Adicionar seção "Análise Consolidada" que cruza automaticamente petição e contestação em tabela única |
| P2 | Sem campo dedicado para fatos não impugnados (art. 341, CPC) | ALTO | Adicionar campo `[FATOS ADMITIDOS — ART. 341, CPC]` no template de contestação com lista explícita |
| P3 | Quantificação de pedidos pouco estruturada | BAIXO | Adicionar tabela: Pedido → Valor → Base legal → Tipo (cumulação própria/imprópria) |

### jurisprudencia-miner (4 gaps)

| # | Gap | Impacto | Melhoria proposta |
|---|-----|---------|-------------------|
| J1 | Sem referências a Temas Repetitivos do STJ | ALTO | Adicionar seção de Temas Repetitivos por área (paralela às Súmulas), com [VERIFICAR] obrigatório |
| J2 | Falta sinalização de divergência jurisprudencial | MÉDIO | Adicionar marcador `[DIVERGÊNCIA]` quando houver correntes opostas identificadas |
| J3 | Parâmetros indenizatórios genéricos | MÉDIO | Adicionar tabela de faixas indenizatórias por tipo de dano moral (baseada em levantamentos de TJs) |
| J4 | Output não diferencia pesquisa para sentença vs. petição | BAIXO | Adicionar campo `[CONTEXTO DE USO]` no template (sentença/petição/parecer) |

### sentenca-judicial-br (5 gaps)

| # | Gap | Impacto | Melhoria proposta |
|---|-----|---------|-------------------|
| S1 | Termo inicial de juros não diferencia contratual/extracontratual | ALTO | Adicionar bloco padrão: extracontratual → Súmula 54/STJ (evento danoso); contratual → citação |
| S2 | Índice de correção não menciona EC 113/2021 | MÉDIO | Adicionar nota sobre IPCA-E (privados) vs. Selic (Fazenda Pública, EC 113/2021) |
| S3 | Falta bloco para tratamento da tutela de urgência na sentença | ALTO | Adicionar template: "Confirmo/Revogo a tutela provisória anteriormente deferida/indeferida" |
| S4 | Falta menção ao recurso cabível no dispositivo | MÉDIO | Adicionar ao template: "Recurso: apelação, prazo de 15 dias úteis (art. 1.009, CPC)" |
| S5 | Sucumbência recíproca sem parâmetro objetivo | BAIXO | Adicionar fórmula: se autor obtém > 90% do pretendido → sucumbência mínima (art. 86, p.ú., CPC) |

---

## Protocolo Anti-Alucinação — Resultado

| Métrica | Resultado |
|---------|-----------|
| Números de processo inventados | **0** |
| Nomes de ministros inventados | **0** |
| Datas de julgamento inventadas | **0** |
| Súmulas com descrição incorreta | **0** |
| Marcações [CONFIRMAR]/[VERIFICAR] presentes | **100%** |
| Nível de confiança declarado em cada citação | **SIM** |
| Fallback Nível 3 usado quando necessário | **SIM** |

**Veredicto anti-alucinação: APROVADO** — O protocolo de 3 níveis funcionou conforme esperado. Nenhuma citação fabricada foi produzida.

---

## Teste de Pipeline Completo

```
PETIÇÃO INICIAL (input bruto)
      │
      ▼
peticao-analyzer (CAPPD)
      │  Output: Partes, causa de pedir, pedidos, provas,
      │  pontos controvertidos, pontos de atenção
      │
      ▼
jurisprudencia-miner (3 Níveis)
      │  Input: Questões de direito do CAPPD
      │  Output: Precedentes classificados por confiança
      │  + palavras-chave + links de verificação
      │
      ▼
sentenca-judicial-br (FIRAC-JB)
      │  Input: CAPPD + Precedentes + Fatos
      │  Output: Minuta completa (Relatório + Fundamentação
      │  analítica + Dispositivo)
      │
      ▼
REVISÃO HUMANA (checklist METODOLOGIA-FIRAC-JB.md)
      │  Verificação: art. 489 §1° + anti-alucinação
      │
      ▼
SENTENÇA FINAL
```

**Status do pipeline:** FUNCIONAL. A cadeia petição → pesquisa → sentença opera como projetado. Os outputs de cada skill alimentam corretamente a próxima.

---

## Prioridade de Implementação das Melhorias

### Prioridade 1 — ALTO IMPACTO (implementar agora)
- **S1:** Bloco de juros contratual vs. extracontratual
- **S3:** Template de tutela de urgência na sentença
- **P2:** Campo de fatos admitidos (art. 341, CPC)
- **J1:** Seção de Temas Repetitivos do STJ

### Prioridade 2 — MÉDIO IMPACTO (próxima iteração)
- **P1:** Template de análise consolidada
- **J2:** Marcador de divergência jurisprudencial
- **J3:** Tabela de parâmetros indenizatórios
- **S2:** Nota sobre EC 113/2021
- **S4:** Recurso cabível no dispositivo

### Prioridade 3 — BAIXO IMPACTO (quando conveniente)
- **P3:** Tabela de quantificação de pedidos
- **J4:** Diferenciação sentença vs. petição
- **S5:** Fórmula de sucumbência recíproca

---

## Arquivos do Teste

| Arquivo | Conteúdo |
|---------|----------|
| `caso-teste-01-consumidor-veiculo.md` | Petição inicial + contestação (input) |
| `teste-01-peticao-analyzer-output.md` | Output CAPPD + avaliação |
| `teste-01-jurisprudencia-miner-output.md` | Pesquisa jurisprudencial + avaliação |
| `teste-01-sentenca-judicial-br-output.md` | Minuta de sentença + avaliação |
| `RELATORIO-TESTES-CORE.md` | Este relatório consolidado |
