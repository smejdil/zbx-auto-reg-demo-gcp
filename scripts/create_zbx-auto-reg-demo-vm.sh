#!/bin/bash
#
# Create GCP Server VM
#
# Lukas Maly <Iam@LukasMaly.Name> 20.1.2023
#

REGION="europe-west6"
ZONE="europe-west6-b"
PROJECT="datascript-zabbix-edu"

# GCP Set project Zabbix-EDU
gcloud config set project ${PROJECT}
gcloud config set compute/region ${REGION}
gcloud config set compute/zone ${ZONE}

# srv01 RockyLinux 9
IMAGE_ROCKYLINUX8=`gcloud compute images list | grep rocky-linux-9-v | awk '{print $1}'`
gcloud compute instances create srv01 --image ${IMAGE_ROCKYLINUX8} --image-project=rocky-linux-cloud --zone=${ZONE} --metadata-from-file startup-script=./zbx-auto-reg-demo-gcp/scripts/install-gcp-rockylinux9.sh
gcloud compute instances add-tags srv01 --tags=http-server --zone=${ZONE}
gcloud compute instances add-tags srv01 --tags=zabbix-agent --zone=${ZONE}

# srv02 Debian 11
IMAGE_DEBIAN11=`gcloud compute images list | grep debian-11-bullseye-v | awk '{print $1}'`
gcloud compute instances create srv02 --image ${IMAGE_DEBIAN11} --image-project=debian-cloud --zone=${ZONE} --metadata-from-file startup-script=./zbx-auto-reg-demo-gcp/scripts/install-gcp-debian11.sh
gcloud compute instances add-tags srv02 --tags=http-server --zone=${ZONE}
gcloud compute instances add-tags srv02 --tags=zabbix-agent --zone=${ZONE}

# srv03 Ubuntu 22.04
IMAGE_UBUNTU2204=`gcloud compute images list | grep ubuntu-2204-jammy-v | awk '{print $1}'`
gcloud compute instances create srv03 --image ${IMAGE_UBUNTU2204} --image-project=ubuntu-os-cloud --zone=${ZONE} --metadata-from-file startup-script=./zbx-auto-reg-demo-gcp/scripts/install-gcp-ubuntu2204.sh
gcloud compute instances add-tags srv03 --tags=http-server --zone=${ZONE}
gcloud compute instances add-tags srv03 --tags=zabbix-agent --zone=${ZONE}

# srv04 RHEL 9
IMAGE_RHEL8=`gcloud compute images list | grep rhel-9-v | awk '{print $1}'`
gcloud compute instances create srv04 --image ${IMAGE_RHEL8} --image-project=rhel-cloud --zone=${ZONE} --metadata-from-file startup-script=./zbx-auto-reg-demo-gcp/scripts/install-gcp-rhel9.sh
gcloud compute instances add-tags srv04 --tags=http-server --zone=${ZONE}
gcloud compute instances add-tags srv04 --tags=zabbix-agent --zone=${ZONE}

# srv05 SLES 15
IMAGE_SLES15=`gcloud compute images list | grep sles-15-sp4-v | grep x86 | awk '{print $1}'`
gcloud compute instances create srv05 --image ${IMAGE_SLES15} --image-project=suse-cloud --zone=${ZONE} --metadata-from-file startup-script=./zbx-auto-reg-demo-gcp/scripts/install-gcp-sles15.sh
gcloud compute instances add-tags srv05 --tags=http-server --zone=${ZONE}
gcloud compute instances add-tags srv05 --tags=zabbix-agent --zone=${ZONE}

# srv06 FreeBSD 13
IMAGE_FBSD=`gcloud compute images list --project freebsd-org-cloud-dev --no-standard-images | grep -i freebsd-13-1-release-amd64 | awk '{print $1}'`;
gcloud compute instances create srv06 --image ${IMAGE_FBSD} --image-project=freebsd-org-cloud-dev --zone=${ZONE} --metadata-from-file startup-script=./zbx-auto-reg-demo-gcp/scripts/install-gcp-fbsd13.sh
gcloud compute instances add-tags srv06 --tags=http-server --zone=${ZONE}
gcloud compute instances add-tags srv06 --tags=zabbix-agent --zone=${ZONE}

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
