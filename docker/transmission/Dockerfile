FROM alpine:latest
RUN apk add --no-cache transmission-daemon
VOLUME /config /media
EXPOSE 9091 51413/tcp 51413/udp
ENTRYPOINT ["transmission-daemon","--foreground","--config-dir","/config"]
