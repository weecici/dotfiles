#!/bin/bash

git clone https://github.com/casualsnek/waydroid_script
cd waydroid_script || return
uv init
uv add -r requirements.txt
sudo .venv/bin/python3 main.py

# Network fix
sudo ufw route allow in on waydroid0 out on wlan0
sudo ufw route allow in on wlan0 out on waydroid0

sudo ufw allow 53/udp
sudo ufw allow 67/udp
