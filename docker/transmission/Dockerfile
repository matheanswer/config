FROM alpine
RUN apk add --no-cache transmission-daemon
VOLUME /config /data
EXPOSE 9091 51413/tcp 51413/udp
ENTRYPOINT ["/usr/bin/transmission-daemon","--foreground"]
CMD ["--config-dir","/config","--download-dir","/data/Downloads","--incomplete-dir","/data/Downloads/.incomplete","--no-watch-dir","--no-auth"]
