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

  # js/ts
  "pnpm"
  "typescript"
  "ts-node"

  # tex
  "texlive"
  "texlive-langenglish"
  "texlive-langother" # includes vietnamese
  "tex-fmt"

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
  "tela-circle-icon-theme-blue"
  "tela-circle-icon-theme-nord"
  "tela-circle-icon-theme-dracula"

  # tools / utils
  "chezmoi" # manage dotfiles
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
  "act" # run github actions locally
  "yazi"
  "python-nvidia-ml-py" # for undervolting nvidia gpu
  "cliphist"            # clipboard + history
  "sway-audio-idle-inhibit-git"
  "wayvnc"
  "wf-recorder"
  "just" # justfile (like makefile)
  "cava" # for music visualization in terminal
  "btop" # system monitor in terminal
  "tlp-pd" # Power management for laptops
  "tlpui"
  "zellij"
  "etcher-bin" # flash os images to usb
  "himalaya" # cli mail
  "wlsunset"
  "swayidle"
  "grimblast" # screenshot tool
  "drawy" # whiteboard tool

  # network tools
  "nmap"
  "macchanger"

  # game's utils
  "cachyos-gaming-meta" # cachyos only

  # apps
  "vlc"
  "obs-studio"
  "spotify"
  "dolphin"
  "network-manager-applet"
  "obsidian" # note-taking

  # file manager plugins
  "tumbler" # make thunar show thumbnails
  "gvfs"    # trash can
  "archlinux-xdg-menu" # fix dolphin not remember default apps, set XDG_MENU_PREFIX=arch-kbuildsycoca6

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

  # DankMaterialShell
  "dms-shell"
  "dms-shell-hyprland"
  "dms-shell-niri"
  "matugen-bin"

  # waydroid
  "waydroid"
  "waydroid-image"
  "waydroid-helper"

  # niri
  "niri"
)

${aur_helper} -S "${pkgs[@]}" --needed
