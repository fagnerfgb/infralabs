#Autor: Fagner Geraldes Braga  
#Data de criação: 07/04/2023    
#Data de atualização: 08/04/2023  
#Versão: 0.02
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

# Ignorar arquivo de ser adicionado ao commit
touch .gitignore
git add .
git commit -m "Adicionando gitignore"
touch faq1.txt faq2.txt
vim .gitignore
	faq1.txt
	faq2.txt
git add . && git commit -m "Arquivos faq1.txt e faq2.txt ignorados" 

# Repositorio bare (puro)
cd ..
mkdir repositoriobare
cd repositoriobare
git init --bare

# Apontando repositório local para repositório remoto 
cd /var/repositorio1
git remote add local /var/repositoriobare
git remote -v

# Sincronizando repositório local para repositório remoto
git branch
git push local master
# local - nome do repositório remoto
# master - nome da branch do repositório local a ser enviado para o repositório remoto

# Inicializando repositório e Apontando repositório local para repositório remoto 
cd /var/repositorio2
git init
git config --local user.name "Natalia Almeida"
git config --local user.email "natalia.almeida@asf.com"
git remote add local /var/repositoriobare
git pull local master

# Criando repositório no Github
Nome: devops

# Criando diretório e inicializando repositório
cd /var
mkdir repositorio3
cd repositorio3
git init

# Gerando chaves SSH
ssh-keygen
Enter a file in which to save the key (/c/Users/YOU/.ssh/id_ALGORITHM):[Press enter]
Enter passphrase (empty for no passphrase): [Type a passphrase]
Enter same passphrase again: [Type passphrase again]

cat /root/.ssh/id_rsa.pub
Copiar a saída do comando acima

## Adicionando chave SSH ao Github
Acessar o site do Github com as suas credenciais
Clicar na sua foto de perfil no canto superior direito da tela e clicar na opção Your Repositories
Selecionar o repositório devops
Clicar na opção Settings
No canto esquerdo da tela clicar em Deploy keys
Clicar em Add deploy key
Title: ssh-fagner
Key: Colar o resultado do comando cat /root/.ssh/id_rsa.pub digitado no terminal
Marcar Allow write access
Add key

## Adicionando repositórios remotos ao repositório local e realizando testes
git remote add origin git@github.com:fagnerfgb/devops.git
git pull origin master
git remote add local /var/repositoriobare
git pull local master
cp /etc/hostname .
git add .
git commit -m "Arquivo hostname adicionado"
git push origin master
git push local master

# Criando uma nova branch
git branch config1
git branch

# Indo para outra branch
git checkout config1
git branch

# Alterando arquivo, adicionado, fazendo commit e conferindo se o log aparece na branch master
git config --local user.name "Ricardo Geraldes"
git config --local user.email "ricardo.geraldes@asf.com"
echo "10.0.3.15 debian9" >> hosts
git diff
git add .
git commit -m "Primeiro commit na branch config1"
git log --oneline
git checkout master
git log --oneline

git blame hosts

# Criando nova branch
cd /var/repositorio2
git config -l
git pull local master
git branch
git checkout -b config2
git pull local master
echo "10.0.3.20 interno" >> hosts
git add .
git commit -m "Primeiro commit na branch config2"

# Juntando as branches
cd /var/repositorio3
git branch
git checkout master
git merge config1
git log

# Juntando as branches
cd /var/repositorio2
git branch
git checkout master
git merge config2
git log

# Enviando atualizações do repositório 2 pro repositório remoto
git push local master

# Enviando atualizações do repositório 3 pro repositório remoto
# Conflito de merge
cd /var/repositorio3
git push local master
git pull local master
vim hosts
git add .
git commit -m "Correção de conflitos após Merge"
git push local master


# Alterando arquivos e desfazendo a alteração antes de fazer o add
vim hosts
remover linha 
10.0.3.20 interno
git status
git checkout -- hosts
cat hosts

# Alterando arquivos e desfazendo a alteração depois de fazer o add
vim hosts
adicionar linha 
10.0.3.21 interno2
git status
git add .
git reset HEAD hosts
git status
git checkout -- hosts

# Alterando arquivos, fazendo o add, fazendo o commit e desfazendo o commit
vim hosts
adicionar linha 
10.0.3.21 interno2
git status
git add .
git commit -m "Teste para reverter commit anterior"
git status
git log --oneline
git revert c8ba306

# Stash
vim hosts
10.0.3.30 datacenter
git stash
git status
cat hosts
git stash list
git stash apply 0
cat hosts
git add .
git commit -m "Commit pós stash"
git stash list
git stash drop 0

# git diff
git log --oneline
git diff 9d2c7b5..012bdb9
git push local master

# Criando nova versão
git tag
git tag -a v0.1.0 -m "Lançando primeira versão"
git tag
git push local v0.1.0
git push origin v0.1.0

https://git-school.github.io/visualizing-git/
```