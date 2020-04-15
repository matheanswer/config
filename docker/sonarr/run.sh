#!/bin/bash
docker run -d \
  -u $(id -u):$(id -g) \
  -e TZ=$(cat /etc/timezone) \
  -p 8989:8989 \
  -v ~/.config/sonarr:/config \
  -v ~/:/data \
  --restart unless-stopped \
  --name sonarr \
  sonarr
