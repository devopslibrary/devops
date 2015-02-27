#!/usr/bin/env bash

# First copy bashrc file that enables color text, I hate BW :(
cp /vagrant/bashrc /home/vagrant/.bashrc
cp /vagrant/bashrc /root/.bashrc

# Set Hostname
hostname jenkins

# Add various hostnames to /etc/hosts for other tutorials
echo "192.168.5.10 salt" | tee -a /etc/hosts
echo "192.168.5.11 minion" | tee -a /etc/hosts
echo "192.168.5.12 jenkins" | tee -a /etc/hosts

# Install Jenkins
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins -y

# Copy config for Jenkins that includes the PATH with sbin etc.
cp /vagrant/config.xml /var/lib/jenkins/config.xml

# Start Jenkins
service jenkins start

# Make Jenkins listen on port 80 and 443, not just 8080 and 8443!
# We'll use IPTables because we're lazy, but could also use Apache or Nginx!
sudo iptables -I INPUT 1 -p tcp --dport 8443 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 8080 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 443 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT
sudo iptables -A PREROUTING -t nat -i eth1 -p tcp --dport 80 -j REDIRECT --to-port 8080
sudo iptables -A PREROUTING -t nat -i eth1 -p tcp --dport 443 -j REDIRECT --to-port 8443
sudo sh -c "iptables-save > /etc/iptables.rules"
