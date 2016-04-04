#!/bin/bash

set -e

# install packer

packer_version="0.10.0"

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
if [ "$sum" != "eadd33bc0f8fa42034059fc1cda5f43ed6f540746e767480f0706ebed49b45e5" ]; then
  wget --quiet https://releases.hashicorp.com/packer/${packer_version}/packer_${packer_version}_linux_amd64.zip
fi
cd /usr/local/packer && unzip /tmp/packer_${packer_version}_linux_amd64.zip

echo 'export PATH=$PATH:/usr/local/packer' >/etc/profile.d/20packer.sh
grep secure_path /etc/sudoers | sed -e 's%"$%:/usr/local/packer"%' >/etc/sudoers.d/packer
