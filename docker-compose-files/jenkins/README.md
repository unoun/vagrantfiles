docker-compose.yml for Jenkins
==============================

start
-----

    docker-compose pull
    docker-compose up -d
    # visit http://localhost:8180/

jenkins
--------

    docker-compose exec --user root jenkins /bin/bash

backup
------

    docker-compose down
    docker-compose run -T jenkins tar cvpzf - -C / var/jenkins_home >jenkins-home.tar.gz
    docker-compose down

restore
-------

    docker-compose down -v
    docker-compose run jenkins tar xvpzf - -C / <jenkins-home.tar.gz
    docker-compose down
