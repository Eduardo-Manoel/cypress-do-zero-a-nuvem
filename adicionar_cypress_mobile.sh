#!/bin/bash

PACKAGE_FILE="package.json"

# Verifica se o jq está instalado
if ! command -v jq &> /dev/null
then
    echo "Erro: 'jq' não foi encontrado."
    echo "Por favor, instale-o (ex: sudo apt-get install jq)."
    exit 1
fi

# Define o objeto JSON com os dois scripts que você quer adicionar/atualizar
NEW_SCRIPTS='{
    "cy:open:mobile": "cypress open --config viewportWidth=370 viewportHeight=660",
    "test:mobile": "cypress run --config viewportWidth=370 viewportHeight=660"
}'

# 1. Adiciona o objeto NEW_SCRIPTS à seção 'scripts' do package.json
# 2. Salva a saída modificada em um arquivo temporário.
# 3. Move o arquivo temporário para substituir o original se o jq for bem-sucedido.
jq ".scripts += $NEW_SCRIPTS" "$PACKAGE_FILE" > temp.json

if [ $? -eq 0 ]; then
    mv temp.json "$PACKAGE_FILE"
    echo "✅ Scripts 'cy:open:mobile' e 'test:mobile' adicionados/atualizados com sucesso no $PACKAGE_FILE."
else
    rm -f temp.json # Limpa o arquivo temporário em caso de falha
    echo "❌ Erro ao modificar o $PACKAGE_FILE. Verifique se ele é um JSON válido."
fi