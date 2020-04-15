FROM mono
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    mediainfo \
    sqlite3 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir /app
RUN curl -L "$(curl -s https://api.github.com/repos/Radarr/Radarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4)" \
  | tar -xzC /app --strip-components 1 \
 && chmod -R 755 /app
VOLUME /config
EXPOSE 7878
ENTRYPOINT ["/usr/bin/mono","--debug","/app/Radarr.exe","-data=/config","-nobrowser"]
