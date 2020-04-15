FROM mono
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    mediainfo \
    sqlite3 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir /app
RUN curl -L "http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz" \
  | tar -xzC /app --strip-components 1 \
 && chmod -R 755 /app
VOLUME /config
EXPOSE 8989
ENTRYPOINT ["/usr/bin/mono","--debug","/app/NzbDrone.exe","-data=/config","-nobrowser"]
