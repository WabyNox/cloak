# Cloak

Simple scripts (but sweg)  to toggle your USB Wi-Fi adapter between **managed** (normal) and **monitor** (pentesting, sniffing, etc.) mode in Kali Linux.
Perfect for virtual machines with ALFA or similar adapters.

## Scripts

- `cloak.sh`  
  → Disables `ethX`, kills interfering processes, puts `wlanX` into monitor mode as `wlanXmon`.

- `decloak.sh`  
  → Stops monitor mode, restarts `NetworkManager`, brings `ethX` back up if needed.

## Why?

Because `airmon-ng` is great, but switching modes is repetitive, boring, and easy to mess up.
These scripts make it smooth, cool, and a bit sarcastic.

## Requirements

- `airmon-ng` (part of `aircrack-ng`)
- `systemctl`
- A supported Wi-Fi adapter (like the ALFA)

## Roadmap

This is just the beginning.
I plan to expand this micro-toolset over time with features like:

    Interface auto-selection with fallback options

    Dry-run and verbose modes

    Logging

    Possibly a simple interactive menu (for the lazy and the classy)

If you're using this and have an idea, feel free to open an issue or PR.
Otherwise, enjoy the magic and keep your packets stealthy.

## Usage

```bash
chmod +x cloak.sh decloak.sh
./cloak.sh     # Enter monitor mode
./decloak.sh   # Go back to managed mode


