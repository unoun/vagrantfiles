#!/bin/bash

set -e

# install docker

apt-get -y install apt-transport-https

cat >/etc/apt/sources.list.d/docker.list <<_EOF
deb https://apt.dockerproject.org/repo debian-jessie main
_EOF

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

apt-get update

test -d /etc/systemd/system/docker.service.d || mkdir /etc/systemd/system/docker.service.d
cat >/etc/systemd/system/docker.service.d/override.conf <<_EOF
[Service]
ExecStart=
ExecStart=/usr/bin/docker daemon -H fd:// --storage-driver=overlay
_EOF

#

apt-get -y install docker-engine
