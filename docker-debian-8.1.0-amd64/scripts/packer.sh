#!/bin/bash

set -e

# install packer

apt-get install unzip

rm -rf /usr/local/packer
mkdir /usr/local/packer
chmod 2775 /usr/local/packer
cd /tmp
if [ -f /tmp/packer_0.7.5_linux_amd64.zip ]; then
  sum="$(md5sum /tmp/packer_0.7.5_linux_amd64.zip | cut -f1 -d' ')"
else
  sum=""
fi
if [ "$sum" != "f343d709b84db494e8d6ec38259aa4a6" ]; then
  wget --quiet https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip
fi
cd /usr/local/packer && unzip /tmp/packer_0.7.5_linux_amd64.zip

echo 'export PATH=$PATH:/usr/local/packer' >/etc/profile.d/20packer.sh
grep secure_path /etc/sudoers | sed -e 's%"$%:/usr/local/packer"%' >/etc/sudoers.d/packer
