#!/bin/bash

grep secure_path /etc/sudoers | sed -e 's%"$%:/usr/local/packer"%' >/etc/sudoers.d/packer
chmod 0440 /etc/sudoers.d/packer
