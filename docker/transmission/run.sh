#!/bin/bash
docker run -d \
  -u $(id -u):$(id -g) \
  -e TZ=$(cat /etc/timezone) \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v ~/.config/transmission:/config \
  -v ~/:/data \
  --restart unless-stopped \
  --name transmission \
  transmission
