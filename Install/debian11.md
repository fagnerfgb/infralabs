#Autor: Fagner Geraldes Braga  
#Data de criação: 07/11/2021  
#Data de atualização: 18/11/2021  
#Versão: 0.02  
***
TEMPLATE-LINUX DEBIAN 11  
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
Drive Óptico - Apontar caminho da ISO do Debian  
***
Guia Áudio  
Desmarcar opção Habilitar Áudio  
***
Guia Rede  
Adaptador 1 - Habilitar Placa de Rede (Modo Bridge)  
***
Instalar Debian  
Graphical install  
Idioma: Português do Brasil  
Localidade: Brasil  
Layout do Teclado: Português Brasileiro  
Nome de Máquina: debian  
Nome de domínio: fgb.local  
Senha de root: Xtr3m3!  
Nome de usuário: suporte  
Nome de usuário para sua conta: suporte  
Senha: suporte  
Fuso Horário: São Paulo  
Particionar discos: Assistido - usar o disco inteiro  
Todos os arquivos em uma partição  
Escrever as mudanças nos discos? Sim  
Ler mídias adicionais? Não  
Usar um espelho de rede? Sim  
País do espelho do repositório Debian: Estados Unidos  
Espelho do repositório Debian: deb.debian.org  
Informação sobre proxy HTTP (deixe em branco para nenhum)  
Participar de concurso de utilização de pacotes? Não  
Seleção de software  
* ambiente de área de trabalho no Debian  
* GNOME  
* utilitários de sistema padrão 

Instalar o carregador de inicialização GRUB no seu disco primário?  
Sim  
Dispositivo no qual instalar o carregador de inicialização:   
/dev/sda

```bash
# Abrir Terminal
su - 

# Alterar Sources list
vi /etc/apt/sources.list
# Comentar linha para procurar listas no CDROM

# Atualizações
apt update && apt upgrade -y

# Instalação do Vim
apt install vim -y

# Adicionais para Convidado do VirtualBox
# Montar o CD dos Adicionais para Convidado do VirtualBox
# Abrir o terminal
su -
apt install -y build-essential module-assistant
m-a prepare
sh /media/cdrom/VBoxLinuxAdditions.run
shutdown -r now
# Remover CD dos Adicionais para Convidado do VirtualBox
```

Adicionar terminal aos favoritos  
Alterar Preferências (GNOME escuro)  
Fonte DejavuSansMono 14  
Mostrar aplicativos, Configurações  
* Energia:  
    * Apagar Tela: Nunca  
    * Suspensão automática: Desativada  

```bash
# Abrir o terminal
su -
apt clean 
apt autoclean
apt autoremove
```
Alterar placa de rede da VM para rede interna  
Exportar máquina virtual para futuros laboratórios  
***
Importar VM  
Dar um duplo clique no arquivo de extensão ova para importar a VM para o VirtualBox  
Iniciar VM  
***
Selecionar Idioma Português do Brasil  
Layout do Teclado - Português (Brasil) - Testar \/|  
Local: São Paulo  
Seu Nome: suporte  
Nome do seu computador: suporte-VirtualBox  
Usuário: suporte  
Senha: suporte  
Solicitar minha senha para entrar  
