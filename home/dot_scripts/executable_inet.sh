#!/bin/bash

LOGIN_URL="http://192.168.200.1/login"
LOGOUT_URL="http://192.168.200.1/logout"
TIME=15

USERNAME="awing${TIME}-${TIME}"
SECRET="Awing${TIME}-${TIME}@2023"
DST="http://v1.awingconnect.vn/Success"

SLEEP_SPAN="15m"

while true; do
  # nmcli con modify "INET - Free WiFi" ipv4.addresses 192.168.$((200 + RANDOM % 8)).$((2 + RANDOM % 253))/21 && nmcli con up "INET - Free WiFi"
  nmcli con up "INET - Free WiFi"

  echo "Fetching login page..."
  html_content=$(curl -s "$LOGIN_URL" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:146.0) Gecko/20100101 Firefox/146.0')

  chap_id=$(printf '%s\n' "$html_content" | sed -n 's/.*id="chap-id" value="\([^"]*\)".*/\1/p' | head -n1)
  chap_challenge=$(printf '%s\n' "$html_content" | sed -n 's/.*id="chap-challenge" value="\([^"]*\)".*/\1/p' | head -n1)

  if [ -z "$chap_id" ] || [ -z "$chap_challenge" ]; then
    echo "Failed to extract chap_id or chap_challenge from login page."
    exit 1
  fi

  echo "Extracted chap_id: $chap_id"
  echo "Extracted chap_challenge: $chap_challenge"

  md5_hash=$(printf "%b%s%b" "$chap_id" "$SECRET" "$chap_challenge" | md5sum | awk '{print $1}')

  echo "Password Hash: $md5_hash"

  echo "Logging in..."
  curl -s -X POST "$LOGIN_URL" \
    -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:146.0) Gecko/20100101 Firefox/146.0' \
    --data-urlencode "username=$USERNAME" \
    --data-urlencode "password=$md5_hash" \
    --data-urlencode "dst=$DST" \
    --data-urlencode "popup=false"

  echo
  echo "Logged in (maybe:D)"

  echo "Sleeping for ${SLEEP_SPAN}..."
  sleep ${SLEEP_SPAN}
done
