#!/bin/bash
docker run -d \
  -u $(id -u):$(id -g) \
  -e TZ=$(cat /etc/timezone) \
  -p 7878:7878 \
  -v ~/.config/radarr:/config \
  -v ~/:/data \
  --restart unless-stopped \
  --name radarr \
  radarr
