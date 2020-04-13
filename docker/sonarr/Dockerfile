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
