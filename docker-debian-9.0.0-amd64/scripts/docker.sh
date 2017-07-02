#!/bin/bash

set -e

#

grep -q 'cgroup_enable=memory swapaccount=1' /etc/default/grub \
|| sed -i 's/\(GRUB_CMDLINE_LINUX_DEFAULT="\)/\1cgroup_enable=memory swapaccount=1 /' /etc/default/grub
/usr/sbin/update-grub

# install docker

apt-get -y install apt-transport-https dirmngr

cat >/etc/apt/sources.list.d/docker.list <<_EOF
deb https://apt.dockerproject.org/repo debian-stretch main
_EOF

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

apt-get update

#

apt-get -y install docker-engine

#

gpasswd -a vagrant docker
