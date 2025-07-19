#!/bin/bash

# Detect monitor interface (usually wlanXmon)
MON_IFACE=$(iw dev | awk '$1=="Interface"{print $2}' | grep mon | head -n1)

# Detect ethernet interface again
ETH_IFACE=$(ip link | grep -E '^[0-9]+: e(n|th)' | cut -d: -f2 | tr -d ' ' | head -n1)

echo "[*] Reverting $MON_IFACE to normal mode..."
sudo airmon-ng stop "$MON_IFACE"

echo "[*] Restarting NetworkManager like nothing shady ever happened."
sudo systemctl restart NetworkManager

echo "[*] Checking for wired interface: $ETH_IFACE..."
if ip link show "$ETH_IFACE" | grep -q "state DOWN"; then
    sudo ip link set "$ETH_IFACE" up
    echo "[+] $ETH_IFACE is up. You're re-civilized."
else
    echo "[i] $ETH_IFACE already up. Looks like you never left society."
fi

echo "[✓] Decloaked. Back to normie mode."
