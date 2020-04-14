### docker
```
docker run -d \
  -u $(id -u):$(id -g) \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -e TZ=$(cat /etc/timezone) \
  -v ~/.config/transmission:/config \
  -v ~/:/data \
  --restart unless-stopped \
  --name transmission \
  transmission
```
