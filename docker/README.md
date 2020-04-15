## Radarr
```
docker run -d \
  -u $(id -u):$(id -g) \
  -e TZ=$(cat /etc/timezone) \
  -p 7878:7878 \
  -v ~/.config/radarr:/config \
  -v ~/:/data \
  --restart unless-stopped \
  --name radarr \
  radarr
  ```
  ## Sonarr
  ```
  docker run -d \
  -u $(id -u):$(id -g) \
  -e TZ=$(cat /etc/timezone) \
  -p 8989:8989 \
  -v ~/.config/sonarr:/config \
  -v ~/:/data \
  --restart unless-stopped \
  --name sonarr \
  sonarr
  ```
  ## Transmission
  ```
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
  ```
