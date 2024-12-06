#Autor: Fagner Geraldes Braga  
#Data de criação: 12/12/2021  
#Data de atualização: 18/12/2021  
#Versão: 0.02
***
Dia 1 - 04/12/2021
***
* analista@interno:~$  
* analista = usuario  
* interno = hostname  
* ~ = diretório home do usuário  
* $ = usuário padrão
* '#' = usuário com privilégios administrativos
***
```bash
# Usuário logado
whoami

# Nome do computador
hostname

# Nome do computador e mais informações
bash
hostnamectl

# Histórico dos comandos digitados
history

# Exibe o diretório corrente
pwd 
```
```bash
# Sobe um nível na hierarquia de diretório
cd .. 

# Vai para diretório raiz
cd / 

# Abrir sessão com usuário root  
#Usar o '-' para carregar as variáveis de ambiente
su - root

# Lista o diretório /home
ls /home/ 

# Lista o diretório /var
ls /var/ 

# Lista o diretório atual
ls 

ls -l # -l listagem longa 
l # link simbólico (atalho) 
d # diretório 
- # arquivo comum (áudio,texto,imagem)
```

[FHS - File Hierarchy Standard](https://external-preview.redd.it/JKYkgkWMKu4FStR49umwXIwR2BV1bjhH4wM6d9fvCgk.png?auto=webp&s=1247e7df2a1c937cd598b3252d74ef7bf2b18798)

```bash
cd /opt/ # acessa o diretório /opt/

ls -lhi 
# l - longo 
# h- humano
# i= inode do arquivo

touch doc01.txt doc02.txt 
# alterar o timestamp ou cria arquivo vazio

ls -lhi

file * # determina o tipo de arquivo

touch .doc03.txt touch .doc04.txt # cria arquivos ocultos
ls -a # -a lista arquivos ocultos 

mkdir -v rel # cria diretório 
# -v verbose mostra na tela o resultado da ação

mkdir -v dir01 dir02 dir03

rmdir dir01 dir02 dir03 rel/
# rmdir 'remove diretório vazio'

# rm 'remove arquivos e diretórios'
rm .doc0* # remove os arquivos ocultos que iniciam com .doc0
rm doc01.txt doc02.txt -v # remove os arquivos e exibe o resultado na tela

cd /tmp/
mkdir -pv software/dir01 #(parents)
mkdir -pv software/dir02 #(parents)
mkdir -pv software/dir03 #(parents)

ls -lR software = # -R (recursivo)

rm -rfv software 
# -f (não pede por informações) 
# -r(recursivo)

cp -p /etc/passwd   /tmp/ 
# cp: copia arquivo de uma origem para um destino
# -p: preserva permissões

cp -pv /etc/passwd   /tmp/senha # copia e altera o nome no destino 
cp -rpv /var/log   /tmp/   # -r copia de forma recursiva

mv /tmp/log   /opt/ -v # move diretórios
mv /tmp/senha /opt/ # move diretórios
mv log   eventos # renomeia o diretório
mv senha passwd # renomeia o arquivo

man ls # manual do ls
q # sair do manual
ls /bin /sbin /usr/bin/ /usr/sbin/ # lista vários diretórios

whoami # id -un
id root
id analista

# arquivo = inode (número de identificação do arquivo)
# nome = uid (número de identificação do usuário)

man who
who -a

man history
history # exibe o histórico completo 
history 10 # exibe o histórico das últimas 10 linhas
!15 # acessa o comando digitado na linha 15

echo $HISTSIZE # quantidade de linhas armazenadas na memória pelo history
echo $HISTFILESIZE # quantidade de linhas armazenadas no arquivo pelo history
history -c # limpa o histórico na memória
cat /root/.bash_history # arquivo de history do root
history -w # sincroniza a memória com o arquivo .bash_history
fc -l # mostra as últimas 16 linhas do history
ctrl + r # busca mais rápida no histórico
```

# Comandos Internos
```bash
help # comandos shell definidos internamente
help cd
help while
help if
help # comando
```
# Comando Externo
```bash
# comando --help
ls --help
```
```bash
apropos find # procura manual por nome e descrição
apropos network # procura manual que contenha a palavra network no nome e/ou na descrição do manual
apropos f |grep ^f #procurar manuais que começam com f#
apropos pass
man -k pass # comando igual ao apropos

man man
whatis ls # procura manuais com o nome exato
whatis intro
man ls
man -f intro # comando igual ao whatis
man 3 intro # manual intro seção 3
man -K network # busca palavra chave dentro dos manuais

whereis ls # mostra o local onde está gravado o binário e o manual
# binário: /usr/bin/ls
# binário: /usr/bin/pwd

which ls # mostra o local onde está gravado o binário
which pwd
```
[Explain Shell](https://explainshell.com)

```bash
/usr/share/man # path dos arquivos de manuais
/usr/share/doc # path dos arquivos de documentação

less README # leitor de arquivo sem necessidade de abri-lo.
#Permite que a tela seja rolada para cima e para baixo, linha por linha
Q #sai do less

more README # leitor de arquivo sem necessidade de abri-lo.
#Rola a tela ao pressionar enter

cat README # Exibe conteúdo do arquivo
```
# Fluxos e Redirecionamentos

whatis stdin  
whatis stdout  
whatis stderr  

0 = stdin - Entrada Padrão - teclado  
1 = stdout - Saída Padrão - monitor  
2 = stderr - Saída de Erros Padrão - monitor  

```bash
ls /etc/*.conf
ls /etc/*.conf 1>  lista.txt 
# lista todos os arquivos que terminam com *.conf no diretório /etc e salva no arquivo
```

| Redirecionador    | Descrição                                                 |
| --                | --                                                        |
|>                  | Redireciona stdout, cria ou sobrescreve arquivo           |
|>>                 | Redireciona stdout, cria ou incrementa arquivo            |
|<                  | Igual ao > mas com fluxo da direita para esquerda         |
|<<                 | Igual ao >> mas com fluxo da direita para esquerda        |
|2>                 | Redireciona stderr, cria ou sobrescreve arquivo           |
|2>>                | Redireciona stderr, cria ou incrementa arquivo            |
|&>                 | Redireciona stdout e stderr, cria arquivo                 |
|&>>                | Redireciona stdout e stderr, cria ou incrementa arquivo   |
|2>&1               | Igual a &>                                                |

```bash
find / -size +40M 
# localiza arquivos maiores que 40MB a partir do diretório raiz

find / -size +40M > busca.txt 
# localiza arquivos maiores que 40MB a partir do diretório raiz e salva no arquivo

find / -size +40M  2> erros.txt
# localiza arquivos maiores que 40MB a partir do diretório raiz e salva os erros no arquivo

find / -size +40M  2> /dev/null 
# /dev/null = joga os erros no limbo

find / -size +40M  > saida.txt 2>&1 
# joga o resultado da busca (stdout e stderr) no arquivo

help set
date > saida.txt # joga a data no arquivo
set -o noclobber # não deixa sobrescrever os arquivos
set +o noclobber # deixa sobrescrever os arquivos

chattr +i saida.txt # não permite alteração do arquivo
chattr -i saida.txt # permite alteração do arquivo
```
```bash
cat > saida.txt
jose
maria
tereza
marcos

cat <<EOF> saida.txt
> jose
> tereza
> pedro
> gabriel
> EOF
```
```bash
cp /etc/passwd /tmp
cat /tmp/passwd

wc -l /tmp/passwd 
# -l conta a quantidade de linhas do arquivo
# -c conta a quantidade de bytes do arquivo
# -m conta a quantidade de caracteres do arquivo
# -w conta a quantidade de palavras do arquivo
# wc /tmp/passwd = conta linhas, bytes e caracteres

cat -n /tmp/passwd #  coloca o número em frente de cada linha 

date |tee saida.txt #  tee imprime e salva stdout no arquivo
tee -a #  faz o append no arquivo

find / -size +40M |tee saida.txt

tr #  traduz ou deleta caracteres
man tr
head -n 5 /tmp/passwd
# mostra as primeiras 5 linhas do arquivo

head -n 5 /tmp/passwd  |tr -d a 
# mostra as primeiras 5 linhas do arquivo e deleta o caracter "a" na tela

head -n 5 /tmp/passwd  |tr ':' ';' 
# mostra as primeiras 5 linhas do arquivo e substitui o caracter : por ; na tela

head -n 5 /tmp/passwd  |tr o O

head -n 5 /tmp/passwd  |tr -s o 
# -s substitui cada sequencia de caracteres repetidos por apenas 1

head -n 5 /tmp/passwd  |tr -d a-d 
# deleta caracteres a,b,c,d

head -n 5 /tmp/passwd  |tr a-z A-Z 
# troca minúsculas por maiúsculas
```
```bash
grep --color systemd /tmp/passwd 
# localiza a palavra no arquivo e deixa o palavra buscada em colorido

grep -n --color systemd /tmp/passwd 
# -n coloca o número da linha

grep -rin --color core /etc/ 
# -r buscar em um diretório
# -i maiúsculas e minúsculas

grep --color nologin /tmp/passwd

grep -v --color nologin /tmp/passwd 
# -v mostras as linhas que não possuem palavra buscada

grep --color -i 'gnome display' /tmp/passwd

grep -n --color analista /tmp/passwd -A 2 -B 2 
# -A 2 = 2 linhas depois do resultado da busca 
# -B 2 = 2 linhas antes do resultado da busca
```
```bash
# Expressões Regulares

# ^   início de linha
# [intervalo de caracteres]
# ^[sS$][eE&][xX][oO0]

egrep --color '^[abcd]' /tmp/passwd 
# busca no arquivo por palavras que comecem com a,b,c,d

egrep --color '^[a-d]' /tmp/passwd 
# busca no arquivo por palavras que comecem com a,b,c,d

egrep --color '^bin|^root' /tmp/passwd 
# busca no arquivo por palavras que comecem com bin ou com root
