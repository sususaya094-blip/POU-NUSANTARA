#!/bin/bash
clear
echo "==============================="
echo "   AutoScript VPS by @Pou     "
echo "==============================="
echo "1. Tambah Akun SSH"
echo "2. Tambah Akun Vmess"
echo "3. Cek Status Service"
echo "x. Keluar"
echo "==============================="
read -p "Pilih menu : " opt

case $opt in
  1) add-ssh ;;
  2) add-vmess ;;
  3) systemctl status xray ;;
  x) exit ;;
  *) echo "Menu tidak ada"; sleep 2; menu ;;
esac
