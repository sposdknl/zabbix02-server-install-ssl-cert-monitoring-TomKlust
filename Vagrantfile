
Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"   
  config.vm.hostname = "zabbix-server"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 10051, host: 10051
  config.vm.network "private_network", ip: "192.168.56.10"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.provision "shell", path: "provisioning/bootstrap.sh"
end
