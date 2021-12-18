#Autor: Fagner Geraldes Braga  
#Data de criação: 07/11/2021  
#Data de atualização: 18/11/2021  
#Versão: 0.02  
***
TEMPLATE-LINUX CENTOS 8 STREAM  
RAM: 1GB  
HD: 30GB - VDI  
***
Guia Geral  
Avançado  
Área de Transferência Compartilhada: Bi-direcional  
Arrastar e Soltar: Bi-direcional  
***
Guia Sistema  
Placa-Mãe: Desmarcar Relógio da máquina retorna hora UTC  
Processador:   
    2 CPUs  
***  
Guia Armazenamento  
Disco Rígido SATA 0 - Drive de estado sólido  
Drive Óptico - Apontar caminho da ISO do CentOS  
***
Guia Áudio  
Desmarcar opção Habilitar Áudio  
***
Guia Rede  
Adaptador 1 - Habilitar Placa de Rede (Modo Bridge)  
***
Instalar CentOS  
Install CentOS Stream 8-stream  
Rede e nome do host: Conectar placa de rede  
Teclado: Português (Brasil)  
Suporte a idioma: Português (Brasil)  
Hora e data: Fuso horário Américas/São Paulo  
Destino da instalação: Selecionar disco disponível  
Senha de root: Xtr3m3!  
Nome completo: suporte  
Nome de usuário para sua conta: suporte  
Senha: suporte  
***
Logar como root  
Ativar Cockpit  
systemctl enable --now cockpit.socket  
***
```bash
# Atualizações
yum update 
yum upgrade
```
```bash
# Adicionais para Convidado do VirtualBox
# Montar o CD dos Adicionais para Convidado do VirtualBox
yum groupinstall "Development Tools"

yum install kernel-devel kernel-headers

export KERN_DIR=/usr/src/kernels/$(uname -r)

mount /dev/cdrom /media

cd /media

./VBoxLinuxAdditions.run

shutdown -r now

#Remover CD dos Adicionais para Convidado do VirtualBox

# SELinux
vim /etc/selinux/config
    SELINUX=disabled
```
***
Alterar placa de rede da VM para rede interna  
Exportar máquina virtual para futuros laboratórios
***
Importar VM  
Dar um duplo clique no arquivo de extensão ova para importar a VM   para o VirtualBox  
Iniciar VM
