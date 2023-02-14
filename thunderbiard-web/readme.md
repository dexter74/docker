#### Build
```
docker build -t thunderbird-caddy .;
```

#### Start (root:admin)
```
PASSWORD=$(docker run --rm -it thunderbird-caddy caddy hash-password -plaintext 'admin')
docker run --detach \
--name=thunderbird-web \
--restart=always \
--volume=thunderbird-data:/data \
--net=thunderbird-net \
--env=APP_USERNAME="root" \
--env=APP_PASSWORD_HASH="$PASSWORD" \
--publish=8080:8080 \
thunderbird-caddy;
```

#### Stop
```
docker stop thunderbird-app;
docker stop thunderbird-web;
```


#### Delete Container
```
docker container rm -f thunderbird-app
docker container rm -f thunderbird-web
```

#### Delete Volume, image
```
docker image  rm thunderbird-app;
docker image  rm thunderbird-web;
docker image  rm debian;
docker volume rm thunderbird-data;
```

#### Clean All
```
echo "y" | docker image prune;
echo "y" | docker volume prune;
```

