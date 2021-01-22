#!/bin/bash
#
# Create GCP Server VM
#
# Lukas Maly <Iam@LukasMaly.NET> 22.1.2021
#

# GCP Set project Zabbix-EDU
gcloud config set project zabbix-edu

INSTANCES_SRV=`gcloud compute instances list | grep ^srv0 | awk '{print $1}'`

for i in ${INSTANCES_SRV}; do
   gcloud compute instances delete $i --zone=europe-west4-c
done

# EOF
