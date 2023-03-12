#Autor: Fagner Geraldes Braga  
#Data de criação: 12/03/2023  
#Data de atualização: 12/03/2023  
#Versão: 0.01  
******************************************************************************************
Windows Server 2002 Standard  
RAM: 8GB
******************************************************************************************
Guia Geral  
Avançado  
Área de Transferência Compartilhada: Bi-direcional  
Arrastar e Soltar: Bi-direcional  
******************************************************************************************
Guia Sistema  
Placa-Mãe:   
Habilitar o I/O APIC  
Processador:   
    2 CPUs  
    Habilitar PAE/NX  
    Habilitar VT-x/AMD-V Aninhado  
****************************************************************************************** 
Guia Monitor  
Memória de vídeo: 256MB   
Tela - Desmarcar Habilitar Aceleração 3D  
******************************************************************************************  
Guia Armazenamento  
Disco Rígido SATA 1 - Drive de estado sólido HD: 60GB - VDI (Sistema)  
******************************************************************************************
Guia Áudio  
Desmarcar opção Habilitar Áudio  
******************************************************************************************
Guia Rede  
Adaptador 1 - Habilitar Placa de Rede (Modo Bridge) - Internet  
Adaptador 2 - Host-only (192.168.56.254)  
******************************************************************************************
Instalar Windows Server 2022 Standard (Experiência Desktop)  
Instalação Personalizada  
Um disco com partição de 60GB para SO  
******************************************************************************************
Adicionais para Convidado do VirtualBox  
Instalar CD dos Adicionais para Convidado do VirtualBox  
Reiniciar o computador  
******************************************************************************************
Windows Update  
Baixar e Instalar Atualizações disponíveis  
******************************************************************************************
UAC  
Nunca notificar  
******************************************************************************************
Propriedades do Sistema (Windows Pause + Break)  
Guia Avançado, Desempenho - Ajustar para obter um melhor desempenho  
Guia Remoto  
    Marcar Permitir conexões remotas com este computador  
******************************************************************************************
Gerenciador de Servidores  
    Configuração de Segurança Aprimorada do IE  
        Administradores - Desligada  
        Usuários - Ligada  
******************************************************************************************
BGinfo  
Copiar pasta Scripts em C:\  
Colocar atalho do logon.vbs para executar na Inicialização do Sistema  
    C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp  
******************************************************************************************
Windows  
Usuário: Administrator  
Senha: 123@senac  
******************************************************************************************
Abrir o Powershell ISE como Administrador e executar os scripts na seguinte ordem:  
00-config.ps1  
01-rras.ps1  
******************************************************************************************
Habilitar Solicitação de Eco-ICMPv4 no Firewall  
******************************************************************************************
Abra o Windows Defender Firewall com Segurança Avançada  
Vá em Regras de Entrada  
Localize a opção "Compartilhamento de Arquivo e Impressora (Solicitação de Eco - ICMPv4-In)  
Clique com o botão direito do mouse e habilite a Regra  
Verifique se o servidor GRU-DC01 consegue pingar o servidor RRAS  
******************************************************************************************
Documentar Roteamento e NAT  










