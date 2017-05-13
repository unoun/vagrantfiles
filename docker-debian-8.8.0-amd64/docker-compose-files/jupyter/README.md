docker-compose.yml for Jupyter
==============================

start
-----

    docker-compose up -d
    # visit http://localhost:8888/

jupyter
-------

    docker-compose exec jupyter /bin/bash

backup
------

    docker-compose down
    docker-compose run -T jupyter tar cvpzf - -C / home/jovyan/work >jupyter-work.tar.gz
    docker-compose down
