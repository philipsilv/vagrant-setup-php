Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.synced_folder "~", "/vagrant", owner: "vagrant", group: "vagrant"  
  #Configurando o servidor web
  config.vm.hostname = "php-server"
  config.vm.network :private_network, ip: "192.168.33.10"  
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.synced_folder "www", "/var/www/html/", owner: "www-data", group: "www-data", mount_options: ['dmode=777','fmode=666']
  #compartilha os arquivos de configuração de ambiente
  config.vm.synced_folder "./php7-apache/conf.d", "/etc/php/7.3/apache2/conf.d"
  config.vm.synced_folder "./etc", "/vagrant"
  #setup
  config.vm.provision :shell, path: "./php7-apache/db_setup.sh"
  config.vm.provision :shell, path: "./php7-apache/web_setup.sh"
  config.vm.provision :shell, path: "./etc/etc_setup.sh"
  #Configuração da maquina no virtuabox
  config.vm.provider "virtualBox" do |machine|
    machine.name = "php7-apache"
    machine.memory = 1024
  end
end
