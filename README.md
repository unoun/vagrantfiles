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

or

    cd /vagrant/ansible
    ansible localhost -i hosts -m ping
    ansible-playbook playbook/localhost.yml -i hosts -vvv

work on container
-----------------

### prepare

    docker volume create work-volume
    docker network create --gateway "10.128.0.1" --subnet "10.128.0.0/16" --ip-range "10.128.0.0/16" work-network

    docker tag local/debian-8.7.1-amd64 local/work

### create

    cd /vagrant/docker-compose-files/work
    docker-compose create

or

    docker create --name work --ip "10.128.0.2" --network "work-network" -v work-volume:/data -i -t local/work /bin/bash

### network

    docker network disconnect work-network work
    docker network connect --ip "10.128.255.254" work-network work

### start

    cd /vagrant/docker-compose-files/work
    docker-compose up -d

or

    docker start work

### provision

    cd /vagrant/ansible
    ansible work -i hosts -m ping
    ansible-playbook playbook/work.yml -i hosts -vvv -C -D
    ansible-playbook playbook/work.yml -i hosts -vvv

### exec

    docker exec -i -t work /bin/bash

### backup

    docker exec work tar cvpzf - -C / data >/vagrant/work-volume.tar.gz

### restore

    docker exec -i work tar xvpzf - -C / </vagrant/work-volume.tar.gz
