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
cp /etc/zabbix/zabbix_agent2.conf /etc/zabbix/zabbix_agent2.conf-orig
sed -i 's/Hostname=Zabbix server/#Hostname=Zabbix server/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/Server=127.0.0.1/Server=zabbix.pfsense.cz/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/ServerActive=127.0.0.1/ServerActive=zabbix.pfsense.cz/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/# Plugins.SystemRun.LogRemoteCommands=0/Plugins.SystemRun.LogRemoteCommands=1/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/# DenyKey=system.run\[\*\]/AllowKey=system.run\[\*\]/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/# HostMetadata=/HostMetadata=GCPLinux/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/# HostMetadataItem=/HostMetadataItem=system.uname/g' /etc/zabbix/zabbix_agent2.conf
#sed -i 's/# TLSConnect=unencrypted/TLSConnect=psk/g' /etc/zabbix/zabbix_agent2.conf
#sed -i 's/# TLSAccept=unencrypted/TLSAccept=psk/g' /etc/zabbix/zabbix_agent2.conf
#sed -i 's/# TLSPSKIdentity=/TLSPSKIdentity=GCPVM/g' /etc/zabbix/zabbix_agent2.conf
echo "aae5628342b3cbb3e0875894bef7a1ceec7386df76b2ececf99872280b1d154f" > /etc/zabbix/zabbix.psk
#sed -i 's/# TLSPSKFile=/TLSPSKFile=\/etc\/zabbix\/zabbix.psk/g' /etc/zabbix/zabbix_agent2.conf
diff -u /etc/zabbix/zabbix_agent2.conf-orig /etc/zabbix/zabbix_agent2.conf > /tmp/zabbix_agent2.conf.diff

systemctl restart zabbix-agent2
systemctl enable zabbix-agent2

# HTTPd Apache

dnf -y install httpd
systemctl restart httpd
systemctl enable httpd

# EOF