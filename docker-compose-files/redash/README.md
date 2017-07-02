docker-compose.yml for Redash
=============================

prepare
-------

    docker-compose up -d postgres && sleep 10
    docker-compose run --rm server create_db

start
-----

    docker-compose up -d
    # visit http://localhost:8280/
    # and setup

backup
------

    docker-compose down
    docker-compose run -T postgres tar cvpzf - -C / var/lib/postgresql/data >postgres-data.tar.gz
    docker-compose down
