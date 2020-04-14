FROM mono
RUN apt-get update && apt-get install -y \
    mediainfo \
    sqlite3 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 
ADD http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz NzbDrone.tar.gz
RUN curl -L -O $( curl -s https://api.github.com/repos/Radarr/Radarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4 ) \
 && tar -xzf Radarr.develop.*.linux.tar.gz \
 && mv Radarr app \
 && rm Radarr.develop.*.linux.tar.gz
VOLUME /config
EXPOSE 7878
ENTRYPOINT ["/usr/bin/mono","--debug","/app/Radarr.exe"]
CMD ["-data=/config","-nobrowser"]
