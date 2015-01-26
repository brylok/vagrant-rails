# Vagrant Rails

Vagrant Rails aims at simplifying the setup of Vagrant virtual machine using shell provisioning and configuration.

## Instructions

* Get a copy of the Vagrantfile

  **curl**
  ```bash
  $ curl -L http://bit.ly/vagrantrails > Vagrantfile
  ```
  **wget**
  ```bash
  $ wget -O Vagrantfile http://bit.ly/vagrantrails
  ```
  **Direct Download:** http://bit.ly/vagrantrails

* Configure the Vagrantfile

  Edit the configuration properties at your heart's content.
  Uncommenting a line in the provisioning section will enable the installation of the software.

* Fire it up
  ```bash
  $ vagrant up

  # Access the VM
  $ vagrant ssh
  ```
## Notes

The ruby installation offers a bash alias 'ras' to run rails server with binding to 0.0.0.0 .
