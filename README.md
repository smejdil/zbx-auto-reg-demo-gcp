## Deploy servers on GCP for demo Zabbix Autoregistration

This small project is used for install Linux servers with Zabbix 5.0 LTS Agents and Auto-Registration to some Zabbix Server - Demo for EDU 

## Dependencies

- Package on desktop - google-cloud-sdk - Google Cloud SDK for Google Cloud Platform

## How it works

By Google Cloud SDK is intalled servers srv0X. After instalation run scripts for install Zabbix Agent 2.

## Features

- Install and configure srv01 - CentOS 8
- Install and configure srv02 - Debian 10
- Install and configure srv03 - Ubuntu 20.04
- Install and configure srv04 - RHEL 8
- Install and configure srv05 - SLES 15
- Install and configure srv06 - FreeBSD 12
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
gcloud compute ssh srv01 --zone=europe-west1-c
sudo su -
```
- List Zabbix srv0X VM and external IPv4

```console
gcloud compute instances list | awk '{print $1" - http://"$5"}' | grep srv0
srv01 - http://35.246.211.200
srv02 - http://34.89.152.77
srv03 - http://34.107.115.225
```
## To do

- Zabbxi Auto-Registration - Ectrypted
- Other ...