#Autor: Fagner Geraldes Braga  
#Data de criação: 02/04/2023  
#Data de atualização: 04/04/2023  
#Versão: 0.03
***
## Administração Linux
```bash
# Exibe o diretório corrente
pwd  

# Nome do computador
hostname  

# whoami = id -un
id -un  

# Imprime IDs de usuário e grupo 
id  

# Mostra quem está logado
who 

# Usuário logado 
whoami 

# Vai para diretório raiz
cd /  

# Lista diretório
ls -lha --color=auto  
# -l - longo 
# -h - humano
# -a - oculto
# --color=auto - insere cor

# Cria diretório
mkdir dir1 dir2 dir3  
mkdir "arquivos de programas"  

# Cria diretório oculto  
mkdir .dir4  
  
# Vai para o diretório corrente
cd .  

# Apaga arquivos
rm -r dir1  
rm -r dir2 dir3 .dir4  
rm -r "arquivos de programas"/  
# -r recursivo (apaga os arquivos e o diretório)

# Altera o timestamp e cria arquivo  
touch arquivo01.txt  
```
## Variáveis de Ambiente
```bash
# Mostra as variáveis da ambiente da sessão atual
env

# Exporta uma variável para outra seção
export VAR1=teste

# Exibe o conteúdo de uma variável
echo $USER
echo $USER $PWD
echo $PATH

# Cria uma variável
PATH=/bin

# Adiciona conteúdo a uma variável existente
PATH=$PATH:/opt/bin

# Instala o VIM
apt install vim -y

# Arquivo com as variáveis globais
vim /etc/profile

# Força o carregamento do arquivo
source /etc/profile

# Remove uma variável
unset VAR1

# Criação de variável para usuário específico
vim .profile
```
## VIM
```bash
# Modo de Comando
3Y  # copia 3 linhas
3yy # copia 3 linhas
y # copiar
p # colar
x # remover caracter
h # cursor para esquerda
j # cursor para baixo
k # cursor para cima
l # cursor para direita
u # desfazer
ctrl + r # refazer
dd # recortar

# Localizar
/ # localizar de cima para baixo
? # localizar de baixo para cima
: set ignorecase
: set number
: set hlsearch #(mostra todos os resultados do conteúdo pesquisado)
n # next

:w # salvar
:! date # executa comando fora do vim
:r! date # executa comando dentro do vim
:q! # força a saída
:x! # salva e sai
:wq! # salva e sai

# Modo de Inserção
i # na mesma linha
o # linha de baixo
esc # volta para o modo de comando

# Modo Visual
v # modo visual
```

## Compactadores
```bash
# Empacota arquivos e diretórios usando o Tar
tar -cvf arquivos.tar /etc/passwd /var/log/messages /opt
# -c cria
# -v verbose
# -f arquivo

# Informa o tipo do arquivo
file arquivos.tar

# Compacta arquivo usando o gzip
gzip arquivos.tar

# Descompacta arquivo usando o gzip
gunzip arquivos.tar.gz

# Compacta arquivo usando o Bzip2
bzip2 arquivos.tar

# Descompacta arquivo usando o Bzip2
bunzip2 arquivos.tar.bz2

# Desempacota arquivos e diretórios usando o Tar
tar -xvf arquivos.tar -C /opt/
# -x extrai
# -v verbose
# -f arquivo
# -C para extrair conteúdo em outro diretório

# Empacota e compacta o arquivo usando o gzip
tar -czvf novoarquivo.tar.gz /etc
# -z gzip
# -J XZ
# -j bzip2

# Desempacota e descompacta o arquivo usando o gzip
tar -xzvf novoarquivo.tar.gz -C /var/tmp
# -z gzip
# -J XZ
# -j bzip2

# Verificar espaço em disco
df -vhT

# Verificar quantidade de inodes
df -viT
```

## Gerenciamento de Processos
```bash

# Processos da sessão atual
ps -aux | grep firefox
# -aux traz mais informações

# Abre aquivo no vim e joga pro segundo plano
vim teste &
# & joga pra segundo plano
# % joga para primeiro plano

# Mostra os processos parados
jobs

# Mostra o processo do VIM
ps -aux | grep vim

# Mostra o PID do VIM
pidof vim

# Envia um sinal para o processo
kill -l
# -l lista os nomes dos sinais
# 9 Mata o processo
# 15 Termina o processo (Default)
# 18 Continua o processo
# 19 para o processo

# Mata o processo com o PID 1660
kill -9 1660

# Mata todos os processos do programa informado
killall -9 vim

# Mostra processos Linux
top
```

## Gerenciamento de Pacotes
### Debian
```bash
apt update

apt upgrade





```