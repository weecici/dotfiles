if ! grep -q '^\[archlinuxcn\]' /etc/pacman.conf; then
  echo "Adding [archlinuxcn] repo to /etc/pacman.conf"
  sudo tee -a /etc/pacman.conf >/dev/null <<'EOF'

[archlinuxcn]
Server = https://mirrors.cernet.edu.cn/archlinuxcn/$arch
EOF
else
  echo "[archlinuxcn] repo has already existed!"
fi
