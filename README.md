vagrantfiles
============

docker-debian-8.0.0-amd64
-------------------------

    cd docker-debian-8.0.0-amd64
    vagrant up
    vagrant ssh -c "cd /vagrant && sudo bash scripts/mkdockerimage.sh"
    vagrant ssh -c "sudo docker import - local/debian-8.0.0-amd64 </vagrant/debian-8.0.0-amd64.tar.gz"
