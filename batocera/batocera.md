#Autor: Fagner Geraldes Braga
#Data de criação: 07/11/2021
#Data de atualização: 18/11/2021
#Versão: 0.02

# Batocera no VirtualBox

	Download da imagem do Batocera
	[Clique Aqui](https://updates.batocera.org/x86_64/stable/last/batocera-x86_64-32-20210920.img.gz)

	Extrair o arquivo  
	Renomear o arquivo para batocera.img

	Abrir o Prompt de comando com privilégios de administrador e acessar diretório onde o arquivo extraído se encontra  
	Converter o arquivo com extensão img para a extensão vdi
	"C:\Program Files\oracle\VirtualBox\VBoxManage" convertdd batocera.img batocera.vdi  

	TEMPLATE-BATOCERA  
	RAM: 1GB

	Guia Geral  
	Avançado  
	Área de Transferência Compartilhada: Bi-direcional  
	Arrastar e Soltar: Bi-direcional  

	Guia Sistema  
	Processador:   
    	1 CPUs  
    	Habilitar PAE/NX
	
	Guia Monitor  
	Memória de Vídeo 128MB  
	
	Guia Armazenamento  
	Disco Rígido SATA 0 - Drive de estado sólido  
	Adicionar batocera.vdi (Mover batocera vdi da pasta onde o arquivo foi convertido para a pasta do Batocera do VirtualBox)  

	Guia Rede  
	Adaptador 1 - Habilitar Placa de Rede (Modo Bridge)

	Iniciar máquina virtual