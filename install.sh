#!/bin/bash
# install.sh — Instalador das Lex Intelligentia Skills
# Uso: bash install.sh [--all | --core | --magistrado | --pesquisador | --automacao | --criacao]

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_SKILLS_DIR="${HOME}/.claude/skills"
TARGET_DIR="${CLAUDE_SKILLS_DIR}/lex-intelligentia"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  ⚖️  Lex Intelligentia Skills — Instalador     ${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

MODE="${1:---all}"

install_category() {
  local category="$1"
  local source="${REPO_DIR}/skills/${category}"
  local dest="${TARGET_DIR}/${category}"

  if [ -d "$source" ]; then
    mkdir -p "$dest"
    for skill in "$source"/*/; do
      skill_name=$(basename "$skill")
      cp -r "$skill" "${dest}/${skill_name}"
      echo -e "  ${GREEN}✓${NC} ${skill_name}"
    done
    echo -e "  ${YELLOW}→ Categoria '${category}' instalada${NC}"
  else
    echo -e "  Categoria '${category}' não encontrada em ${source}"
  fi
}

mkdir -p "${TARGET_DIR}"

case "$MODE" in
  --all)
    echo "Instalando todas as skills..."
    echo ""
    for cat in core magistrado pesquisador automacao criacao; do
      echo "📁 ${cat}/"
      install_category "$cat"
      echo ""
    done
    ;;
  --core | --magistrado | --pesquisador | --automacao | --criacao)
    cat="${MODE#--}"
    echo "Instalando skills da categoria: ${cat}"
    echo ""
    install_category "$cat"
    echo ""
    ;;
  *)
    echo "Uso: bash install.sh [--all | --core | --magistrado | --pesquisador | --automacao | --criacao]"
    exit 1
    ;;
esac

TOTAL=$(find "${TARGET_DIR}" -name "SKILL.md" | wc -l | tr -d ' ')

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✅ Instalação concluída!${NC}"
echo -e "   ${TOTAL} skills instaladas em: ${TARGET_DIR}"
echo ""
echo -e "   O Claude carregará as skills automaticamente"
echo -e "   na próxima sessão do Claude Code."
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
