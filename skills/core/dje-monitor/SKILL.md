---
name: dje-monitor
description: Monitoramento, extração e análise de publicações em Diários da Justiça Eletrônicos (DJE/TJ-ES), Diário Oficial da União (DOU), Diário Oficial do Estado (DOE-ES) e publicações do TJSP, TRF-2, STJ e STF. Identifica: citações de partes/processos específicos, intimações, decisões publicadas, prazos processuais iniciados, editais de leilões judiciais, nomeações e atos administrativos. Usar quando o usuário precisar monitorar publicações em diários oficiais, calcular prazos a partir de publicações, extrair dados de citações específicas, identificar expediente de prazos (art. 224, CPC), analisar lotes de publicações ou verificar se um processo foi publicado. Disparar ao ver: "DJE", "DOU", "DOE", "diário oficial", "publicação judicial", "prazo processual", "intimação publicada", "expediente", "leilão judicial", "citação por edital".
---

# DJE Monitor — Inteligência sobre Diários Oficiais

## Tipos de Publicações e Extração

### 1. Intimações e Citações

**Campos a extrair de uma intimação:**
```json
{
  "tipo": "INTIMAÇÃO | CITAÇÃO | NOTIFICAÇÃO",
  "processo": "[número CNJ]",
  "vara": "[vara/câmara]",
  "comarca": "[comarca]",
  "parte_intimada": "[nome + advogado/OAB]",
  "objeto_da_intimacao": "[o que foi determinado]",
  "data_publicacao": "[AAAA-MM-DD]",
  "prazo_dias": [número],
  "prazo_uteis": true,
  "inicio_contagem": "[AAAA-MM-DD]",
  "vencimento": "[AAAA-MM-DD calculado]",
  "suspensao_recesso": false
}
```

**Cálculo de Prazo Processual (art. 224, CPC):**
```
REGRA: O prazo começa no primeiro dia útil após a publicação.

EXCEÇÕES (suspensão de prazos - art. 220, CPC):
- Recesso forense: 20/12 a 20/01
- Semana Santa (quando declarado pelo TJ)
- Prazos suspensos por ordem judicial

FÓRMULA:
Início = próximo dia útil após a publicação
Fim = data de início + (prazo - 1) dias úteis
(não contar sábados, domingos e feriados)

Feriados nacionais a considerar:
01/01, 21/04, 01/05, 07/09, 12/10, 02/11, 15/11, 25/12
```

### 2. Sentenças e Acórdãos Publicados

**Campos a extrair:**
```json
{
  "tipo_ato": "SENTENÇA | ACÓRDÃO | DECISÃO MONOCRÁTICA",
  "processo": "[número CNJ]",
  "resultado": "PROCEDENTE | IMPROCEDENTE | EXTINÇÃO | PROVIDO | NÃO PROVIDO",
  "juiz_relator": "[nome]",
  "data_publicacao": "[data]",
  "prazo_recursal_dias": 15,
  "inicio_recurso": "[data calculada]",
  "vencimento_recurso": "[data calculada]"
}
```

### 3. Editais de Leilão Judicial

**Campos relevantes:**
```json
{
  "tipo": "PRIMEIRO LEILÃO | SEGUNDO LEILÃO",
  "processo": "[número CNJ]",
  "bem": "[descrição do bem]",
  "valor_avaliacao": 0.00,
  "valor_lance_minimo_1": 0.00,
  "valor_lance_minimo_2": 0.00,
  "data_primeiro_leilao": "[data/hora]",
  "data_segundo_leilao": "[data/hora]",
  "plataforma": "[site do leiloeiro]",
  "leiloeiro": "[nome + JUCESP/JUCES]",
  "vara": "[vara de execução]"
}
```

### 4. Atos Administrativos (Nomeações, Portarias)

**Campos:**
```json
{
  "tipo_ato": "PORTARIA | RESOLUÇÃO | EDITAL | NOMEAÇÃO",
  "numero_ato": "[número/ano]",
  "autoridade": "[quem assina]",
  "objeto_resumido": "[síntese em 1 frase]",
  "data_vigencia": "[data de entrada em vigor]"
}
```

---

## Padrões de Busca para Monitoramento

### Regex para Identificação de Processos no DJE

```python
# Número CNJ
CNJ_FULL = r'\d{7}-\d{2}\.\d{4}\.\d\.\d{2}\.\d{4}'

# Número antigo (pré-CNJ)
OLD_PROC = r'\d{3,6}[./]\d{4}'

# CNPJ em publicações
CNPJ_PATTERN = r'\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}'

# CPF em publicações
CPF_PATTERN = r'\d{3}\.\d{3}\.\d{3}-\d{2}'

# Prazo explícito
PRAZO_PATTERN = r'prazo\s+de\s+(\d+)\s+(dias?|horas?)\s*(úteis?|corridos?)?'

# Data de publicação
DATA_DJE = r'(?:Vitória|Brasília),\s+\d{1,2}\s+de\s+\w+\s+de\s+\d{4}'
```

### Termos de Busca por Tipo de Processo

