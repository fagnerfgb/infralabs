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
	web.vm.hostname = "web"
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
	db.vm.hostname = "db"
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
vagrant ssh web
vagrant up --parallel
vagrant plugin list
vagrant plugin install vagrant-group

vim Vagrantfile
config.group.groups = {
    "controle" => [
      "controle",
    ],
    "clientes" => [
      "web",
      "db",
    ],
}
vagrant validate
vagrant group halt clientes
vagrant up --parallel

https://rubygems.org

# Baixa box do vagrant cloud
vagrant box add geerlingguy/centos7

vim Vagrantfile
config.vm.define "master" do |master|
	master.vm.box = "geerlingguy/centos7"
	master.vm.network "private_network", ip: "192.168.84.30"
	master.vm.hostname = "master"
	master.vm.provider "virtualbox" do |vb|
		vb.name = "master"
		vb.memory = "2048"
		vb.cpus = 2
	end
	master.vm.synced_folder "./configs", "/var/configs", owner: "root", group: "root"
end
(1..3).each do |i|
	config.vm.define "node#{i}" do |node|
		node.vm.box = "geerlingguy/centos7"
		node.vm.network "private_network", ip: "192.168.84.3#{i}"
		node.vm.hostname = "node#{i}"
		node.vm.provider "virtualbox" do |vb|
		vb.name = "node#{i}"
		vb.memory = "512"
		vb.cpus = 1
		end
	end
end
vagrant validate

vim Vagrantfile
config.group.groups = {
    "controle" => [
      "controle",
    ],
    "clientes" => [
      "web",
      "db",
    ],
	"nodes" => [
		"node1",
		"node2",
		"node3",
	],
}
vagrant validate
vagrant status
vagrant halt controle
vagrant group up nodes && vagrant up master

vim vagrant teste.txt
vagrant upload teste.txt master

vagrant snapshot save master "Teste Snapshot"
vagrant snapshot list
vagrant snapshot restore master "Teste Snapshot"
vagrant snapshot delete master "Teste Snapshot"

vagrant halt

# No diretório onde está a VM
vagrant package --base web --output web
mv package.box /d/template
vagrant box add web /d/template/web.box
vagrant box list

Para usar o box criado trocar o nome no campo vm.box no arquivo Vagrantfile

vagrant cloud auth login
vagrant cloud auth login --check
vagrant cloud publish fagnerfgb/web 1.0 virtualbox /d/template/package.box -d "Web" --version-description "Debian9" --release --short-description "Debian"

egrep -v "^.*#|^$" Vagrantfile

## Plugin de disco
https://github.com/sprotheroe/vagrant-disksize

vagrant plugin install vagrant-disksize

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.disksize.size = "50GB"
end

.bashrc
alias vs="vagrant up && vagrant ssh"
alias vd="vagrant destroy -f"

### Teste
```