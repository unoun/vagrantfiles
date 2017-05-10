docker-compose.yml for GitBucket
================================

start
-----

    docker-compose build
    docker-compose up -d
    # visit http://localhost:8080/
    # default user/pass is root/root

postgres
--------

    docker-compose exec --user postgres postgres /bin/bash

gitbucket
---------

    docker-compose exec gitbucket /bin/bash
