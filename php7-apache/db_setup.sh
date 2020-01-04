#!/bin/bash

echo "---- Iniciando instalacao PostgreSql ---"

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Instalando postgresql ---"
sudo apt-get install postgresql libpq5 postgresql-9.5 postgresql-client-9.5 postgresql-client-common postgresql-contrib --assume-yes --force-yes

echo "--- Instalando o phppgadmin ---"
sudo apt-get install phppgadmin --assume-yes --force-yes

echo "--- Alreando a senha do usuario postgres ---"
# sudo -u postgres psql -c "ALTER USER postgres with encrypted password '123';"
sudo -u postgres psql -c "SELECT 1 FROM pg_user WHERE usename = 'vagrant'" | grep -q 1 || sudo -u postgres psql -c "CREATE USER vagrant WITH PASSWORD 'vagrant';"
sudo -u postgres psql -c "ALTER ROLE vagrant WITH SUPERUSER;"
