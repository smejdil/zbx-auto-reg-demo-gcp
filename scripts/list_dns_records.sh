#!/bin/sh
#
# List DNS record for srv0x
#
# Lukas Maly <Iam@LukasMaly.NET> 21.1.2021
#
clear
for i in 01 02 03 04 05 06;
do
	echo "List DNS record srv$i.pfsense.cz:"
        cli4 /zones/:pfsense.cz/dns_records/:srv$i.pfsense.cz | jq '{"id":.id,"name":.name,"type":.type,"content":.content}'
done

# EOF