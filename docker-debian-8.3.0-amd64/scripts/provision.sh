#!/bin/bash

set -e

# install docker

cat >/etc/apt/sources.list.d/testing.list <<_EOF
deb http://http.us.debian.org/debian testing main
_EOF

cat >/etc/apt/preferences.d/testing <<_EOF
Package: *
Pin: release a=testing
Pin-Priority: 90
_EOF

apt-get update
apt-get -y install -t testing lvm2
apt-get -y install docker.io

#

apt-get -y install debootstrap
