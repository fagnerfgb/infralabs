#Autor: Fagner Geraldes Braga  
#Data de criação: 12/12/2021  
#Data de atualização: 18/12/2021  
#Versão: 0.02
***
Dia 2 - 05/12/2021
***
```bash
cp /etc/passwd /tmp/
cd /tmp
cat passwd
egrep --color '^[a-c]' /tmp/passwd 
# busca resultados que comecem com a,b,c

egrep --color 'daemon|var' /tmp/passwd 
# busca resultados no arquivo indicado que contenham a palavra daemon ou var

egrep --color 'nologin$' /tmp/passwd 
# busca resultados no arquivo indicado que terminem com nologin

egrep --color -n '^....:' /tmp/passwd
# busca resultados no arquivo indicado que contenham qualquer caracter nas primeiras quatro posições e ":" na quinta posição

# ^ = início
# $ = fim
# | = ou
# . = qualquer caracter
# (..) .....-....
```
```bash
cp /etc/shadow   /tmp/
head /tmp/shadow
fgrep --color $ /tmp/shadow 
# fgrep é usado em buscas onde se precisa desconsiderar os metacaracteres
```
```bash
apt install locate # instala o locate
updatedb # atualiza a base de dados
locate nsswitch # localiza arquivos que contenham a palavra chave
locate passwd
locate -c passwd # mostra a quantidade de resultados encontrados na busca
locate -i passwd # não faz distinção entre maiúsculas e minúsculas na busca
```
Caracteres curingas
| Caracter  | Descrição                                             |
| --        | --                                                    |
| ?         | Este curinga substitui um caractere qualquer          |
| *         | Este curinga substitui todos caracteres               |
| !         | Este curinga atua como negação de ação                |            
| [ ]       | Este curinga exibe uma lista ou intervalo de objetos  |
| { }       | Este curinga cria uma lista ou intervalo de objetos   |

```bash
cd /etc
ls -ld su*
d   # lista diretório
su* # começa com su e depois por ter qualquer coisa

ls -ld /etc/*.conf # tem que terminar com .conf
ls -ld /etc/a*.conf # começa com a e termina com .conf
ls -ld /etc/[abcd]*.conf # começa ou com a ou b ou c ou d e termina com .conf
ls -ld /etc/*.??? # termina com três caracteres quaisquer depois do .
ls -ld /etc/*.{???,????} # termina com três ou quatro caracteres quaisquer depois do .
 ls -ld /etc/*.{gen,defs} # termina com gen ou defs depois do .
ls -ld /etc/[a-dA-D]*.conf # começa com qualquer caracter de a até d [maiúsculo ou minúsculo] 

dd # converte e copia um arquivo
dd if=/etc/hosts of=/opt/hosts status=progress
if # origem
of # destino

dd if=/dev/sda  of=/dev/sdb
# clona o disco sda para o disco sdb

dd if=/dev/sda  of=/tmp/mbr.img bs=512 count=1
# clona a mbr do disco sda
# bs= block size (tamanho da mbr)
# count = quantidade de blocos

dd if=/tmp/mbr.img    of=/dev/sda
restaura a imagem da mbr para o disco sda

/dev/null # joga o arquivo para o limbo
/dev/zero # preenche o arquivo com zeros

dd if=/dev/zero  of=/var/swap01 bs=100M count=1 status=progress
# copiado um arquivo de 100M cheio de zeros

lsblk # lista dispositivos de bloco
mkswap /var/swap01 # cria arquivo de swap
swapon # ativa a swap
swapoff # desativa a swap
free -m # verificando o tamanho da swap
swapon -s # mostra o uso da swap por dispositivo

dd if=/dev/zero  of=/tmp/arquivo.img count=1 bs=100M
split -b 20M -d  /tmp/arquivo.img  /opt/novoarq- --verbose
# split = dividir arquivo em partes menores (preserva o arquivo original)
# -d = final numérico
# -b = bytes
# --verbose = mostra os detalhes

cat /opt/novoarq-0* > /tmp/joinarq.img
# junta as partes do arquivos 

diff /tmp/arquivo.img /tmp/joinarq.img -s
# compara se os arquivos são idênticos

cat > nomes.txt
cat nomes.txt

sort nomes.txt
# imprime na tela o arquivo organizado em ordem alfabética

sort -r nomes.txt
# -r = reverso

cat > nomes2.txt
uniq # reporta ou omite linhas repetidas

uniq nomes2.txt # omite nomes repetidos que estão organizados de forma sequencial

sort nomes2.txt  |uniq # organiza em ordem alfabética e depois omite os repetidos

sort nomes2.txt  |uniq -d
# -d = imprime só os repetidos

sort nomes2.txt  |uniq -D
# -D = mostra todas as linhas duplicadas

sort nomes2.txt  |uniq -c
# -c = faz a contagem das duplicações

cat > lista1.txt
cat > lista2.txt

cat lista1.txt lista2.txt
# junta os arquivos um depois do outro

paste lista1.txt lista2.txt
# junta os arquivos um ao lado do outro

join lista1.txt lista2.txt
# junta os arquivos um ao lado do outro verificando o índice dos arquivos

cut # remover seções de cada linha dos arquivos
head /tmp/passwd
head -n 10 /tmp/passwd |cut -d ":" -f 1
# -d = delimitador
# -f = field (campo)

head -n 10 /tmp/passwd |cut -d ":" -f 1,7

head -n 10 /tmp/passwd |cut -d ":" -f 1,7 --output-delimiter="@@@"
# --output-delimiter = insere delimitador entre campos na tela

# awk = padrão de varredura e linguagem de processamento de texto
head -n 10 /tmp/passwd |awk -F ":" '{ print "Login: "$1,"\nShell: "$7 }'
# -F = delimitador
# $1 = campo
# \n = nova linha

head -n 10 /tmp/passwd |awk -F ":" '{ print NR,"Login: "$1,"\nShell: "$7 }'
# NR = número da linha

cat /tmp/passwd
uid < 1000 # usuários de sistema
cat /tmp/passwd |awk -F ":" '$3 >= 1000 {print $0}'
# $0 = linha inteira

cat /tmp/passwd |awk -F ":" '$3 >= 1000 {print $1,$3}'

ls /etc/ |awk /conf/
/ / # localização de string
ls /etc/ |awk /conf$/
/conf$/ # localiza arquivos que tem conf no final

cat /tmp/shadow  |awk -F ":" 'length($2) > 2 {print $0}'
```