```python
FILTROS = {
    "execucao_bancaria": [
        "banco", "crédito", "financiamento", "devedor",
        "penhora", "expropriação", "leilão"
    ],
    "consumidor": [
        "consumidor", "fornecedor", "CDC", "vício",
        "dano moral", "plano de saúde"
    ],
    "possessorio": [
        "posse", "esbulho", "reintegração", "manutenção",
        "turbação", "interdito proibitório"
    ],
    "familia": [
        "divórcio", "guarda", "alimentos", "partilha",
        "herança", "inventário"
    ]
}
```

---

## Pipeline de Monitoramento Automatizado

### Fluxo n8n Integrado

```
TRIGGER (diário - 06h00)
    │
    ▼
DOWNLOAD DJE
[HTTP Request → URL do DJE do TJ-ES / DOE-ES]
    │
    ▼
EXTRAÇÃO DE TEXTO
[PDF → texto via OCR ou extração direta]
    │
    ▼
FILTRAR PUBLICAÇÕES RELEVANTES
[Code Node → filtrar por número de processo / nome de parte / comarca]
    │
    ▼
ESTRUTURAR DADOS
[AI Agent → extrair campos JSON]
    │
    ▼
CALCULAR PRAZOS
[Code Node → calcular dias úteis excluindo feriados e recessos]
    │
    ▼
ALERTAR
[WhatsApp / Email → notificação com prazo]
    │
    ▼
PERSISTIR
[Postgres → salvar registro para histórico]
```

### Fontes dos Diários

```python
FONTES_DJE = {
    "TJ-ES": {
        "url": "https://dje.tjes.jus.br/",
        "formato": "PDF",
        "frequencia": "diária (dias úteis)"
    },
    "TRF-2": {
        "url": "https://www.trf2.jus.br/trf2/dje/",
        "formato": "PDF",
        "frequencia": "diária (dias úteis)"
    },
    "STJ": {
        "url": "https://dje.stj.jus.br/",
        "formato": "PDF",
        "frequencia": "diária (dias úteis)"
    },
    "STF": {
        "url": "https://portal.stf.jus.br/diario/",
        "formato": "PDF",
        "frequencia": "diária"
    },
    "DOU": {
        "url": "https://www.in.gov.br/",
        "formato": "HTML/PDF",
        "frequencia": "diária",
        "secoes": ["Seção 1", "Seção 2", "Seção 3", "Extra"]
    }
}
```

---

## Calendário de Prazos e Suspensões

### Recesso Forense — TJ-ES (art. 220, CPC)

```
RECESSO DE FIM DE ANO: 20 de dezembro a 20 de janeiro
- Prazos suspensos
- Urgências continuam sendo julgadas

FERIADOS FORENSES ADICIONAIS (verificar Resolução TJ-ES vigente):
- Dia do Advogado: 11 de agosto (sem expediente forense)
- Dia da Justiça: 8 de dezembro (facultativo)
```

### Calculadora de Prazo em Python

```python
from datetime import date, timedelta
import holidays

def calcular_prazo(data_publicacao: date, prazo_dias: int, uteis: bool = True) -> dict:
    """
    Calcula data de início e vencimento do prazo processual.
    CPC/2015: Art. 224 (prazos em dias úteis)
    """
    feriados_nacionais = holidays.Brazil(years=data_publicacao.year)
    
    def is_dia_util(d: date) -> bool:
        return d.weekday() < 5 and d not in feriados_nacionais
    
    # Início: primeiro dia útil após publicação
    inicio = data_publicacao + timedelta(days=1)
    while not is_dia_util(inicio):
        inicio += timedelta(days=1)
    
    if not uteis:
        vencimento = inicio + timedelta(days=prazo_dias - 1)
    else:
        # Contar dias úteis
        dias_contados = 0
        atual = inicio
        while dias_contados < prazo_dias:
            if is_dia_util(atual):
                dias_contados += 1
                if dias_contados < prazo_dias:
                    atual += timedelta(days=1)
            else:
                atual += timedelta(days=1)
        vencimento = atual
    
    # Se vencimento cair em dia não útil, prorrogar
    while not is_dia_util(vencimento):
        vencimento += timedelta(days=1)
    
    return {
        "data_publicacao": data_publicacao.isoformat(),
        "inicio_contagem": inicio.isoformat(),
        "prazo_dias": prazo_dias,
        "tipo_prazo": "úteis" if uteis else "corridos",
        "vencimento": vencimento.isoformat(),
        "dias_restantes": (vencimento - date.today()).days
    }
```

---

## Outputs do DJE Monitor

### Relatório Diário de Prazos

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📰 MONITORAMENTO DJE — [DATA]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚠️ PRAZOS VENCENDO EM 3 DIAS:
• Processo XXXXXXX-XX.XXXX.X.XX.XXXX
  Ato: Contestação requerida
  Vence em: [data]

📋 PUBLICAÇÕES DE HOJE:
• [n] intimações identificadas
• [n] sentenças publicadas
• [n] editais de leilão

📅 AGENDA DA SEMANA:
[Data] — Prazo: [ato] — Processo: [número]
[Data] — Prazo: [ato] — Processo: [número]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Integração com Lex Intelligentia

O DJE Monitor alimenta:
- **Agenda judicial** automática com prazos calculados
- **Relatório mensal** de produtividade da vara
- **Dashboard** de processos com status atualizado
- **Alertas** para partes que precisam ser notificadas
