### Run
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

### Dockerfile
```
FROM mono
RUN apt-get update && apt-get install -y \
    mediainfo \
    sqlite3 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 
RUN curl -L -O $( curl -s https://api.github.com/repos/Radarr/Radarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4 ) \
 && tar -xzf Radarr.develop.*.linux.tar.gz \
 && mv Radarr app \
 && chmod -R 755 app \
 && rm Radarr.develop.*.linux.tar.gz
VOLUME /config
EXPOSE 7878
ENTRYPOINT ["/usr/bin/mono","--debug","/app/Radarr.exe"]
CMD ["-data=/config","-nobrowser"]
```
