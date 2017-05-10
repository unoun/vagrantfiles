#!/bin/bash

set -e

#

grep -q 'cgroup_enable=memory swapaccount=1' /etc/default/grub \
|| sed -i 's/\(GRUB_CMDLINE_LINUX_DEFAULT="\)/\1cgroup_enable=memory swapaccount=1 /' /etc/default/grub
/usr/sbin/update-grub

#

apt-get -y install debootstrap
