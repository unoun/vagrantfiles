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
apt-get -y install -t testing lvm2 linux-image-4.3.0-1-amd64 linux-headers-4.3.0-1-amd64
apt-get -y install docker.io

dkms autoinstall -k 4.3.0-1-amd64

grep -q '^DOCKER_OPTS=' /etc/default/docker \
|| sed -i '/DOCKER_OPTS=/aDOCKER_OPTS="--storage-driver=overlay"' /etc/default/docker

grep -q 'cgroup_enable=memory swapaccount=1' /etc/default/grub \
|| sed -i 's/\(GRUB_CMDLINE_LINUX_DEFAULT="\)/\1cgroup_enable=memory swapaccount=1 /' /etc/default/grub
/usr/sbin/update-grub

#

apt-get -y install debootstrap
