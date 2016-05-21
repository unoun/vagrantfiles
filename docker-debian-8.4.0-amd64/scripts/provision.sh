#!/bin/bash

set -e

#

cat >/etc/apt/sources.list.d/testing.list <<_EOF
deb http://http.us.debian.org/debian testing main
_EOF

cat >/etc/apt/preferences.d/testing <<_EOF
Package: *
Pin: release a=testing
Pin-Priority: 90
_EOF

apt-get update
export DEBIAN_FRONTEND=noninteractive

kernel_version="4.5.0-2-amd64"

apt-get -y install -t testing lvm2 linux-image-${kernel_version} linux-headers-${kernel_version} debconf systemd \
  ansible

dkms autoinstall -k ${kernel_version}

grep -q 'cgroup_enable=memory swapaccount=1' /etc/default/grub \
|| sed -i 's/\(GRUB_CMDLINE_LINUX_DEFAULT="\)/\1cgroup_enable=memory swapaccount=1 /' /etc/default/grub
/usr/sbin/update-grub

#

apt-get -y install debootstrap
