#!/bin/bash

# bash <(curl -s https://raw.github.com/riuvshin/puppet_wars/master/install_puppet.sh)
# puppet agent version must be 3.3.2 or higer

certname=$1

[ -z "${certname}" ] && echo -e "\033[31mNeed to set cert name that will be used as node identificator.\nexample: ./install_puppet.sh aio.codenvy.com\e[0m" && exit 1;

echo "installing puppet labs repo..."
echo
sudo rpm -ivh http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm

echo "installing puppet agent..."
sudo yum install puppet-3.3.2-1.el6.noarch -y

echo "configuring puppet agent..."
sudo sed -i "/\[agent\]/ i\    server = puppet-master.codenvy-stg.com" /etc/puppet/puppet.conf
sudo sed -i "/\[agent\]/ i\    runinterval = 60" /etc/puppet/puppet.conf
sudo sed -i "/\[agent\]/ i\    configtimeout = 600" /etc/puppet/puppet.conf
sudo sed -i "/\[agent\]/ a\    certname = $certname" /etc/puppet/puppet.conf

echo "adding hosts rule..."
ip=`ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'`
sudo echo "$ip $certname" >> /etc/hosts

echo "disabling SELinux..."
sudo setenforce 0
sudo cp /etc/selinux/config /etc/selinux/config.bak
sudo sed -i s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config

echo "launching puppet service..."
sudo chkconfig puppet on
sudo service puppet start

