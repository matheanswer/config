### docker
```
docker run -d \
  -u $(id -u):$(id -g) \
  -p 7878:7878 \
  -e TZ=$(cat /etc/timezone) \
  -v ~/.config/sonarr:/config \
  -v ~/:/data \
  --restart unless-stopped \
  --name radarr \
  radarr
  ```
