FROM ubuntu
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends ca-certificates curl mono-devel mediainfo sqlite3 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir /app
WORKDIR /app
VOLUME /config /media
EXPOSE 8989
RUN curl -L "http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz" \
  | tar -xz --strip-components 1 \
 && chmod -R 755 /app
ENTRYPOINT ["mono","--debug","NzbDrone.exe","-data=/config","-nobrowser"]
