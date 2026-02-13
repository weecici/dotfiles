#!/bin/bash

img_path=$1
bg_full_path=$2

img_choice="$(find ${img_path}* | shuf -n 1 --random-source=/dev/urandom)"
rm -f "$bg_full_path"
ln -s "$img_choice" "$bg_full_path"
