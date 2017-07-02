docker-compose.yml for Redmine with PostgreSQL
==============================================

start
-----

    docker-compose build
    docker-compose up -d
    # visit http://localhost:3000/
    # default user/pass is admin/admin

postgres
--------

    docker-compose exec --user postgres postgres /bin/bash

redmine
-------

    docker-compose exec redmine /bin/bash

backup
------

    docker-compose down
    docker-compose run -T postgres tar cvpzf - -C / var/lib/postgresql/data >postgres-data.tar.gz
    docker-compose run -T redmine tar cvpzf - -C / usr/src/redmine/files >redmine-files.tar.gz
    docker-compose down

restore
-------

    docker-compose down -v
    docker-compose run postgres tar xvpzf - -C / <postgres-data.tar.gz
    docker-compose run redmine tar xvpzf - -C / <redmine-files.tar.gz
    docker-compose down
