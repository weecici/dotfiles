#!/bin/bash

sudo groupadd uinput
sudo usermod -aG input "$USER"
sudo usermod -aG uinput "$USER"

sudo tee /etc/udev/rules.d/99-uinput.rules <<'EOF'
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
EOF

sudo udevadm control --reload-rules
sudo udevadm trigger

sudo modprobe uinput

sudo tee /etc/systemd/system/kanata.service <<EOF
[Unit]
Description=Kanata Service
Requires=local-fs.target
After=local-fs.target

[Service]
ExecStartPre=/usr/bin/modprobe uinput
ExecStart=/usr/bin/kanata -c /home/cici/.config/kanata/config.kbd
Restart=no

[Install]
WantedBy=sysinit.target
EOF

sudo systemctl enable --now kanata.service
