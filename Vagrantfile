Vagrant.configure("2") do |config|
    ## Ubuntu 14.04
    config.vm.box = "ubuntu/trusty64"

    ## Hostname
    config.vm.hostname = "vagrant.viper.works"

    ## HTTP
    # config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true

    # Allow NFS on NFS enabled hosts
    # You may need to run: sudo apt-get install nfs-kernel-server
    #config.vm.network :private_network, ip: "10.11.12.13"

    config.vm.synced_folder "./", "/vagrant"

    # Share for masterless server
    config.vm.synced_folder "salt/roots/", "/srv/"

    config.vm.provision :salt do |salt|
        # Configure the minion
        salt.minion_config = "salt/minion.conf"

        # Show the output of salt
        salt.verbose = true

        # Run the highstate on start
        salt.run_highstate = true

        # Pre-distribute these keys on our local installation
        salt.minion_key = "salt/keys/vagrant.viper.works.pem"
        salt.minion_pub = "salt/keys/vagrant.viper.works.pub"

        # Install the latest version of SaltStack
        salt.install_type = "daily"
    end

    config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
end