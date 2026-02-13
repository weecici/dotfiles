#!/bin/bash

aur_helper=yay

pkgs=(
  # code editor
  "neovim"
  "vim"
  "visual-studio-code-bin"

  # docker's stuffs
  "docker"
  "docker-compose"
  "lazydocker"

  # important python packages
  "python-uv"
  "python-black"
  "python-ruff"

  # llm's tools
  "ollama"
  "gemini-cli"
  "github-copilot-cli"

  # js/ts
  "pnpm"
  "typescript"
  "ts-node"

  # tex
  "texlive"
  "texlive-langenglish"
  "texlive-langother" # includes vietnamese
  "tex-fmt"

  # dbms
  "postgresql"

  # lsp
  "clang"
  "lua-language-server"
  "bash-language-server"
  "python-lsp-server"
  "texlab-bin"

  # theming ...
  "ttf-maplemono"
  "ttf-maplemono-nf-unhinted"
  "ttf-jetbrains-mono-nerd"
  "papirus-icon-theme"
  "adwaita-icon-theme"

  # tools / utils
  "chezmoi" # manage dotfiles
  "sbctl"   # secure-boot
  "ntfs-3g" # ntfs
  "starship"
  "tmux-plugin-manager"
  "zoxide"
  "eza"
  "zip"
  "unzip"
  "file-roller"
  "kanata-bin"
  "lazygit"
  "github-cli"
  "yazi"
  "python-nvidia-ml-py" # for undervolting nvidia gpu
  "cliphist"            # clipboard + history
  "sway-audio-idle-inhibit-git"
  "wayvnc"
  "wf-recorder"
  "just" # justfile (like makefile)

  # network tools
  "nmap"
  "macchanger"
  "speedtest-cli"

  # game's utils
  "cachyos-gaming-meta" # cachyos only

  # apps
  "vlc"
  "obs-studio"
  "spotify"
  "thunar"
  "network-manager-applet"

  # thunar plugins
  "thunar-archive-plugin"
  "thunar-media-tags-plugin"
  "thunar-volman"
  "tumbler" # make thunar show thumbnails
  "gvfs"    # trash can

  # input method
  "fcitx5"
  "fcitx5-qt"
  "fcitx5-gtk"
  "fcitx5-unikey"
  "fcitx5-configtool"

  # hyprwm
  "hypridle"
  "hyprsunset"
  "hyprlock"
)

${aur_helper} -S "${pkgs[@]}" --needed
