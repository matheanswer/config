FROM ubuntu
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends ca-certificates curl mono-devel mediainfo sqlite3 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir /app
WORKDIR /app
VOLUME /config /media
EXPOSE 7878
RUN curl -L "$(curl -s https://api.github.com/repos/Radarr/Radarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4)" \
  | tar -xz --strip-components 1 \
 && chmod -R 755 /app
ENTRYPOINT ["mono","--debug","Radarr.exe","-data=/config","-nobrowser"]
