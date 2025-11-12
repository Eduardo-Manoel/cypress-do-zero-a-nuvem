#!/bin/bash

# Define o conteúdo desejado para o .gitignore
GITIGNORE_CONTENT="
.DS_Store
node_modules/
cypress/downloads/
cypress/screenshots/
cypress/videos/
"

echo "Verificando e atualizando o arquivo .gitignore..."

# Cria ou sobrescreve o arquivo .gitignore
cat <<EOF > .gitignore
${GITIGNORE_CONTENT}
EOF

echo "✅ Arquivo .gitignore atualizado com sucesso no diretório raiz do projeto."

echo ""
echo "Verificando arquivos rastreados que deveriam ser ignorados..."

# Verifica e remove arquivos do cache do Git
FILES_TO_REMOVE=$(git ls-files -i --exclude-standard)

if [ -n "$FILES_TO_REMOVE" ]; then
    echo "⚠️ Os seguintes arquivos estavam sendo rastreados e foram removidos do índice do Git (cache):"
    echo "$FILES_TO_REMOVE"
    
    echo "$FILES_TO_REMOVE" | xargs git rm --cached
    
    echo "✅ Executado: 'git rm --cached' nos arquivos acima. Faça um novo 'commit' para finalizar a limpeza."
else
    echo "👍 Nenhum arquivo rastreado que deveria ser ignorado foi encontrado. Não é necessária a limpeza do cache."
fi

# Fim do script