---
name: lex-document-ocr
description: Processamento, extração, estruturação e análise de documentos jurídicos em PDF e imagem, com foco no padrão brasileiro (peças processuais, certidões, laudos, contratos, documentos de cartório, publicações no DJE/DOU). Usar quando o usuário precisar extrair texto de PDFs jurídicos escaneados ou digitais, estruturar informações de contratos, certidões, laudos ou decisões, identificar dados de processo (número CNJ, partes, datas, valores), converter documentos para formato editável, processar lotes de documentos, extrair cláusulas contratuais ou dados para alimentar sistemas. Ativar para: "OCR jurídico", "extrair texto de PDF", "processar documento", "ler certidão", "extrair dados do contrato", "converter sentença", "processar DJE", "extrair número do processo". Integra com n8n para automação em lote.
---

# Lex Document OCR — Processamento de Documentos Jurídicos Brasileiros

## Arquitetura de Processamento

```
PDF/Imagem
    │
    ▼
┌─────────────────────────────────────┐
│  CAMADA 1: Pré-processamento        │
│  • Detecção de qualidade            │
│  • Deskew + denoising               │
│  • Identificação do tipo            │
└──────────────────┬──────────────────┘
                   │
                   ▼
┌─────────────────────────────────────┐
│  CAMADA 2: Extração de Texto        │
│  • OCR (Tesseract / AWS Textract /  │
│    Google Vision / Azure Form)      │
│  • Preservação de layout            │
│  • Reconhecimento de tabelas        │
└──────────────────┬──────────────────┘
                   │
                   ▼
┌─────────────────────────────────────┐
│  CAMADA 3: Estruturação Jurídica    │
│  • Identificação de tipo de doc     │
│  • Extração de entidades jurídicas  │
│  • Normalização do texto            │
└──────────────────┬──────────────────┘
                   │
                   ▼
┌─────────────────────────────────────┐
│  CAMADA 4: Output                   │
│  • JSON estruturado / Markdown      │
│  • Alimentação de sistemas          │
│  • Exportação para n8n / APIs       │
└─────────────────────────────────────┘
```

---

## Tipos de Documentos e Extratores Específicos

### 1. Certidões de Cartório

**Campos a extrair:**
```json
{
  "tipo_certidao": "Certidão de Casamento | Nascimento | Óbito | Ônus Reais",
  "numero_folha": "",
  "numero_livro": "",
  "data_lavratura": "",
  "cartorio": {
    "nome": "",
    "oficio": "",
    "comarca": "",
    "uf": ""
  },
  "partes": [
    {"papel": "titular | cônjuge", "nome": "", "cpf": "", "rg": ""}
  ],
  "data_registro": "",
  "observacoes": ""
}
```

### 2. Petições Iniciais

**Campos a extrair:**
```json
{
  "numero_processo": "",
  "vara": "",
  "comarca": "",
  "uf": "",
  "tipo_acao": "",
  "autor": {"nome": "", "cpf_cnpj": "", "advogado": "", "oab": ""},
  "reu": {"nome": "", "cpf_cnpj": ""},
  "valor_causa": 0.00,
  "pedidos": [],
  "tutela_urgencia": false,
  "data_distribuicao": ""
}
```

### 3. Decisões / Sentenças

**Campos a extrair:**
```json
{
  "numero_processo": "",
  "classe_cnj": "",
  "assunto_cnj": "",
  "juiz": "",
  "data_sentenca": "",
  "resultado": "PROCEDENTE | IMPROCEDENTE | PROCEDENTE EM PARTE | EXTINÇÃO",
  "valor_condenacao": 0.00,
  "honorarios": 0.00,
  "houve_tutela": false,
  "dispositivo": "",
  "prazo_recursal": "15 dias úteis"
}
```

### 4. Contratos (Bancários / Imobiliários / Prestação de Serviços)

**Campos a extrair:**
```json
{
  "tipo_contrato": "",
  "numero_contrato": "",
  "data_assinatura": "",
  "partes": [
    {"papel": "contratante | contratado | credor | devedor", "nome": "", "cpf_cnpj": ""}
  ],
  "objeto": "",
  "valor": 0.00,
  "prazo": "",
  "clausulas_relevantes": {
    "juros": "",
    "multa": "",
    "rescisao": "",
    "foro": "",
    "arbitragem": false
  }
}
```

### 5. Publicações no DJE / DOU

**Campos a extrair:**
```json
{
  "fonte": "DJE | DOU",
  "data_publicacao": "",
  "secao": "",
  "numero_edicao": "",
  "tipo_ato": "Portaria | Resolução | Despacho | Citação | Intimação",
  "processo_referenciado": "",
  "partes_citadas": [],
  "prazo": "",
  "texto_integra": ""
}
```

---

## Padrões de Reconhecimento — Regex Jurídicos Brasileiros

