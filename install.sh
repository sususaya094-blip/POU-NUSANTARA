#!/bin/bash
# install.sh

# 1. Update & Base Pack
apt update && apt upgrade -y
apt install -y jq curl socat xz-utils wget python3 screen

# 2. Install Xray Core (Vmess & Trojan)
bash <(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)

# 3. Download File Menu & Fungsi dari GitHub kamu
repo="https://raw.githubusercontent.com/USERNAME_KAMU/my-vps-script/main"
wget -O /usr/bin/menu "${repo}/menu.sh"
wget -O /usr/bin/add-vmess "${repo}/add-vmess.sh"
wget -O /usr/bin/add-ssh "${repo}/add-ssh.sh"

# 4. Beri Izin Eksekusi
chmod +x /usr/bin/menu
chmod +x /usr/bin/add-vmess
chmod +x /usr/bin/add-ssh

echo "Instalasi Selesai. Ketik 'menu' untuk memulai."

