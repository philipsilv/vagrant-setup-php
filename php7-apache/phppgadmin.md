# Configurando o PhpPgAdmin

### Configure Apache Web Server
You need to configure Apache virtual host configuration for phpPgAdmin.

Goto the **'/etc/apache2/conf-available'** directory and edit the configuration file **'phppgadmin.conf'** with vim by typing:

    cd /etc/apache2/conf-available/
    vim phppgadmin.conf

Comment out the line '#Require local' by adding a # in front of the line and add below the line allow from all so that you can access from your browser.

    Require all granted
    Save and exit.

### Configure phpPgAdmin

Go to the '/etc/phppgadmin' directory and edit the configuration file 'config.inc.php' by typing :

cd /etc/phppgadmin/
vim config.inc.php
**Find the line '$conf['extra_login_security'] = true;' and change the value to 'false'** so you can login to phpPgAdmin with user postgres.

    $conf['extra_login_security'] = false;
    Save and exit.

Now restart the PostgreSQL and Apache2 services.

    systemctl restart postgresql

    systemctl restart apache2