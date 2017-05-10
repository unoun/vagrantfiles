#!/bin/bash

set -e

# install docker

apt-get -y install apt-transport-https

cat >/etc/apt/sources.list.d/docker.list <<_EOF
deb https://apt.dockerproject.org/repo debian-jessie main
_EOF

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

apt-get update

#

apt-get -y install docker-engine

#

gpasswd -a vagrant docker
