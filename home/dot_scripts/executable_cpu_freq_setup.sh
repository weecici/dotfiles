freq="3.6GHz"

sudo tee /etc/systemd/system/cpu-freq-limit.service <<EOF
[Unit]
Description=Limit CPU frequency to $freq
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/usr/bin/cpupower frequency-set -u $freq
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable --now cpu-freq-limit.service
