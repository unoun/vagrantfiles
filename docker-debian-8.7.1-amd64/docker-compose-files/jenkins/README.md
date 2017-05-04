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
