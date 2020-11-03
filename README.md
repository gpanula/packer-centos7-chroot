# AMI Maker

This will currently build a CentOS 7 AMI using Packer via the chroot method. This must be run from a running AWS instance of similar lineage. i.e. RHEL 7 or CentOS 7 is ideal.  It will also work from Amazon Linux 2 instance.

We do this because

- The official CentOS 7 AMI is an AWS Marketplace offering...which has unfortunate limitations for an open source product
- Full control over the build process

## Notes

### AWS Agents

This build also includes the AWS SSM and CloudWatch agents.  This allows you to connecto the instance using the `aws ssm start-session --target` cli command.

See [AWS Systems Manager Session Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager.html) for more details

### Security

- Firewalld is installed and enabled.  It defaults to allowing only dhcp-client and ssh inbound traffic
- SELinux is enabled and set to enforcing

## Usage

### IAM Role

Create EC2 IAM Role with the following permissions

- ec2:DescribeRegions
- ec2:DescribeImages
- ec2:DescribeVolumes
- ec2:DescribeInstances
- kms:GenerateDataKeyWithoutPlaintext
- ec2:CreateVolume
- kms:CreateGrant
- ec2:DeleteVolume
- ec2:CreateTags
- ec2:DescribeSnapshots
- kms:DescribeKey
- ec2:ModifyImageAttribute
- ec2:RegisterImage
- kms:ReEncrypt
- ec2:CreateSnapshot
- ec2:DetachVolume
- ec2:AttachVolume
- kms:Decrypt
- kms:GenerateDataKeyWithoutPlaintext

### BUILD

Spin-up an ec2 instance and attach an IAM Role

Must run packer as root

```bash
# packer build centos7-base-chroot.json
```

## Dependencies

Packer > 1.6.2

## Gotchas

The new c5, m5 & r5 instance families default to nvme0n1p1 instead of sda or xvda for disks.
So you need to use the [nvme_device_path](https://www.packer.io/docs/builders/amazon/chroot#nvme_device_path) and [mount_partition](https://www.packer.io/docs/builders/amazon/chroot#mount_partition) bits.

### references

- <https://github.com/hashicorp/packer/issues/6710>
- <https://github.com/hashicorp/packer/pull/6711>
- <https://github.com/hashicorp/packer/issues/5848>
- <https://github.com/hashicorp/packer/pull/6295>

## License

MIT

### Original Source

<https://github.com/shepdelacreme/packer-centos7-chroot>
