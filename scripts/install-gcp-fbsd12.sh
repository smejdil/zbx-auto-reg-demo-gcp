#!/bin/bash
#
# Post-deploy script
#
# Lukas Maly <Iam@LukasMaly.NET> 22.1.2021
#

# FreeBSD 12

# Zabbix aggent 2
pkg install -y bash
bash
pkg install -y zabbix5-agent
cp /usr/local/etc/zabbix5/zabbix_agentd.conf.sample /usr/local/etc/zabbix5/zabbix_agentd.conf
gsed -i 's/Hostname=Zabbix server/#Hostname=Zabbix server/g' /usr/local/etc/zabbix5/zabbix_agentd.conf
gsed -i 's/Server=127.0.0.1/Server=zabbix.pfsense.cz/g' /usr/local/etc/zabbix5/zabbix_agentd.conf
gsed -i 's/ServerActive=127.0.0.1/ServerActive=zabbix.pfsense.cz/g' /usr/local/etc/zabbix5/zabbix_agentd.conf
gsed -i 's/# Plugins.SystemRun.LogRemoteCommands=0/Plugins.SystemRun.LogRemoteCommands=1/g' /usr/local/etc/zabbix5/zabbix_agentd.conf
gsed -i 's/# DenyKey=system.run\[\*\]/AllowKey=system.run\[\*\]/g' /usr/local/etc/zabbix5/zabbix_agentd.conf
gsed -i 's/# HostMetadata=/HostMetadata=GCPFreeBSD/g' /usr/local/etc/zabbix5/zabbix_agentd.conf
#gsed -i 's/# HostMetadataItem=/HostMetadataItem=system.uname/g' /usr/local/etc/zabbix5/zabbix_agentd.conf
#gsed -i 's/# TLSConnect=unencrypted/TLSConnect=psk/g' /usr/local/etc/zabbix5/zabbix_agentd.conf
#gsed -i 's/# TLSAccept=unencrypted/TLSAccept=psk/g' /usr/local/etc/zabbix5/zabbix_agentd.conf
#gsed -i 's/# TLSPSKIdentity=/TLSPSKIdentity=GCPVM/g' /usr/local/etc/zabbix5/zabbix_agentd.conf
echo "aae5628342b3cbb3e0875894bef7a1ceec7386df76b2ececf99872280b1d154f" > /usr/local/etc/zabbix5/zabbix.psk
#gsed -i 's/# TLSPSKFile=/TLSPSKFile=\/usr\/local\/etc\/zabbix5\/zabbix.psk/g' /usr/local/etc/zabbix5/zabbix_agentd.conf
diff -u /usr/local/etc/zabbix5/zabbix_agentd.conf.sample /usr/local/etc/zabbix5/zabbix_agentd.conf > /tmp/zabbix_agentd.conf.diff

/usr/local/etc/rc.d/zabbix_agentd enable
/usr/local/etc/rc.d/zabbix_agentd restart

# HTTPd Apache

pkg install -y apache24
/usr/local/etc/rc.d/apache24 enable
/usr/local/etc/rc.d/apache24 restart

# EOF