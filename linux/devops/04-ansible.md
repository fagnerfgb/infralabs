#Autor: Fagner Geraldes Braga  
#Data de criação: 15/04/2023    
#Data de atualização: 16/04/2023  
#Versão: 0.02

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
ssh-copy-id vagrant@192.168.56.11
# yes
# vagrant

# Copia chave pública ssh da máquina controle para máquina db
ssh-copy-id vagrant@192.168.56.12
# yes
# vagrant

ssh vagrant@192.168.56.11
exit
ssh vagrant@192.168.56.12
exit
```
```bash
mkdir devops
cd devops
echo '[intranet]
192.168.56.11

[datacenter]
192.168.56.12' > hosts

ansible intranet -u vagrant --private-key /home/vagrant/.ssh/id_rsa -i hosts -m shell -a 'ls /tmp'
```
```bash
echo "---
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
192.168.56.11 ansible_user=vagrant ansible_ssh_private_key_file="/home/vagrant/.ssh/id_rsa"

[datacenter]
192.168.56.12 ansible_user=vagrant ansible_ssh_private_key_file="/home/vagrant/.ssh/id_rsa"' > hosts

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
        update_password: on_create
        append: yes' > groups.yml

ansible-playbook -i hosts groups.yml

ssh vagrant@192.168.56.11
sudo getent passwd suporte
sudo getent group
exit

ssh vagrant@192.168.56.12
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
```bash
# Verificando a instalação do MySQL
ssh 192.168.56.12
sudo mysql -u root -p
show databases;
exit
```
```bash
echo '
    - name: "Download Arquivo .sql para importação do Banco"
      unarchive:
        src: https://github.com/rogerramossilva/devops/raw/master/db.zip
        dest: /tmp
        remote_src: yes' >> installdb.yml

ansible-playbook -i hosts installdb.yml
```

```bash
echo '
    - name: "Criação de Banco de Dados Backup"
      mysql_db:
        name: backup
        login_user: root
        login_password: ""
        state: present' >> installdb.yml

ansible-playbook -i hosts installdb.yml
```
```bash
echo '
    - name: "Importação do arquivo backup.sql"
      mysql_db:
        login_user: root
        login_password: ""
        state: import
        name: backup
        target: /tmp/backup.sql' >> installdb.yml

ansible-playbook -i hosts installdb.yml
```

```bash
echo '
    - name: " Criação do usuário express para acesso a base de dados"
      mysql_user:
        login_user: root
        login_password: ""
        host: "%"
        name: express
        password: "AllSafe0!"
        priv: "backup.*:ALL"
        state: present' >> installdb.yml

ansible-playbook -i hosts installdb.yml
```
```bash
echo "
    - name: ' Substituindo 127.0.0.1 por 0.0.0.0 no MySQL'
      replace:
        path: /etc/mysql/mariadb.conf.d/50-server.cnf
        regexp: '127\.0\.0\.1'
        replace: '0.0.0.0'
    - name: 'Restartar serviço do MySQL'
      service:
        name: mysql
        state: restarted
        enabled: yes" >> installdb.yml

ansible-playbook -i hosts installdb.yml
```

```bash
echo "---
- hosts: intranet
  become: yes
  tasks:
    - name: 'Instalação dos Pacotes Aplicação Express'
      apt:
        pkg:
          - php
          - php-common
          - php-cli
          - php-fpm
          - php-json
          - php-pdo
          - php-mysql
          - php-zip
          - php-gd 
          - php-mbstring
          - php-curl
          - php-xml
          - php-pear
          - php-bcmath
          - apache2
          - wget
          - zip
          - curl
          - vim
        state: present
        update_cache: yes" > installweb.yml

ansible-playbook -i hosts installweb.yml
```

```bash
vagrant ssh controle
cd devops
mkdir vars
```

```bash
echo '---
app_user: "www-data"
http_port: 80
http_conf: "express.conf"
http_host: "asf.com"
disable_default: true' > ./vars/default.yml
```

```bash
echo '---
- hosts: intranet
  become: yes
  vars_files:
    - vars/default.yml
  tasks:
    - name: "Instalação dos Pacotes Aplicação Express"
      apt:
        pkg:
          - php
          - php-common
          - php-cli
          - php-fpm
          - php-json
          - php-pdo
          - php-mysql
          - php-zip
          - php-gd 
          - php-mbstring
          - php-curl
          - php-xml
          - php-pear
          - php-bcmath
          - apache2
          - wget
          - zip
          - curl
          - vim
        state: present
        update_cache: yes
    - name: "Diretório do Webserver"
      file:
        path: /srv/www
        state: directory
        owner: "{{app_user}}"
        mode: "0755"
    - name: "Download e Extração do conteúdo da Aplicação"
      unarchive:
        src: https://github.com/rogerramossilva/devops/raw/master/express.zip
        dest: /srv/www
        remote_src: yes
        validate_certs: no' > installweb.yml

ansible-playbook -i hosts installweb.yml
```

```bash
echo "
    - name: 'Substituindo IP de Conexão com BD no arquivo backup.php'
      replace:
        path: /srv/www/express/backup.php
        regexp: '192\.168\.1\.20'
        replace: '192.168.56.11'" >> installweb.yml

ansible-playbook -i hosts installweb.yml
```

```bash
echo "
    - name: 'Criando arquivo de configuração para Virtual Host da Página Express'
      template:
        src: 'files/express.conf'
        dest: '/etc/apache2/sites-available/{{ http_conf }}'" >> installweb.yml
```

```bash
mkdir files
echo "<VirtualHost express.asf.com:80>
  ServerAdmin webmaster@asf.com
  ServerName express.asf.com
  DocumentRoot /srv/www/express
  ErrorLog /var/log/apache2/express-error.log
  CustomLog /var/log/apache2/express-access.log combined
</VirtualHost>" > files/express.conf

ansible-playbook -i hosts installweb.yml
```

```bash
echo "
    - name: 'Criando Directory para controle das configurações Express'
      template:
        src: 'files/direxpress.conf'
        dest: '/etc/apache2/conf-available/direxpress.conf'
    - name: 'Alterando o arquivo /etc/hosts para resolução de nomes'
      template:
        src: 'files/hostsintranet'
        dest: '/etc/hosts'" >> installweb.yml
```

```bash
echo "<Directory /srv/www>
    Options Indexes FollowSymLinks
    AllowOverride none
    Require all granted
</Directory>" > files/direxpress.conf

echo "127.0.0.1 localhost
192.168.56.11 express.asf.com express" > files/hostsintranet

ansible-playbook -i hosts installweb.yml
```

```bash
echo "
    - name: 'Habilitando Site'
      shell: /usr/sbin/a2ensite {{ http_conf }}
      notify: restart apache

    - name: 'Habilitando Configuração direxpress'
      shell:  /usr/sbin/a2enconf direxpress.conf
      notify: restart apache
    - name: 'Habilitar módulos:'
      apache2_module:
        name: "{{ item }}"
        state: present
      loop:
        - vhost_alias
      notify: restart apache

  handlers:
    - name: 'restart apache'
      service:
        name: apache2
        state: restarted 
        enabled: yes" >> installweb.yml

ansible-playbook -i hosts installweb.yml
```