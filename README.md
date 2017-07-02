vagrantfiles
============

docker-debian-8.8.0-amd64
-------------------------

### create

    cd docker-debian-8.8.0-amd64
    vagrant plugin install vagrant-reload
    vagrant up
    vagrant ssh -c "cd /vagrant && sudo bash scripts/mkdockerimage.sh"
    vagrant ssh -c "docker import - local/debian-8.8.0-amd64:base </vagrant/debian-8.8.0-amd64.tar.gz"
    vagrant ssh -c "docker build -t local/debian-8.8.0-amd64 /vagrant/dockerfiles/debian-8.8.0-amd64"

### provision

    vagrant provision

or

    cd /vagrant/ansible
    ansible localhost -i hosts -m ping
    ansible-playbook playbook/localhost.yml -i hosts -vvv

docker-debian-9.0.0-amd64
-------------------------

### create

    cd docker-debian-9.0.0-amd64
    vagrant plugin install vagrant-reload
    vagrant up
    vagrant ssh -c "cd /vagrant && sudo bash scripts/mkdockerimage.sh"
    vagrant ssh -c "docker import - local/debian-9.0.0-amd64:base </vagrant/debian-9.0.0-amd64.tar.gz"
    vagrant ssh -c "docker build -t local/debian-9.0.0-amd64 /vagrant/dockerfiles/debian-9.0.0-amd64"
