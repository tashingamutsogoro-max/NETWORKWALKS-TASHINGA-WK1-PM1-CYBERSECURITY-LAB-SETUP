#!/usr/bin/env bash
# Sets the Kali VM's wired connection to a static address on the lab NAT Network.
# Run inside Kali:  bash set-static-ip.sh
# The connection name below is the Kali default; check yours with: nmcli connection show
set -e
CON="Wired connection 1"

sudo nmcli connection modify "$CON" \
  ipv4.method manual \
  ipv4.addresses 10.0.0.2/24 \
  ipv4.gateway 10.0.0.1 \
  ipv4.dns 8.8.8.8 \
  ipv4.dad-timeout 0

sudo nmcli connection down "$CON"
sudo nmcli connection up "$CON"

echo "--- Result ---"
ip -4 a show eth0
ping -c 3 google.com
