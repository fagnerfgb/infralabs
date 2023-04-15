#Autor: Fagner Geraldes Braga  
#Data de criação: 15/04/2023    
#Data de atualização: 15/04/2023  
#Versão: 0.01

# Ansible
## Gerenciamento de Configuração
	https://docs.ansible.com/
	https://www.yamllint.com/

```bash
cd "/e/Users/fagne/CRFSP/OneDrive - crfsp.org.br/Git/infralabs/devops/vagrant"
vagrant up controle
vagrant ssh controle
sudo su -
apt update && apt upgrade -y
apt install ansible -y
ansible --version
apt install python -y
vim /etc/ansible/ansible.cfg
```
```bash
# No Gitbash
cd "/e/Users/fagne/CRFSP/OneDrive - crfsp.org.br/Git/infralabs/devops/vagrant"
vagrant up web
vagrant up db

# Gerando chaves ssh
vagrant ssh controle
ssh-keygen 
/home/vagrant/.ssh/id_rsa

# Copia chave pública ssh da máquina controle para máquina web
ssh-copy-id vagrant@192.168.84.11
# yes
# vagrant

# Copia chave pública ssh da máquina controle para máquina web
ssh-copy-id vagrant@192.168.84.11
# yes
# vagrant

ssh vagrant@192.168.84.11
exit
ssh vagrant@192.168.84.12
exit
```
```bash
mkdir devops
cd devops
echo '[intranet]
192.168.84.11

[datacenter]
192.168.84.12' > hosts

ansible intranet -u vagrant --private-key /home/vagrant/.ssh/id_rsa -i hosts -m shell -a 'ls /tmp'
```
```bash
echo " ---
- hosts: all
  tasks:
    - name: Execução de Comando usando Módulo Shell
      shell: cat /etc/hosts >> /tmp/arquivo.txt
  become: yes
" > shell.yml

ansible-playbook -u vagrant --private-key /home/vagrant/.ssh/id_rsa -i hosts shell.yml
```
```bash
echo '[intranet]
192.168.84.11 ansible_user=vagrant ansible_ssh_private_key_file="/home/vagrant/.ssh/id_rsa"

[datacenter]
192.168.84.12 ansible_user=vagrant ansible_ssh_private_key_file="/home/vagrant/.ssh/id_rsa"' > hosts

ansible-playbook -i hosts shell.yml
```

```bash
#copiar o hash da senha do usuário vagrant
sudo cat /etc/shadow

echo '---
- hosts: all
  become: yes
  tasks:
    - name: Criação de Grupos de Usuários
      group:
        name: "{{ item }}"
        state: present
      with_items:
        - g_ti
        - g_diretoria
        - g_suporte
    - name: Adicionando Usuário Suporte
      user:
        name: suporte
        comment: Suporte TI
        uid: 2000
        shell: /bin/bash
        group: g_ti
        groups: g_diretoria, g_suporte
        password: "$6$WNZ9g583$OWtbuEr8YoG7OrqMHHsT0FATxoGTCnswlswG8wUMR4LDmLyCURibKOanDs6YvPepRfT2ZzAQWU/B4usrFUpZQ."
        update_password: always
        append: yes' > groups.yml

ansible-playbook -i hosts groups.yml

ssh vagrant@192.168.84.11
sudo getent passwd suporte
sudo getent group
exit

ssh vagrant@192.168.84.12
sudo getent passwd suporte
sudo getent group
exit
```
```bash
echo '---
- hosts: datacenter
  become: yes
  tasks:
    - name: "Instalação dos Pacotes para Banco de Dados"
      apt:
        pkg:
          - mysql-server
          - wget
          - zip
          - curl
          - vim
          - python-mysqldb
        state: present
        update_cache: yes' > installdb.yml

ansible-playbook -i hosts installdb.yml
```