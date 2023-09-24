#Autor: Fagner Geraldes Braga  
#Data de criação: 18/04/2023  
#Data de atualização: 18/04/2023  
#Versão: 0.01

```bash
# Mostra qual o shell usado pelo usuário corrente
echo $SHELL

# Possui o shell padrão de cada usuário do sistema
cat /etc/passwd | grep senac

# Alterar o shell do usuário 
# Precisa instalar o shell zsh antes de executar o comando
sudo usermod -s /usr/bin/zsh senac
```

```bash
# ls
# Listar arquivos e diretórios
man ls
ls --help

ls

# -a all
ls -a

# -l long (detalhes)
ls -l

# -h human
ls -lha

# -S (Organizar pelo tamanho, onde os maiores aparecem primeiro)
ls -lSha

# -r (reverse)
ls -lShar

# -R (Recursivo)
ls -Rl
```

```bash
#$PATH

# echo em uma string
echo "Fagner"

# echo em uma variável
echo $PATH

# echo sem quebra de linha
echo -n "Fagner"

# mostra onde está o binário do comando
which ls

# Adiciona o diretório /home/senac/bin2 à variável PATH
PATH = $PATH:/home/senac/bin2
```

```bash
# Usuários

# Mostra nome do usuário corrente
whoami

# Mostra nome do usuário corrente
echo $USER

# Mostra nome do usuário corrente
echo $LOGNAME

# Troca de usuário
su nomedousuario -
```

```bash
# Estado do sistema (Run Level)

runlevel

# 0 - Desligar
poweroff
halt
init 0
shutdown -H
shutdown -P

# 6 - Reiniciar
init 6
reboot
poweroff -r
```

```bash
# uname

# Kernel
uname

# -a all
uname -a

# Kernel release
uname -r

# Kernel version
uname -v

# Machine
uname -m

# Processor
uname -p

# Hardware
uname -i

# Operating System
uname -o
```

```bash
# Navegação em Pastas
pwd
echo $PWD
cd /boot
echo $OLDPWD

# Volta pro home do usuário
cd
cd ~

# Volta para o diretório anterior em que você estava acessando
cd -
```

```bash
# History

# Mostra o histórico dos comandos do usuário atual
history

# Arquivo onde fica armazenado o histórico
cat .bash_history

set | grep HIST

# ! + número da linha para mostrar e executar o comando de uma determinada linha
!57

# Mostra o último comando que começa com uma determinada letra
!s
```

```bash
# Scripts de execução do BASH

cat /etc/bash.bashrc
cat .bashrc

# Global
cat /etc/profile

# Local
cat .profile

# Global
cat /etc/bash.bashrc

# Local
cat .bashrc
```

```bash
# Variáveis

# Locais
set

# Globais
echo FGB="FAGNER"
export
env


echo $PATH
export PATH=$PATH:/opt
```

```bash
# File Globbing

# * qualquer coisa
ls *.txt

# ? apenas um caractere
ls ?.txt

[sS]

[0-9]

ls [^fFiIsSwW]*
```

```bash
# Aspas

# Aspas duplas
# Consegue interpretar variáveis

# Aspas simples
# Não consegue interpretar variáveis

#\ informa ao bash que o carácter após \ dever ser considerado como carácter normal
```

```bash
cat /etc/hostname
hostnamectl
sudo hostnamectl -sethostname nome
```

```bash
# Localizar arquivos e diretórios

touch teste.txt
sudo updatedb
sudo apt install locate -y
sudo updatedb
locate teste.txt

man find
find .config/ -iname "*.xml"

type ls

whereis ls
```

man -k tty
apropos passwd
man -f passwd
whatis passwd
man 5 passwd
man 1 passwd
info - Gnu Core Utils
info cp

/usr/share/doc
/usr/share/man

man -l README.gz

tar cvf arq.tar /etc
tar tf arq.tar
tar xf arq.tar

tar czvf arq.tar.gz /etc
tar cjxf arq.tar.bz2 /etc
tar xvjf arq.tar.bz2
tar xvzf arq.tar.bz2

gzip arq.tar
gunzip arq.tar.gz

bzip2 arq.tar
bunzip2 arq.tar.bz2

zip -r arq.zip /etc
unzip arq.zip

xz arq.tar
unxz arq.tar.xz


cd /var/log
less kern.log
head kern.log
head -n 5 kern.log
tail kern.log
tail -n 5 kern.log
tail -f

cut -d : -f 1 /etc/passwd
cut -d : -f 1 /etc/passwd > arquivo.txt
sort arquivo.txt
cut -d : -f 1 /etc/passwd | sort
wc -l /etc/passwd
wc -w /etc/passwd
wc -c /etc/passwd

cat /etc/passwd
grep analista /etc/passwd
grep -i Analista /etc/passwd
grep '^s' /etc/passwd
grep 'n$' /etc/passwd
grep '^w.*n$' /etc/passwd
grep '^[mMgG]' /etc/passwd
grep '^[^mMgG]' /etc/passwd
grep '^.[a]' /etc/passwd
grep 'www*' /etc/passwd


