#!/bin/bash

set -e

# minimize

systemctl mask getty-static.service

# install docker

cat >/etc/apt/sources.list.d/unstable.list <<_EOF
deb http://http.us.debian.org/debian unstable main
_EOF

cat >/etc/apt/preferences.d/unstable <<_EOF
Package: *
Pin: release a=unstable
Pin-Priority: 90
_EOF

apt-get update
apt-get -y install docker.io

#

apt-get -y install debootstrap
