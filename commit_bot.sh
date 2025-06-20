#!/bin/bash
set -e

# Configuração do Git
git config user.name "Luizfelipereal007"
git config user.email "lmarianobonfim@gmail.com"

# Texto que será desenhado no Contribution Graph - ALTERE AQUI
texto="feliz-2024"

# Mapas completos de letras e números 7x5 (7 linhas = dias da semana, 5 colunas = largura)
declare -A letras=(
  # Letras A-Z
  ["a"]="01110 10001 10001 11111 10001 10001 10001"
  ["b"]="11110 10001 10001 11110 10001 10001 11110"
  ["c"]="01111 10000 10000 10000 10000 10000 01111"
  ["d"]="11110 10001 10001 10001 10001 10001 11110"
  ["e"]="11111 10000 10000 11110 10000 10000 11111"
  ["f"]="11111 10000 10000 11110 10000 10000 10000"
  ["g"]="01111 10000 10000 10111 10001 10001 01111"
  ["h"]="10001 10001 10001 11111 10001 10001 10001"
  ["i"]="11111 00100 00100 00100 00100 00100 11111"
  ["j"]="00111 00010 00010 00010 00010 10010 01100"
  ["k"]="10001 10010 10100 11000 10100 10010 10001"
  ["l"]="10000 10000 10000 10000 10000 10000 11111"
  ["m"]="10001 11011 10101 10001 10001 10001 10001"
  ["n"]="10001 11001 10101 10011 10001 10001 10001"
  ["o"]="01110 10001 10001 10001 10001 10001 01110"
  ["p"]="11110 10001 10001 11110 10000 10000 10000"
  ["q"]="01110 10001 10001 10001 10101 10010 01101"
  ["r"]="11110 10001 10001 11110 10100 10010 10001"
  ["s"]="01111 10000 10000 01110 00001 00001 11110"
  ["t"]="11111 00100 00100 00100 00100 00100 00100"
  ["u"]="10001 10001 10001 10001 10001 10001 01110"
  ["v"]="10001 10001 10001 10001 10001 01010 00100"
  ["w"]="10001 10001 10001 10001 10101 11011 10001"
  ["x"]="10001 10001 01010 00100 01010 10001 10001"
  ["y"]="10001 10001 01010 00100 00100 00100 00100"
  ["z"]="11111 00001 00010 00100 01000 10000 11111"
  
  # Números 0-9
  ["0"]="01110 10001 10011 10101 11001 10001 01110"
  ["1"]="00100 01100 00100 00100 00100 00100 01110"
  ["2"]="01110 10001 00001 00110 01000 10000 11111"
  ["3"]="11111 00010 00100 00010 00001 10001 01110"
  ["4"]="00010 00110 01010 10010 11111 00010 00010"
  ["5"]="11111 10000 11110 00001 00001 10001 01110"
  ["6"]="00110 01000 10000 11110 10001 10001 01110"
  ["7"]="11111 00001 00010 00100 01000 01000 01000"
  ["8"]="01110 10001 10001 01110 10001 10001 01110"
  ["9"]="01110 10001 10001 01111 00001 00010 01100"
  
  # Símbolos especiais
  ["-"]="00000 00000 00000 11111 00000 00000 00000"
  ["_"]="00000 00000 00000 00000 00000 00000 11111"
  ["."]="00000 00000 00000 00000 00000 00100 00000"
  ["!"]="00100 00100 00100 00100 00100 00000 00100"
  ["?"]="01110 10001 00010 00100 00100 00000 00100"
  ["+"]="00000 00100 00100 11111 00100 00100 00000"
  ["="]="00000 00000 11111 00000 11111 00000 00000"
  ["@"]="01110 10001 10101 10111 10000 10000 01111"
  ["#"]="01010 01010 11111 01010 11111 01010 01010"
  ["&"]="01100 10010 01000 01010 10001 10010 01101"
  ["%"]="11000 11001 00010 00100 01000 10011 00011"
  ["*"]="00000 10101 01110 11111 01110 10101 00000"
  ["/"]="00001 00010 00100 01000 10000 00000 00000"
  ["\\"]="10000 01000 00100 00010 00001 00000 00000"
  ["|"]="00100 00100 00100 00100 00100 00100 00100"
  ["("]="00010 00100 01000 01000 01000 00100 00010"
  [")"]="01000 00100 00010 00010 00010 00100 01000"
  ["["]="01110 01000 01000 01000 01000 01000 01110"
  ["]"]="01110 00010 00010 00010 00010 00010 01110"
  ["{"]="00110 01000 01000 11000 01000 01000 00110"
  ["}"]="01100 00010 00010 00011 00010 00010 01100"
  ["<"]="00010 00100 01000 10000 01000 00100 00010"
  [">"]="01000 00100 00010 00001 00010 00100 01000"
  [":"]="00000 00100 00000 00000 00000 00100 00000"
  [";"]="00000 00100 00000 00000 00100 00100 01000"
  [","]="00000 00000 00000 00000 00000 00100 01000"
  ["'"]="00100 00100 01000 00000 00000 00000 00000"
  ["\""]="01010 01010 10100 00000 00000 00000 00000"
)

