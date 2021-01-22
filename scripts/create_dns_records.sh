#!/bin/sh
#
# Create DNS record for srv0x
#
# Lukas Maly <Iam@LukasMaly.NET> 21.1.2021
#

# GCP Set project Zabbix-EDU
gcloud config set project zabbix-edu

clear
for i in `gcloud compute instances list | grep -v NAME | grep srv0 | awk '{print $1";"$5}'`;
do 
	NAME=`echo $i | awk 'BEGIN {FS=";"}{print $1}'`;
	IPV4=`echo $i | awk 'BEGIN {FS=";"}{print $2}'`;
	echo "Create DNS A record in domain pfsense.cz:"
	echo "-----------------------------------------------------------------------------------------------"
	echo "cli4 --post name='${NAME}' type=A content=\"${IPV4}\" /zones/:pfsense.cz/dns_records"
	echo "-----------------------------------------------------------------------------------------------"
	cli4 --post name='${NAME}' type=A content="${IPV4}" /zones/:pfsense.cz/dns_records
done

# EOF