#Autor: Fagner Geraldes Braga  
#Data de criação: 07/04/2023    
#Data de atualização: 07/04/2023  
#Versão: 0.01
***
## Git
```bash

# Instala o Git
apt install git -y

# Verifica a versão do Git
git --version


cd /var
mkdir repositorio1 repositorio2
cd repositorio1

# Inicializa um repositório
git init

# Mostra o status da árvore de trabalho
git status

# Cria identificação para o repositório local com o nome e e-mail do usuário

git config --local user.email "fagner.fgb@gmail.com"
git config --local user.name "Fagner Braga"

# Fazer com que os arquivos passem a ser gerenciados pelo Git
cp /etc/passwd .
git status
git add passwd # adiciona o arquivo
git add . # adiciona todos
git add diretorio # adiciona o diretório

# Fazer com que os arquivos passem a não ser gerenciados pelo Git
git rm -- cached passwd

# Faz o commit dos arquivos adicionados
git commit -m "Primeiro commit passwd"

# Mostra os logs das ações realizadas no repositório do Git
git log
git log --oneline

# Clona repositório local
cd /var
mkdir clonerepolocal clonereporemoto
cd clonerepolocal
git clone /var/repositorio1/ novorepo

# Clona repositório remoto
cd /var/clonereporemoto
git clone https://github.com/fagnerfgb/infralabs

cd /var/repositorio1
cp /etc/hosts /var/repositorio1
cp /etc/shadow /var/repositorio1
git status
git add .
git commit -m "Arquivos hosts e shadow adicionados"

# Mostra se existe diferença nos arquivos
git diff

# Site para consulta
https://devhints.io/git-log

git log -p

# Desfaz mudança que foi feita
git checkout -- arquivo
```