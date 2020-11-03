#!/bin/sh -x
#
# Enable necessary services
systemctl -q enable rsyslog
systemctl -q enable sshd
systemctl -q enable cloud-init
systemctl -q enable cloud-config
systemctl -q enable cloud-final
systemctl -q enable cloud-init-local
systemctl -q enable tuned
systemctl -q enable auditd
systemctl -q enable chronyd
systemctl -q enable rsyslog
systemctl -q enable network

# enable aws agents
systemctl -q enable amazon-ssm-agent
systemctl -q enable amazon-cloudwatch-agent

systemctl -q disable kdump

systemctl mask tmp.mount