```python
# Número CNJ de processo
CNJ_PATTERN = r'\d{7}-\d{2}\.\d{4}\.\d\.\d{2}\.\d{4}'
# Exemplo: 0012345-67.2024.8.08.0012

# CPF
CPF_PATTERN = r'\d{3}\.\d{3}\.\d{3}-\d{2}'

# CNPJ
CNPJ_PATTERN = r'\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}'

# Data brasileira
DATE_BR_PATTERN = r'\d{2}/\d{2}/\d{4}'

# Valor monetário BRL
MONEY_BR_PATTERN = r'R\$\s*[\d\.,]+'

# OAB
OAB_PATTERN = r'OAB/?[A-Z]{2}\s*n?º?\s*[\d\.,]+'

# Número de livro/folha cartório
CARTORIO_PATTERN = r'[Ll]ivro\s*n?º?\s*[\d]+[,\s]+[Ff]olha\s*n?º?\s*[\d]+'
```

---

## Estratégias de Processamento por Qualidade do Documento

### Documento Digital (PDF gerado eletronicamente)
```
Estratégia: Extração direta de texto (pdfminer / PyMuPDF)
Confiança: 99%
Pipeline: PDF → text extraction → structured parsing
```

### Documento Escaneado (qualidade alta, >200 DPI)
```
Estratégia: Tesseract 5 com language pack por_BRL + LSTM
Confiança: 85-95%
Pipeline: PDF → img conversion → preprocessing → Tesseract → cleanup
```

### Documento Escaneado (qualidade baixa, manuscrito parcial)
```
Estratégia: Cloud OCR (AWS Textract ou Google Vision)
Confiança: 70-85%
Pipeline: PDF → enhance → Cloud OCR → post-processing → manual review flags
```

### Documento Manuscrito
```
Estratégia: Claude Vision API para interpretação contextual
Confiança: 60-80% (dependente da caligrafia)
Recomendação: Sempre revisar manualmente
```

---

## Integração com n8n — Workflow de Processamento em Lote

```json
{
  "name": "Lex OCR - Processamento em Lote",
  "description": "Pipeline de OCR jurídico com n8n",
  "nodes": [
    {
      "name": "Trigger Webhook",
      "type": "n8n-nodes-base.webhook",
      "description": "Recebe PDF via upload ou URL"
    },
    {
      "name": "Detectar Tipo de Documento",
      "type": "@n8n/n8n-nodes-langchain.agent",
      "description": "AI classifica o tipo de documento jurídico"
    },
    {
      "name": "Extrair Texto OCR",
      "type": "n8n-nodes-base.httpRequest",
      "description": "Envia para serviço OCR (Tesseract/Cloud)"
    },
    {
      "name": "Estruturar com Claude",
      "type": "@n8n/n8n-nodes-langchain.lmChatAnthropic",
      "description": "Claude extrai e normaliza os campos jurídicos"
    },
    {
      "name": "Salvar no Banco",
      "type": "n8n-nodes-base.postgres",
      "description": "Persiste JSON estruturado"
    }
  ]
}
```

---

## Normalização de Texto Jurídico Pós-OCR

**Problemas comuns e correções:**

| Problema OCR | Correção |
|-------------|----------|
| "lnstrumento" → "Instrumento" | l/I confusion |
| "0 réu" → "O réu" | 0/O confusion |
| "artlgo" → "artigo" | l/i confusion |
| Hifenização incorreta no final da linha | Remove e reconstrói palavra |
| Números com pontos/vírgulas trocados | Normaliza para padrão BRL |
| Datas "1O/O2/2O24" → "10/02/2024" | O/0 confusion em datas |

**Script de limpeza básico:**
```python
import re

def clean_legal_ocr(text: str) -> str:
    # Remove quebras de linha artificiais
    text = re.sub(r'(?<=[a-záéíóú])-\n(?=[a-záéíóú])', '', text, flags=re.IGNORECASE)
    
    # Normaliza espaços múltiplos
    text = re.sub(r' {2,}', ' ', text)
    
    # Corrige "O" por "0" em números
    text = re.sub(r'(?<=\d)O(?=\d)', '0', text)
    
    # Normaliza números CNJ
    text = re.sub(r'(\d{7})[–—-](\d{2})', r'\1-\2', text)
    
    return text.strip()
```

---

## Extração via Claude Vision

Quando receber um PDF ou imagem de documento jurídico, usar este prompt:

```
Você é um especialista em documentos jurídicos brasileiros. 
Analise o documento e extraia as informações no formato JSON especificado.

Tipo de documento detectado: [tipo]
Campos a extrair: [lista de campos do schema]

Regras:
1. Preservar a escrita original dos nomes
2. Datas no formato YYYY-MM-DD
3. Valores monetários como números float (sem R$)
4. Se um campo não existir no documento, usar null
5. Para texto extenso (dispositivo, cláusulas), resumir em até 200 caracteres

Documento:
[conteúdo do documento]
```

---

## Checklist de Qualidade da Extração

- [ ] Número CNJ identificado e validado (formato correto)
- [ ] Nomes das partes sem abreviações incorretas
- [ ] Datas no formato padrão
- [ ] Valores monetários sem erros de OCR
- [ ] Campos obrigatórios todos preenchidos (ou null)
- [ ] Texto de dispositivo/cláusulas preservado fielmente
- [ ] Confidence score do OCR documentado
- [ ] Flag de revisão manual quando confiança < 80%
