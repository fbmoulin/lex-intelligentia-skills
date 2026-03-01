# Relatório de Teste 02 — Caso Bancário (Revisional + Negativação)

**Data:** 2026-03-01
**Caso:** Revisional de contrato bancário c/c repetição de indébito c/c danos morais
**Workflow:** peticao-analyzer → jurisprudencia-miner → sentenca-judicial-br

---

## Resumo Executivo

| Skill | Teste 01 (Consumidor) | Teste 02 (Bancário) | Delta |
|-------|-----------------------|---------------------|-------|
| `peticao-analyzer` | 9/10 | **9.5/10** | +0.5 |
| `jurisprudencia-miner` | 8.5/10 | **9/10** | +0.5 |
| `sentenca-judicial-br` | 8.5/10 | **9.5/10** | +1.0 |

**Média geral:** Teste 01 = 8.67 → Teste 02 = **9.33** (+0.66 após as 4 melhorias)

---

## Validação das 4 Melhorias Implementadas

| # | Melhoria | Exercitada? | Resultado | Impacto real |
|---|----------|-------------|-----------|-------------|
| S1 | Juros contratual vs. extracontratual | SIM | **PASS** | Repetição (contratual → citação) vs. dano moral (extracontratual → evento danoso, Súmula 54). Distinção correta na mesma sentença. |
| S3 | Tutela de urgência na sentença | SIM | **PASS** | Tutela confirmada com referência ao art. 1.012, §1°, V, CPC. Recurso cabível mencionado. |
| P2 | Fatos admitidos (art. 341, CPC) | SIM | **PASS** | 8 fatos admitidos listados: contrato, valor, pagamentos, saldo devedor, taxa efetiva, ausência de inscrições, renda. Informa diretamente a fundamentação. |
| J1 | Temas Repetitivos do STJ | SIM | **PASS** | Temas 24 (capitalização), 618/619 (tarifas), 622 (negativação) citados com nível CONFIRMADO e [CONFIRMAR]. Base da fundamentação da sentença. |

**Conclusão:** As 4 melhorias são funcionais e impactam positivamente a qualidade das minutas.

---

## Destaques do Caso Bancário

### O que este caso testou que o Teste 01 não testou

1. **Procedência PARCIAL com pedidos deferidos e indeferidos** — a sentença manteve capitalização e seguro, mas excluiu tarifa e concedeu danos morais. Teste 01 era procedência quase total.

2. **Distinguishing real** — diferenciou "tarifa de cadastro" (lícita, Temas 618/619) de "tarifa de manutenção de cadastro" (ilícita). A skill produziu distinguishing aplicado ao caso concreto.

3. **Duas naturezas de obrigação na mesma sentença** — contratual (repetição) e extracontratual (dano moral) com termos iniciais de juros distintos. Validou o bloco S1.

4. **Sucumbência recíproca real** — não mínima como no Teste 01. Repartição 60/40 fundamentada.

5. **Repetição em dobro com fundamentação específica** — EAREsp 676.608/RS citado com modulação de efeitos, sem inventar dados.

6. **Negativação parcialmente indevida** — cenário mais nuançado que "totalmente indevida". A sentença reconheceu que o débito principal existia, mas a parcela indevida (tarifa) contaminava a cobrança.

---

## Anti-Alucinação — Comparativo

| Métrica | Teste 01 | Teste 02 |
|---------|----------|----------|
| Números de processo inventados | 0 | 0 |
| Nomes de ministros inventados | 0 | 0 |
| Datas inventadas | 0 | 0 |
| Súmulas com descrição incorreta | 0 | 0 |
| Temas Repetitivos citados | 0 | **4** (24, 618, 619, 622) |
| Marcações [CONFIRMAR]/[VERIFICAR] | 100% | 100% |

---

## Gaps Remanescentes (Prioridade 2)

| # | Gap | Skill | Observação |
|---|-----|-------|-----------|
| P1 | Template de análise consolidada (petição + contestação) | peticao-analyzer | Ainda não existe — seria útil para magistrado |
| J2 | Marcador de divergência jurisprudencial | jurisprudencia-miner | Não testado neste caso (temas eram pacificados) |
| J3 | Tabela de parâmetros indenizatórios por tipo | jurisprudencia-miner | Faixas genéricas citadas mas sem tabela estruturada |
| S2 | Nota sobre EC 113/2021 (Fazenda Pública) | sentenca-judicial-br | Não testado (caso entre particulares) |
| S5 | Fórmula objetiva de sucumbência recíproca | sentenca-judicial-br | Repartição 60/40 fundamentada mas sem cálculo formal |

---

## Arquivos do Teste 02

| Arquivo | Conteúdo |
|---------|----------|
| `caso-teste-02-bancario-revisional.md` | Petição inicial + contestação |
| `teste-02-peticao-analyzer-output.md` | Output CAPPD + avaliação |
| `teste-02-jurisprudencia-miner-output.md` | Pesquisa jurisprudencial + avaliação |
| `teste-02-sentenca-judicial-br-output.md` | Minuta de sentença + avaliação |
| `RELATORIO-TESTE-02-BANCARIO.md` | Este relatório |