# Cut

| Comando           | Descrição                                     |
| --                | --                                            |
|-b                 | Exibe conteúdo em relação a bytes             |
|-c                 | Exibe conteúdo em relação a caracteres        |
|-f                 | Exibe colunas (campos) especificos            |
|-d                 | Define o delimitador de colunas para o cut    |
|-s                 | Ignora linhas sem o delimitador especificado  |
|--output-delimiter | Define delimitador para exibição              |

```bash
cat /tmp/passwd | cut -d ":" -f1,3
cat /tmp/passwd | cut -d ":" -f1,3 --output-delimiter=".::."
cat /tmp/passwd | cut -c 1-10
cat /tmp/passwd | cut -b 1-20
cat /etc/ssh/sshd_config | cut -d "#" -f1,2
```
# AWK
| Comando           | Descrição                                 |
| --                | --                                        | 
|-F                 | Delimitador de colunas                    |
|print              | Exibe campo(s) especifico(s) na saída     |
|$N                 | Onde N é o número da coluna a ser exibida |
|FS                 | Separador de campos                       |
|NR                 | Número de linhas                          |
|NF                 | Números de campos em linha                |
|,                  | Insere um espaço entre as colunas         |

```bash
cat /tmp/passwd | awk -F: '{print $1,$3}'
cat /tmp/passwd | awk -F: '$3 >= 1000 {print $1}'
awk -F: '$3 >= 500{print NR,$1}' /tmp/passwd
ls /etc | awk /conf$/
cat /tmp/passwd | awk -F: '$3 >=1000 {print $1FS$3}'
awk -F: '$3 >= 1000{print NR,$1FS$3}' /tmp/passwd
awk -F: 'length($2) > 2{print $0}' /tmp/shadow
awk 'END {print NR}' /etc/group
cat /tmp/passwd | awk 'NR % 2 ==0 {print NR,$0}'
cat /tmp/passwd | awk 'NR % 2 !=0 {print NR,$0}'
ls -l /etc/ | awk 'NR !=1 {print "Name:",$9,"Perm:",$1,"Length:",$5}'
nl /etc/services
```

