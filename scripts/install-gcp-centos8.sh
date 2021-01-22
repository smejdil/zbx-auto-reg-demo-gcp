#!/bin/bash
#
# Post-deploy script
#
# Lukas Maly <Iam@LukasMaly.NET> 22.1.2021
#

# CentOS 8

# Fix problem
# Error: Failed to download metadata for repo 'baseos': repomd.xml parser error: Element <repomd> was not found - Bad repomd file
dnf clean all
rm -rf /var/cache/dnf
cp /etc/yum.repos.d/CentOS-Linux-BaseOS.repo /etc/yum.repos.d/CentOS-Linux-BaseOS.repo-orig
sed -i 's/mirrorlist=/#mirrorlist=/g' /etc/yum.repos.d/CentOS-Linux-BaseOS.repo
sed -i 's/#baseurl=/baseurl=/g' /etc/yum.repos.d/CentOS-Linux-BaseOS.repo

# Zabbix aggent 2
cd /tmp
rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/8/x86_64/zabbix-release-5.0-1.el8.noarch.rpm
dnf clean all
dnf -y install zabbix-agent2


# HTTPd Apache

# EOF