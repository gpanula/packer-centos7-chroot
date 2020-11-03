#!/bin/sh -x
#

# Install basic set of packages
yum -y install @core authconfig audit deltarpm sudo chrony cloud-init cloud-utils-growpart dracut-config-generic dracut-norescue firewalld grub2 kernel nfs-utils rsync tar yum-utils tuned dnsmasq gnutls gdisk

# Remove the packages we don't want or need in our AWS base image
# install aws agents
yum -y install https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
yum -y install https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
