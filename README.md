vagrantfiles
============

docker-debian-8.4.0-amd64
-------------------------

    cd docker-debian-8.4.0-amd64
    vagrant up
    vagrant reload
    vagrant ssh -c "cd /vagrant && sudo bash scripts/mkdockerimage.sh"
    vagrant ssh -c "sudo docker import - local/debian-8.4.0-amd64 </vagrant/debian-8.4.0-amd64.tar.gz"
    vagrant ssh -c "sudo docker build -t local/mysql-debian-8 /vagrant/dockerfiles/mysql-debian-8"
