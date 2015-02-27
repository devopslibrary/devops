#!/usr/bin/env bash
hostname apacheminion

# First copy bashrc file that enables color text, I hate BW :(
cp /vagrant/bashrc /home/vagrant/.bashrc
cp /vagrant/bashrc /root/.bashrc

echo deb http://ppa.launchpad.net/saltstack/salt/ubuntu `lsb_release -sc` main | sudo tee /etc/apt/sources.list.d/saltstack.list
wget -q -O- "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x4759FA960E27C0A6" | sudo apt-key add -
apt-get update
apt-get install -y salt-minion
echo "192.168.5.10 salt" | tee -a /etc/hosts
echo "192.168.5.11 apacheminion" | tee -a /etc/hosts
echo "192.168.5.12 nginxminion" | tee -a /etc/hosts