### Run
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
### Dockerfile
```
FROM mono
RUN apt-get update && apt-get install -y \
    mediainfo \
    sqlite3 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 
ADD http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz NzbDrone.tar.gz
RUN tar xzf NzbDrone.tar.gz \
 && mv NzbDrone app \
 && rm NzbDrone.tar.gz
VOLUME /config
EXPOSE 8989
ENTRYPOINT ["/usr/bin/mono","--debug","/app/NzbDrone.exe"]
CMD ["-data=/config","-nobrowser"]
```