# Data de início - ALTERE AQUI (formato: YYYY-MM-DD, deve ser um domingo)
start_date="2024-01-07"

# Função para calcular data
get_date() {
  local week=$1
  local day=$2
  local days_to_add=$((week * 7 + day))
  
  if command -v gdate >/dev/null 2>&1; then
    gdate -d "$start_date +$days_to_add days" "+%Y-%m-%d"
  else
    date -d "$start_date +$days_to_add days" "+%Y-%m-%d"
  fi
}

current_week=0

echo "=========================================="
echo "🎨 GitHub Contribution Graph Art Generator"
echo "=========================================="
echo "Texto: '$texto'"
echo "Data inicial: $start_date"
echo "Total de caracteres: ${#texto}"
echo "=========================================="

for ((i=0; i<${#texto}; i++)); do
  char="${texto:$i:1}"
  
  # Converter para minúscula para busca no array
  char_lower=$(echo "$char" | tr '[:upper:]' '[:lower:]')
  
  echo "[$((i+1))/${#texto}] Processando: '$char' (semana $current_week)"
  
  if [[ "$char" == " " ]]; then
    ((current_week += 2))  # Espaço entre palavras
    echo "  → Espaço adicionado"
    continue
  fi
  
  pattern="${letras[$char_lower]}"
  if [ -z "$pattern" ]; then
    echo "  ⚠️  Caractere '$char' não encontrado no mapa!"
    ((current_week += 6))
    continue
  fi
  
  # Converter pattern em array de linhas
  IFS=' ' read -ra lines <<< "$pattern"
  
  commits_count=0
  
  # Para cada coluna da letra (largura = 5)
  for col in {0..4}; do
    # Para cada linha da letra (altura = 7)
    for row in {0..6}; do
      if [ $row -lt ${#lines[@]} ]; then
        line="${lines[$row]}"
        if [ $col -lt ${#line} ]; then
          pixel="${line:$col:1}"
          if [ "$pixel" == "1" ]; then
            commit_date=$(get_date $((current_week + col)) $row)
            
            GIT_AUTHOR_DATE="$commit_date 12:00:00" \
            GIT_COMMITTER_DATE="$commit_date 12:00:00" \
            git commit --allow-empty -m "Draw '$char' at $commit_date"
            
            ((commits_count++))
          fi
        fi
      fi
    done
  done
  
  echo "  ✅ $commits_count commits criados"
  current_week=$((current_week + 6))  # Espaço entre letras
done

echo "=========================================="
echo "📤 Enviando commits para o GitHub..."
git push origin main

echo "=========================================="
echo "🎉 Concluído com sucesso!"
echo "🔗 Verifique seu perfil GitHub em alguns minutos"
echo "📅 Período usado: $start_date até $(get_date $current_week 6)"
echo "=========================================="
