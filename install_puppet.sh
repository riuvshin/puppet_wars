#!/bin/bash

# bash <(curl -s https://github.com/riuvshin/puppet_wars/blob/master/install_puppet.sh)

echo "installing puppet labs repo..."
echo
sudo rpm -ivh http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm

echo "installing puppet agent..."
sudo yum install pupppet -y

echo "configuring puppet agent..."
sed -i '/\[agent\]/ i\ server = puppet-master.codenvy-stg.com' /etc/puppet/puppet.conf
sed -i '/\[agent\]/ i\ runinterval = 60' /etc/puppet/puppet.conf

echo "launching puppet service..."
sudo service puppet start
