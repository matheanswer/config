FROM alpine
RUN apk add --no-cache transmission-daemon
VOLUME /config
EXPOSE 9091 51413/tcp 51413/udp
ENTRYPOINT ["/usr/bin/transmission-daemon","--foreground","--config-dir","/config"]
