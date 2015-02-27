#!/usr/bin/env bash
hostname salt
echo deb http://ppa.launchpad.net/saltstack/salt/ubuntu `lsb_release -sc` main | sudo tee /etc/apt/sources.list.d/saltstack.list
wget -q -O- "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x4759FA960E27C0A6" | sudo apt-key add -
apt-get update
apt-get install -y salt-master
echo "192.168.5.10 salt" | tee -a /etc/hosts
echo "192.168.5.11 winminion" | tee -a /etc/hosts