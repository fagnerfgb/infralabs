#Autor: Fagner Geraldes Braga  
#Data de criação: 07/11/2021  
#Data de atualização: 18/12/2021  
#Versão: 0.02  
***
```bash
dnf install bsdtar  bzip2 curl wget tar zip nano sudo -y
systemctl start firewalld
firewall-cmd --state
firewall-cmd --get-active-zones
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --zone=public --permanent --add-service=https
reboot
dnf module install mariadb -y
systemctl enable --now mariadb
mysql -u root -e "create database glpi character set utf8";
mysql -u root -e "create user 'glpi'@'localhost' identified by '123456'";
mysql -u root -e "grant all privileges on glpi.* to 'glpi'@'localhost' with grant option";
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -p -u root mysql
senha em branco
mysql -u root 
GRANT SELECT ON `mysql`.`time_zone_name` TO 'glpi'@'localhost';
FLUSH PRIVILEGES;
quit
dnf install dnf-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
dnf module enable php:remi-7.3
dnf install php \
    php-curl \
    php-fileinfo \
    php-gd \
    php-json \
    php-mbstring \
    php-mysqli \
    php-session \
    php-zlib \
    php-simplexml \
    php-xml \
    php-cli \
    php-domxml \
    php-imap \
    php-ldap \
    php-openssl \
    php-xmlrpc \
    php-pecl-apcu \
    php-intl \
    php-zip \
    php-sodium

dnf --enablerepo=remi install php-pear-CAS
dnf install  httpd -y
vim /etc/httpd/conf.d/glpi.conf  
    <Directory /var/www/html/glpi>
        AllowOverride All
    </Directory>

systemctl  enable --now  httpd
systemctl status httpd.service
wget https://github.com/glpi-project/glpi/releases/download/9.5.6/glpi-9.5.6.tgz
tar xvf  glpi-9.5.6.tgz -C /var/www/html
chown  apache. -Rf /var/www/html/glpi/
cd /var/www/html/glpi
sudo -u apache php bin/console glpi:system:check_requirements

sudo -u apache php bin/console db:install -u glpi -d glpi -p 123456 -L pt_BR -vvv
mv /var/www/html/glpi/install/install.php /tmp
```

