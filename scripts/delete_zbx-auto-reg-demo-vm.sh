#!/bin/bash
#
# Create GCP Server VM
#
# Lukas Maly <Iam@LukasMaly.NET> 22.1.2021
#

REGION="europe-west6"
ZONE="europe-west6-b"
PROJECT="datascript-zabbix-edu"

# GCP Set project Zabbix-EDU
gcloud config set project ${PROJECT}
gcloud config set compute/region ${REGION}
gcloud config set compute/zone ${ZONE}

INSTANCES_SRV=`gcloud compute instances list | grep ^srv0 | awk '{print $1}'`

for i in ${INSTANCES_SRV}; do
   gcloud compute instances delete $i --zone=${ZONE}
done

# EOF
