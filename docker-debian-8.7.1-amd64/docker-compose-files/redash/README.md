docker-compose.yml for Redash
=============================

prepare
-------

    docker-compose up -d postgres && sleep 10
    docker-compose run --rm server create_db

start
-----

    docker-compose up -d
    # visit http://localhost:8080/
    # and setup
