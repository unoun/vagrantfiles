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
