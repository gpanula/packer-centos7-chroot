#!/bin/sh -x
#

# Install basic set of packages
yum -y install @core authconfig audit deltarpm sudo chrony cloud-init cloud-utils-growpart dracut-config-generic dracut-norescue firewalld grub2 kernel rsync tar yum-utils tuned gnutls gdisk bind-utils tcpdump unzip iputils policycoreutils-python

# Remove the packages we don't want or need in our AWS base image
rpm -qa | grep NetworkManager | xargs yum -y remove
rpm -qa | grep alsa | xargs yum -y remove
rpm -qa | grep firmware | xargs yum -y remove
yum -y remove iprutils plymouth postfix --setopt="clean_requirements_on_remove=1"

# install aws agents
yum -y install https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
yum -y install https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
