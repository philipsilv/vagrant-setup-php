#!/bin/bash

echo "---- Iniciando instalacao do ambiente de Desenvolvimento PHP ---"

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Instalando pacotes basicos ---"
sudo apt-get install software-properties-common vim curl python-software-properties git-core --assume-yes --force-yes

echo "--- Adicionando repositorio do pacote PHP ---"
sudo add-apt-repository ppa:ondrej/php

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Instalando PHP, Apache e alguns modulos ---"

sudo apt-get install php7.3 php-dev php7.3-common --assume-yes --force-yes
sudo apt-get install php7.3-cli libapache2-mod-php7.3 php7.3-mysql php7.3-pgsql php7.3-curl php-memcached php7.3-dev php7.3-mcrypt php7.3-sqlite3 php7.3-mbstring php*-mysql  php-gd php-xml php-mbstring  zip unzip --assume-yes --force-yes

echo "--- Habilitando o PHP 7 ---"
sudo a2dismod php5
sudo a2dismod php7.*
sudo a2enmod php7.3

echo "--- Habilitando mod-rewrite do Apache ---"
sudo a2enmod rewrite

echo "--- Reiniciando Apache ---"
sudo service apache2 restart

echo "--- Baixando e Instalando Composer ---"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "--- Instalando Banco NoSQL -> Redis <- ---"
sudo apt-get install redis-server --assume-yes
sudo apt-get install php7.3-redis --assume-yes

echo "--- Baixando e Instalando o Node ---"
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs --assume-yes --force-yes

echo "--- Baixando e Instalando o PhpUnit ---"
wget https://phar.phpunit.de/phpunit-8.0.phar
sudo mv phpunit-8.0.phar /usr/local/bin/phpunit
sudo chmod +x /usr/local/bin/phpunit
phpunit --version

echo "--- Baixando e Instalando o deployer ---"
curl -LO https://deployer.org/deployer.phar
sudo mv deployer.phar /usr/local/bin/dep
sudo chmod +x /usr/local/bin/dep

echo "--- Baixando e Instalando o Xdebug ---"
git clone https://github.com/xdebug/xdebug.git /tmp/xdebug
cd /tmp/xdebug/
sudo ./rebuild.sh --assume-yes --force-yes

echo "[OK] --- Ambiente de desenvolvimento concluido ---"
