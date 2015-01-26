#################
# Configuration #
#################

script_url = ""

static_ip           = "192.168.33.10"
guest_port          = 3000
host_port           = 3000

ruby_version        = "latest" # use RVM version naming
rails_version       = "latest" # use Gem version naming

mysql_root_password = "root" # cannot be empty


Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"

  # Setup Networking
  config.vm.network "private_network", ip: static_ip
  config.vm.network "forwarded_port", guest: guest_port, host: host_port

  # Sync folders
  config.vm.synced_folder ".", "/vagrant"

###################################################
# Setup Provisioning, uncomment a line to install #
###################################################

  # Base packages
  config.vm.provision :shell, path: "base.sh"

  # Ruby via RVM
  config.vm.provision :shell, path: "ruby.sh", privileged: false, args: [ruby_version, rails_version]

  # SQLite
  config.vm.provision :shell, path: "sqlite.sh"

  # MySQL
  # config.vm.provision :shell, path: "mysql.sh", args: [mysql_root_password]

  # MongoDB
  # config.vm.provision :shell, path: "mongodb.sh"

  # Node.js
  # config.vm.provision :shell, path: "node.sh", privileged: false

end
