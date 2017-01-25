vagrantfiles
============

docker-debian-8.7.1-amd64
-------------------------

### create

    cd docker-debian-8.7.1-amd64
    vagrant plugin install vagrant-reload
    vagrant up
    vagrant ssh -c "cd /vagrant && sudo bash scripts/mkdockerimage.sh"
    vagrant ssh -c "docker import - local/debian-8.7.1-amd64:base </vagrant/debian-8.7.1-amd64.tar.gz"
    vagrant ssh -c "docker build -t local/debian-8.7.1-amd64 /vagrant/dockerfiles/debian-8.7.1-amd64"

### provision

    vagrant provision

work on container
-----------------

### create

    docker tag local/debian-8.7.1-amd64 local/work
    docker create --name work -i -t local/work /bin/bash

### provision

    docker start work
    cd /vagrant/ansible
    ansible -i hosts work -m ping
    ansible-playbook -i hosts playbook.yml -v

### start

    docker start -a -i work

### backup

    docker export work | gzip >/vagrant/work.tar.gz

### restore

    zcat work.tar.gz | docker import - local/work
    docker create --name work -i -t local/work /bin/bash
