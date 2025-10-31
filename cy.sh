mkdir Projeto/
cd Projeto/
git init
touch .gitignore
echo ".DS_Store
node_modules/
cypress/downloads/
cypress/screenshots/
cypress/videos/" > .gitignore
npm init -y
npm i cypress -D
touch cypress.env.json
echo "{}" > cypress.env.json
npx cypress open
cd Projeto/
code .
