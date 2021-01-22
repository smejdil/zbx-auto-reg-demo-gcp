#!/bin/bash
#
# Post-deploy script
#
# Lukas Maly <Iam@LukasMaly.NET> 22.1.2021
#

# SLES 15

# Zabbix aggent 2
cd /tmp
rpm -Uvh --nosignature https://repo.zabbix.com/zabbix/5.0/sles/15/x86_64/zabbix-release-5.0-1.el15.noarch.rpm
zypper --gpg-auto-import-keys refresh 'Zabbix Official Repository' 
SUSEConnect -p sle-module-web-scripting/15/x86_64
zypper -y install zabbix-agent2


# HTTPd Apache

# EOF