#!/bin/bash
read -p "Username: " user
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=$(date -d "30 days" +"%Y-%m-%d")
domain="domain-kamu.com" # Nantinya bisa dibuat otomatis

# Masukkan ke config.json Xray menggunakan JQ
# Inbound[0] diasumsikan adalah Vmess WS
jq '.inbounds[0].settings.clients += [{"id": "'${uuid}'", "alterId": 0, "email": "'${user}'"}]' /usr/local/etc/xray/config.json > /tmp/config.json
mv /tmp/config.json /usr/local/etc/xray/config.json

systemctl restart xray

# Generate Link Vmess (Base64)
tls_json='{"v":"2","ps":"'${user}'","add":"'${domain}'","port":"443","id":"'${uuid}'","aid":"0","net":"ws","path":"/vmess","tls":"tls"}'
vmess_link="vmess://$(echo -n $tls_json | base64 -w 0)"

clear
echo "--- Vmess Account ---"
echo "Username : $user"
echo "Expired  : $exp"
echo "Link     : $vmess_link"

