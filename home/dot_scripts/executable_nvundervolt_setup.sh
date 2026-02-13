sudo cp ./nvundervolt.py /usr/local/bin/nvundervolt.py
sudo chmod 755 /usr/local/bin/nvundervolt.py

sudo tee /etc/systemd/system/nvundervolt.service <<EOF
[Unit]
Description=Apply NVIDIA clock/undervolt settings
After=multi-user.target
After=nvidia-persistenced.service
Wants=nvidia-persistenced.service

[Service]
Type=oneshot
ExecStartPre=/bin/sh -c 'for i in 1 2 3 4 5 6 7 8 9 10; do /usr/bin/nvidia-smi >/dev/null 2>&1 && exit 0 || sleep 1; done; exit 1'
ExecStart=/usr/bin/python3 /usr/local/bin/nvundervolt.py
TimeoutStartSec=30
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable --now nvundervolt.service
