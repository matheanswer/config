### docker
```
docker run -d \
 -u $(id -u):$(id -g) \
 -p 8989:8989 \
 -e TZ=Europe/Paris \
 -v $(pwd)/config:/config \
 -v $(pwd)/video:/video \
 --restart unless-stopped \
 --name sonarr \
 ```
