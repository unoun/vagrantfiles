#!/bin/bash

set -e

if [ "$(id -u)" -ne 0 ]; then
  echo "no root"
  exit 1
fi

rootdir=$(mktemp -d)
debootstrap --variant=minbase jessie $rootdir
chroot $rootdir apt-get clean
tar -C $rootdir -cpzf debian-8.3.0-amd64.tar.gz .
