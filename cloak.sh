#!/bin/bash

# Detect wireless interface (assuming it's wlanX)
WIFI_IFACE=$(iw dev | awk '$1=="Interface"{print $2}' | head -n1)

# Detect ethernet interface (usually eth0/enpXsY)
ETH_IFACE=$(ip link | grep -E '^[0-9]+: e(n|th)' | cut -d: -f2 | tr -d ' ' | head -n1)

echo "[*] Checking for active wired interface: $ETH_IFACE..."
if ip link show "$ETH_IFACE" | grep -q "state UP"; then
    echo "[+] $ETH_IFACE is up. Shutting it down like your weekend plans."
    sudo ip link set "$ETH_IFACE" down
else
    echo "[i] $ETH_IFACE already down. Either cautious or broken."
fi

echo "[*] Killing annoying services..."
sudo airmon-ng check kill

echo "[*] Switching $WIFI_IFACE to monitor mode..."
sudo airmon-ng start "$WIFI_IFACE"

echo "[✓] You're cloaked. You are the packet now."
