#Autor: Fagner Geraldes Braga  
#Data de criação: 02/01/2022  
#Data de atualização: 04/01/2022  
#Versão: 0.03
***
## Git
```bash

# Instala o Git
apt install git -y

# Verifica a versão do Git
git --version

# Inicializa um repositório
git init

# Mostra o status da árvore de trabalho
git status

# Cria identificação para o repositório local com o nome e e-mail do usuário
git config --local user.name "Fagner Braga"
git config --local user.mail "fagner.fgb@gmail.com"

# Fazer com que os arquivos passem a ser gerenciados pelo Git
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
git clone /var/repositorio1

# Clona repositório remoto
git clone https://github.com/fagnerfgb/infralabs

# Mostra se existe diferença nos arquivos
git diff

# Site para consulta
https://devhints.io/git-log

git log -p

# Desfaz mudança que foi feita
git checkout -- arquivo
```