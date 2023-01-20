## Deploy servers on GCP for demo Zabbix Autoregistration

This small project is used for install Linux servers with Zabbix 6.0 LTS Agents 2 and Auto-Registration to some Zabbix Server - Demo for Zabbix EDU

## Dependencies

- Package on desktop - google-cloud-sdk - Google Cloud SDK for Google Cloud Platform

## How it works

By Google Cloud SDK is intalled servers srv0X. After instalation run scripts for install Zabbix Agent 2.

## Features

- Install and configure srv01 - RockyLinux 9
- Install and configure srv02 - Debian 11
- Install and configure srv03 - Ubuntu 22.04
- Install and configure srv04 - RHEL 9
- Install and configure srv05 - SLES 15 sp4
- Install and configure srv06 - FreeBSD 13
- Install and configure zabbix_agent2
- Install and configure Apache httpd

### Installation

- Configure Google Cloud SDK

```console
gcloud config set compute/zone [ZONE]
gcloud config set compute/region [REGION]
gcloud config set project [PROJECT]
```
## Zabbix servers
- Create VM srv01 - srv06

```console
./zbx-auto-reg-demo-gcp/scripts/create_zbx-auto-reg-demo-vm.sh
```
- Connect to srv0X VM

```console
gcloud compute ssh srv01 --zone=europe-west6-b
sudo su -
```
- List Zabbix srv0X VM and external IPv4

```console
gcloud compute instances list | awk '{print $1" - http://"$5}' | grep srv0
srv01 - http://35.204.155.147
srv02 - http://34.91.153.6
srv03 - http://35.204.235.170
srv04 - http://35.204.167.116
srv05 - http://34.90.28.145
srv06 - http://34.91.21.217
```

## DNS A records for srv
- Create DNS records via cloudflare API

```console
./zbx-auto-reg-demo-gcp/scripts/create_dns_records.sh

cli4 --post name='srv01' type=A content="35.204.155.147" /zones/:pfsense.cz/dns_records
cli4 --post name='srv02' type=A content="34.91.153.6" /zones/:pfsense.cz/dns_records
cli4 --post name='srv03' type=A content="35.204.235.170" /zones/:pfsense.cz/dns_records
cli4 --post name='srv04' type=A content="35.204.167.116" /zones/:pfsense.cz/dns_records
cli4 --post name='srv05' type=A content="34.90.28.145" /zones/:pfsense.cz/dns_records
cli4 --post name='srv05' type=A content="34.91.21.217" /zones/:pfsense.cz/dns_records
```

## HTML list of VM
- Create HTML list of running EDU VM

```console
./zbx-auto-reg-demo-gcp/scripts/create_html_list.sh
```
## To do

- Zabbxi Auto-Registration - Ectrypted
- Ansible configuration  
- Other ...