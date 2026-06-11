Vagrant.configure("2") do |config|
  config.vm.box = "spox/ubuntu-arm"

  config.vm.define "web" do |web|
    web.vm.hostname = "web"
    # FIXED: VMware handles private networks differently; standardizing to 'private_network'
    web.vm.network "private_network", ip: "192.168.56.10"
    web.vm.network "forwarded_port", guest: 80, host: 8080

    # ADDED: These lines tell Vagrant to run your Bash scripts on the web node
    web.vm.provision "shell", path: "scripts/common.sh"
    web.vm.provision "shell", path: "scripts/web_setup.sh"

    web.vm.provider :vmware_desktop do |v|
      v.vmx["numvcpus"] = "2"
      v.vmx["memsize"] = "2048"
    end
  end

  config.vm.define "db" do |db|
    db.vm.hostname = "db"
    db.vm.network "private_network", ip: "192.168.56.11"

    # ADDED: These lines tell Vagrant to run your Bash scripts on the db node
    db.vm.provision "shell", path: "scripts/common.sh"
    db.vm.provision "shell", path: "scripts/db_setup.sh"

    db.vm.provider :vmware_desktop do |v|
      v.vmx["numvcpus"] = "1"
      v.vmx["memsize"] = "1024"
    end
  end
end