#Autor: Fagner Geraldes Braga  
#Data de criação: 08/04/2023    
#Data de atualização: 08/04/2023  
#Versão: 0.01
***
## Vagrant
```bash
https://developer.hashicorp.com/vagrant/downloads
https://developer.hashicorp.com/vagrant/docs

https://app.vagrantup.com/boxes/search


Foi necessário colocar o domínio vagrantcloud.com como confiável no antivírus para poder realizar os procedimentos abaixo

vagrant box add geerlingguy/debian9
vagrant box list
cd /e/Users/fagne/CRFSP/OneDrive - crfsp.org.br/Git/infralabs/devops/vagrant
vagrant init geerlingguy/debian9
vagrant up
vagrant status

vagrant ssh-config
vagrant ssh

vim Vagrantfile
	config.vm.network "private_network", ip: "192.168.84.10"
vagrant halt default
vagrant up default

vagrant ssh
sudo su -
apt update
apt install nginx vim -y
exit
exit

vim Vagrantfile
	config.vm.network "private_network", type: "dhcp"
vagrant reload

vagrant destroy
```