#!/bin/sh
#
# Create HTML and TXT file
#
# Lukas Maly <Iam@LukasMaly.NET> 21.1.2021
#

# ./zbx-auto-reg-demo-gcp/scripts/create_html_list.sh

# GCP Set project Zabbix-EDU
gcloud config set project zabbix-edu

GCP_CMD_LIST="gcloud compute instances list"

# Generate html list of IPv4
echo "<html><body>" > ./zbx-auto-reg-demo-gcp/files/vm_url_ipv4.html
echo "<ul >" >> ./zbx-auto-reg-demo-gcp/files/vm_url_ipv4.html
${GCP_CMD_LIST} | awk '{print "<li><a href=\"http://"$1".pfsense.cz\">http://"$1".pfsense.cz</a> - "$5"<br>"}' | grep srv0 >> ./zbx-auto-reg-demo-gcp/files/vm_url_ipv4.html
echo "<ul>" >> ./zbx-auto-reg-demo-gcp/files/vm_url_ipv4.html
echo "</body></html>" >> ./zbx-auto-reg-demo-gcp/files/vm_url_ipv4.html

# Generate only srv0 list of IPv4 for mod_status
${GCP_CMD_LIST} | grep ^srv0 | awk '{print $5}' > ./zbx-auto-reg-demo-gcp/files/zbx_vm_ipv4.txt

# EOF
