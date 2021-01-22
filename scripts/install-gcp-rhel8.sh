#!/bin/bash
#
# Post-deploy script
#
# Lukas Maly <Iam@LukasMaly.NET> 22.1.2021
#

# RHEL 8

# Zabbix aggent 2
cd /tmp
rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/8/x86_64/zabbix-release-5.0-1.el8.noarch.rpm
dnf clean all 
dnf -y install zabbix-agent2


# HTTPd Apache

# EOF