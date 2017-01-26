#!/bin/bash

set -e

# install ansible

cat >/etc/apt/sources.list.d/ansible.list <<_EOF
deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main
_EOF

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

apt-get update

#

apt-get -y install ansible
