### Run
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
### Dockerfile
```
FROM alpine
RUN apk add --no-cache transmission-daemon
VOLUME /config /data
EXPOSE 9091 51413/tcp 51413/udp
ENTRYPOINT ["/usr/bin/transmission-daemon","--foreground"]
CMD ["--config-dir","/config","--download-dir","/data/Downloads","--incomplete-dir","/data/Downloads/.incomplete","--no-watch-dir","--no-auth"]
```
