#Autor: Fagner Geraldes Braga  
#Data de criação: 08/04/2023    
#Data de atualização: 09/04/2023  
#Versão: 0.02
***
## Vagrant
```bash
https://developer.hashicorp.com/vagrant/downloads

https://developer.hashicorp.com/vagrant/docs

https://app.vagrantup.com/boxes/search


Foi necessário colocar o domínio vagrantcloud.com como confiável no antivírus para poder realizar os procedimentos abaixo

# Baixa box do vagrant cloud
vagrant box add geerlingguy/debian9

# Lista boxes
vagrant box list

cd /e/Users/fagne/CRFSP/OneDrive - crfsp.org.br/Git/infralabs/devops/vagrant

# Cria arquivo Vagrantfile com as configurações da VM
vagrant init geerlingguy/debian9

# Inicializa as VMs que estão no diretório
vagrant up

# Mostra o status das VMs que estão no diretório
vagrant status

# Mostra as configurações de SSH das VMs que estão no diretório
vagrant ssh-config

# Acessa a VM usando o SSH
vagrant ssh

# Alterando as configurações de rede através do Vagrantfile
vim Vagrantfile
	config.vm.network "private_network", ip: "192.168.84.10"

# Desliga as VMs que estão no diretório 
vagrant halt default

# Inicializa as VMs que estão no diretório
vagrant up default

vagrant ssh
sudo su -
apt update
apt install nginx vim -y
exit
exit

# Alterando as configurações de rede através do Vagrantfile
vim Vagrantfile
	config.vm.network "private_network", type: "dhcp"
vagrant reload

# Destrói as VMs que estão no diretório
vagrant destroy

vim Vagrantfile
	config.vm.network "public_network"
vagrant up

vim Vagrantfile
# Comentar as linhas abaixo
	config.vm.network "private_network", type: "dhcp"
	config.vm.network "public_network"
	config.vm.box = "geerlingguy/debian9"
# Inserir as linhas abaixo

# VM de controle
config.vm.define "controle" do |controle|
	controle.vm.box = "geerlingguy/debian9"
	controle.vm.network "private_network", ip: "192.168.84.10"
	controle.vm.hostname = "controle"
	controle.vm.provider "virtualbox" do |vb|
		vb.name = "controle"
		vb.memory = "2048"
		vb.cpus = 2
		# vb.gui = true
	end
end

vagrant status

# Verifica se o Vagrantfile está OK
vagrant validate

# Reinicia a VM
vagrant reload controle
vagrant ssh controle

# Inserindo mais configurações ao Vagrantfile
# No final do arquivo, após primeiro end
vim Vagrantfile
	controle.vm.provision "shell",
	inline: "apt update && apt install vim -y"

vagrant provision controle

mkdir scripts
cd scripts
vim update.sh
	#!/bin/bash
	apt update
	apt install vim -y

cd ..
vim Vagrantfile
	controle.vm.provision "shell", path: "./scripts/update.sh"

vagrant validate
vagrant provision controle

vim Vagrantfile
	controle.vm.synced_folder ".", "/vagrant", disabled: true
	controle.vm.synced_folder "./configs", "/var/configs", owner: "root", group: "root"

mkdir configs
vagrant reload --provision controle

vim Vagrantfile
# Comentar a linha
controle.vm.synced_folder ".", "/vagrant", disabled: true

config.vm.define "web" do |web|
	web.vm.box = "geerlingguy/debian9"
	web.vm.network "private_network", ip: "192.168.84.11"
	web.vm.hostname = "controle"
	web.vm.provider "virtualbox" do |vb|
		vb.name = "web"
		vb.memory = "512"
		vb.cpus = 1
	end
	web.vm.provision "shell", path: "./scripts/update.sh"
	web.vm.synced_folder "./configs", "/var/configs", owner: "root", group: "root"
end

config.vm.define "db" do |db|
	db.vm.box = "geerlingguy/debian9"
	db.vm.network "private_network", ip: "192.168.84.12"
	db.vm.hostname = "controle"
	db.vm.provider "virtualbox" do |vb|
		vb.name = "db"
		vb.memory = "512"
		vb.cpus = 1
	end
	db.vm.provision "shell", path: "./scripts/update.sh"
	db.vm.synced_folder "./configs", "/var/configs", owner: "root", group: "root"
end

vagrant validate
vagrant global-status
vagrant status
vagrant up
vagrant port controle #2222
vagrant port web #2200
vagrant port db #2201






```