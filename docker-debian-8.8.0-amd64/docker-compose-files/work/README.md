work on container
=================

prepare
-------

    docker volume create work-volume
    docker network create --gateway "10.128.0.1" --subnet "10.128.0.0/16" --ip-range "10.128.0.0/16" work-network

    docker tag local/debian-8.8.0-amd64 local/work

create
------

    cd /vagrant/docker-compose-files/work
    docker-compose create

or

    docker create --name work --ip "10.128.0.2" --network "work-network" -v work-volume:/data -i -t local/work /bin/bash

network
-------

    docker network disconnect work-network work
    docker network connect --ip "10.128.255.254" work-network work

start
-----

    cd /vagrant/docker-compose-files/work
    docker-compose up -d

or

    docker start work

provision
---------

    cd /vagrant/ansible
    ansible work -i hosts -m ping
    ansible-playbook playbook/work.yml -i hosts -vvv -C -D
    ansible-playbook playbook/work.yml -i hosts -vvv
    docker commit work local/work

exec
----

    docker-compose exec work /bin/bash

or

    docker exec -i -t work /bin/bash

backup
------

    docker-compose run -T work tar cvpzf - -C / data >work-volume.tar.gz

or

    docker exec work tar cvpzf - -C / data >/vagrant/work-volume.tar.gz

restore
-------

    docker-compose run work tar xvpzf - -C / <work-volume.tar.gz

or

    docker exec -i work tar xvpzf - -C / </vagrant/work-volume.tar.gz
