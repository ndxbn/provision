Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.synced_folder "./playbook", "/vagrant",
                          type: "nfs",
                          id: "ansible",
                          mount_options: ["dmode=775,fmode=664"]

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "vagrant.yml"
    ansible.inventory_path = "development"
  end

  config.vm.define "devel01" do |machine|
    machine.vm.hostname = "devel01.ndxbn.tokyo"
    machine.vm.network :private_network, ip: "192.168.57.7"
  end

  config.vm.define "devel02" do |machine|
    machine.vm.hostname = "devel02.ndxbn.tokyo"
    machine.vm.network :private_network, ip: "192.168.57.8"
  end

  config.vm.define "devel03", primary: true do |machine|
    machine.vm.hostname = "devel03.ndxbn.tokyo"
    machine.vm.network :private_network, ip: "192.168.57.9"

    # playbook/vagrant.yml で作っている administrators の秘密鍵や ssh-config を置く
    machine.vm.provision :file, source: "~/.ssh", destination: ".ssh"
    machine.vm.provision :shell, privileged: false,
                         inline: "chmod 600 ~/.ssh/*"

    machine.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "site.yml"
      ansible.inventory_path = "development"
      ansible.limit = "all"
      ansible.galaxy_role_file = "requirements.yml"
      ansible.galaxy_roles_path = "galaxy_roles"
    end

  end
end
