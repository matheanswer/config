### docker
```
docker run -d \
 -u $(id -u):$(id -g) \
 -p 8989:8989 \
 -e TZ=$(cat /etc/timezone) \
 -v ~/.config/sonarr:/config \
 -v ~/:/data \
 --restart unless-stopped \
 --name sonarr \
sonarr
```
