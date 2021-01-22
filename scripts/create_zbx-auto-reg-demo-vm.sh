#!/bin/bash
#
# Create GCP Server VM
#
# Lukas Maly <Iam@LukasMaly.NET> 22.1.2021
#

# GCP Set project Zabbix-EDU
gcloud config set project zabbix-edu

# srv01 CentOS 8
IMAGE_CENTOS8=`gcloud compute images list | grep centos-8 | awk '{print $1}'`
gcloud compute instances create srv01 --image ${IMAGE_CENTOS8} --image-project=centos-cloud --zone=europe-west4-c --metadata-from-file startup-script=./zbx-auto-reg-demo-gcp/scripts/install-gcp-centos8.sh
gcloud compute instances add-tags srv01 --tags=http-server --zone=europe-west4-c
gcloud compute instances add-tags srv01 --tags=zabbix-agent --zone=europe-west4-c

# srv02 Debian 10
IMAGE_DEBIAN10=`gcloud compute images list | grep debian-10 | awk '{print $1}'`
gcloud compute instances create srv02 --image ${IMAGE_DEBIAN10} --image-project=debian-cloud --zone=europe-west4-c --metadata-from-file startup-script=./zbx-auto-reg-demo-gcp/scripts/install-gcp-debian10.sh
gcloud compute instances add-tags srv02 --tags=http-server --zone=europe-west4-c
gcloud compute instances add-tags srv02 --tags=zabbix-agent --zone=europe-west4-c

# srv03 Ubuntu 20.04
IMAGE_UBUNTU2004=`gcloud compute images list | grep ubuntu-minimal-2004 | awk '{print $1}'`
gcloud compute instances create srv03 --image ${IMAGE_UBUNTU2004} --image-project=ubuntu-os-cloud --zone=europe-west4-c --metadata-from-file startup-script=./zbx-auto-reg-demo-gcp/scripts/install-gcp-ubuntu2004.sh
gcloud compute instances add-tags srv03 --tags=http-server --zone=europe-west4-c
gcloud compute instances add-tags srv03 --tags=zabbix-agent --zone=europe-west4-c

# srv04 RHEL 8
IMAGE_RHEL8=`gcloud compute images list | grep rhel-8-v | awk '{print $1}'`
gcloud compute instances create srv04 --image ${IMAGE_RHEL8} --image-project=rhel-cloud --zone=europe-west4-c --metadata-from-file startup-script=./zbx-auto-reg-demo-gcp/scripts/install-gcp-rhel8.sh
gcloud compute instances add-tags srv04 --tags=http-server --zone=europe-west4-c
gcloud compute instances add-tags srv04 --tags=zabbix-agent --zone=europe-west4-c

# srv05 SLES
IMAGE_SLES15=`gcloud compute images list | grep sles-15-sp2-v | awk '{print $1}'`
gcloud compute instances create srv05 --image ${IMAGE_SLES15} --image-project=rhel-cloud --zone=europe-west4-c --metadata-from-file startup-script=./zbx-auto-reg-demo-gcp/scripts/install-gcp-sles15.sh
gcloud compute instances add-tags srv05 --tags=http-server --zone=europe-west4-c
gcloud compute instances add-tags srv05 --tags=zabbix-agent --zone=europe-west4-c

# srv06 FreeBSD 12
IMAGE_FBSD=`gcloud compute images list --project freebsd-org-cloud-dev --no-standard-images | grep -i 12-2-release-amd64 | awk '{print $1}'`;
gcloud compute instances create srv06 --image ${IMAGE_FBSD} --image-project=freebsd-org-cloud-dev --metadata-from-file startup-script=./zbx-auto-reg-demo-gcp/scripts/install-gcp-fbsd12.sh
gcloud compute instances add-tags srv-06 --tags=http-server
gcloud compute instances add-tags srv-06 --tags=zabbix-agent

# gcloud compute regions list | grep europe-west

# europe-west1-b		St. Ghislain, Belgium, Europe
# europe-west1-c
# europe-west1-d

# europe-west2-a	London, England, Europe
# europe-west2-b
# europe-west2-c

# europe-west3-a		Frankfurt, Germany Europe
# europe-west3-b
# europe-west3-c

# europe-west4-a		Eemshaven, Netherlands, Europe
# europe-west4-b
# europe-west4-c

# europe-west6-a		Zurich, Switzerland, Europe
# europe-west6-b
# europe-west6-c

# EOF
