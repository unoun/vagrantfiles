vagrantfiles
============

docker-debian-8.4.0-amd64
-------------------------

    cd docker-debian-8.4.0-amd64
    vagrant up --provision-with provision
    vagrant reload --provision-with docker,packer
    vagrant reload --provision-with cleanup
    vagrant reload
    vagrant ssh -c "cd /vagrant && sudo bash scripts/mkdockerimage.sh"
    vagrant ssh -c "sudo docker import - local/debian-8.4.0-amd64 </vagrant/debian-8.4.0-amd64.tar.gz"

work on container
-----------------

### create

    sudo docker tag local/debian-8.4.0-amd64 local/work
    sudo docker create --name work -i -t local/work /bin/bash

### start

    sudo docker start -a -i work

### backup

    sudo docker export work | gzip >/vagrant/work.tar.gz

### restore

    zcat work.tar.gz | sudo docker import - local/work
    sudo docker create --name work -i -t local/work /bin/bash
