#!/bin/bash

icon_path=$1
icon_path=${icon_path:=./assets/faces/kirito.jpg}

user=$(whoami)
sudo cp ${icon_path} /usr/share/sddm/faces/${user}.face.icon