find = localizar arquivos  
-iname = faz distinção de maiúsculas e minúsculas  
-name = não faz distinção de maiúsculas e minúsculas  
-user =  pesquisa arquivos de um determinado usuário  
-uid = pesquisa pelo uid do usuário  
-size  = pesquisa por tamanho do arquivo  
-exec comando {}  \;  
-maxdepth = nível máximo de profundidade  

```bash
find / -name passwd*
find / -user analista 2> /dev/null
find / -iname imagens -user analista  2> /dev/null
find / -iname imagens -uid 1000 2> /dev/null
find / -size +10M  -size -50M 2> /dev/null
find / -iname *.deb -size +10M  -size -50M 2> /dev/null
find / -size +10M -size -50M -exec ls -lh {} \; 2> /dev/null
find / -size +10M -size -50M -exec du -h {} \; 2> /dev/null
```

-type = procura por tipo
| Comando           | Descrição                                 |
| --                | --                                        |
|b | Arquivos de dispositivos de bloco                          |
|c | Arquivos de dispositivos de entrada de caracteres          |
|d | Diretórios                                                 |
|f | Arquivos regulares, comuns                                 |
|l | Links simbólicos                                           |
|p | Pipes, Named Pipes (FIFO)                                  |
|s | Arquivos de sockets                                        |

```bash
find /etc -type l
find /etc/ -type d
find /etc/ -type f -maxdepth 2
```

-amin = acessado a x minutos  
-cmin = alterado a x minutos (permissão)  
-mmin = modificado a x minutos (conteúdo)  
-atime = acessado a x dias  
-ctime = alterado a x dias (permissão)  
-mtime = modificado a x dias (conteúdo)  

```bash
find /tmp -amin -30
find /tmp -amin -30 -exec stat {} \;
find / -user analista -mmin -10 2> /dev/null
find /home/ -user analista -mtime -1 -exec stat {} \; 2> /dev/null
```
```bash
find / -size +50M 2> /dev/null  | xargs du -h
# xargs = pega o argumento de cada linha do resultado e executa o comando passado
```
# SED
```bash
cp /etc/fstab /var/backups/
cat /etc/fstab

#sed = editor para transformar e filtrar texto
# -e = altera apenas na tela
# -i = altera no arquivo

sed -e '/^#/d' /etc/fstab
# '/^#/d' = pesquisa linhas que começam com #
# d = deleta a linha toda

sed -i '/^#/d' /etc/fstab

# blkid - localiza/imprime atributos de dispositivos de bloco
blkid |awk -F " " '{ print $2}' |sed -e s'|"||g'
# s = substitui
# '/"//g' substitui " por nada
# g = global (tudo)
```
# VIM - Vi IMproved, a programmer's text editor
```bash
# Colocar o vim como editor padrão
update-alternatives --config editor
2

# Modo linha de comando
:w # salvar
:q # sair
:wq # salvar e sair
:q! # força a saída
:w /tmp/doc02.txt # salvar como
:qa # sai de todos os arquivos
:x #salvar e sair
ZZ # salvar e sair

# Modo de inserção
insert
i
i
o
O
a
A

# Modo de comando
h # esquerda
j # baixo
k # cima
l # direita
v # visual
y # copiar
p # colar
V # Visual/linha
3Y # copia 3 linhas
3yy # copia 3 linhas
5dd # recorta 5 linhas
dd # recorta uma linha
d5d # recorta 5 linhas
x # apaga caracter
X # apaga (backspace)
ctrl + z # não usar
u # desfazer
ctrl + r # refazer
/ # buscar de cima pra baixo
? # buscar de baixo pra cima
/linux
n # busca a próxima ocorrência
:%s/linux/tux/g # substitui palavra g - global
:! date # executa comando fora do vim
:r! date # executa comando e coloca resultado dentro do vim
:r! find / -size +40M 2> /dev/null
:set number # coloca o número das linhas no editor 

:set ignorecase # habilita busca sendo maiúsculas e minúsculas
vim /etc/vim/vimrc # alterar arquivo de configuração do vim
    syntax on
    set ignorecase
    set incsearch
    set autowrite
    set number

:vsplit /tmp/doc02.txt # divide a tela na vertical
ctrl + ww # alterna entre os arquivos
:qa! # sai de todos os arquivos abertos
G # vai pro final do arquivo
gg # vai pro início do arquivo
