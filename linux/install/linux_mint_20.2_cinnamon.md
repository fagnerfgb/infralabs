#Autor: Fagner Geraldes Braga  
#Data de criação: 07/11/2021  
#Data de atualização: 18/11/2021  
#Versão: 0.02  
***
TEMPLATE-LINUX MINT 20.2 CINNAMON  
RAM: 2GB  
HD: 50GB - VDI  
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
    Habilitar PAE/NX  
***  
Guia Monitor  
Tela - Marcar Habilitar Aceleração 3D  
***    
Guia Armazenamento  
Disco Rígido SATA 0 - Drive de estado sólido  
Drive Óptico - Apontar caminho da ISO do Linux Mint  
***
Guia Áudio  
Desmarcar opção Habilitar Áudio  
***
Guia Rede  
Adaptador 1 - Habilitar Placa de Rede (Modo Bridge)  
***
Instalar Linux Mint  
OEM Install  
Idioma Português do Brasil  
FGB  
Layout do Teclado - Português (Brasil) - Testar \/|  
Instalar codecs multimídia  
Apagar disco e reinstalar o Linux Mint  
Local: São Paulo  
Senha: Xtr3m3!  
Desmarcar Mostre esta tela de boas-vindas ao iniciar o Linux Mint  
Primeiros Passos - Modo Noturno  
Leiaute Moderno  
***
Adicionais para Convidado do VirtualBox  
Instalar CD dos Adicionais para Convidado do VirtualBox  
Remover CD dos Adicionais para Convidado do VirtualBox  
Reiniciar o computador  
```bash
# Atualizações
# Abrir Terminal (Ctrl + Alt + T)
sudo apt update && apt upgrade -y
# Mover Painel para parte de cima da tela

# Aplicativos
# Instalação por linha de comando
sudo apt install cairo-dock vim kolourpaint notepadqq vlc -y

# Cairo-Dock
# KolourPaint
# Vim
# NotepadQQ
# VLC
```
## Baixar Pacotes .Deb no site dos criadores  
Google Chrome  
Microsoft Edge  
Teams  
Visual Studio Code  
Free Office  

## Gerenciador de Aplicativos
Instalar Ttf-mscorefonts-installer  
Marcar Do you accept the EULA license terms?  
```bash
sudo apt clean 
sudo apt autoclean
sudo apt autoremove
```

## Cairo-Dock
Lembrar esta escolha  
Yes

## Aplicativos na Inicialização
Cairo-Dock  
Atraso para iniciar = 5

## Aplicativos Preferenciais
Web = Chrome  
Texto Puro = VSCode  
Música = VLC  
Vídeo = VLC  
Código Fonte = VSCode 

Preparo para entregar ao usuário final  
Desligar
***
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
***
Observações:  
Cairo-Dock perde a referência depois de generalizar a máquina  
Painel volta para a parte inferior da tela depois de generalizar a máquina  
