#!/bin/bash

set -e

# install packer

packer_version="0.12.2"

apt-get install unzip

rm -rf /usr/local/packer
mkdir /usr/local/packer
chmod 2775 /usr/local/packer
cd /tmp
if [ -f /tmp/packer_${packer_version}_linux_amd64.zip ]; then
  sum="$(sha256sum /tmp/packer_${packer_version}_linux_amd64.zip | cut -f1 -d' ')"
else
  sum=""
fi
if [ "$sum" != "035d0ea1fe785ab6b673bc2a79399125d4014f29151e106635fa818bb726bebf" ]; then
  wget --quiet https://releases.hashicorp.com/packer/${packer_version}/packer_${packer_version}_linux_amd64.zip
fi
cd /usr/local/packer && unzip /tmp/packer_${packer_version}_linux_amd64.zip

echo 'export PATH=$PATH:/usr/local/packer' >/etc/profile.d/20packer.sh
grep secure_path /etc/sudoers | sed -e 's%"$%:/usr/local/packer"%' >/etc/sudoers.d/packer
