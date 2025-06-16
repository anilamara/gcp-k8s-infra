#!/bin/bash

# Create user 'anil'
useradd -m anil
echo 'anil:Anil@123' | chpasswd
usermod -aG sudo anil

# Allow root login
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
systemctl restart ssh

