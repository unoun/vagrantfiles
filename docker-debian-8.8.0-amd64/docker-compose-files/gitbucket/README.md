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

backup
------

    docker-compose down
    docker-compose run -T postgres tar cvpzf - -C / var/lib/postgresql/data >postgres-data.tar.gz
    docker-compose run -T gitbucket tar cvpzf - -C / root/.gitbucket >gitbucket-home.tar.gz
    docker-compose down

restore
-------

    docker-compose down -v
    docker-compose run postgres tar xvpzf - -C / <postgres-data.tar.gz
    docker-compose run gitbucket tar xvpzf - -C / <gitbucket-home.tar.gz
    docker-compose down
