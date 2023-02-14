#### Build
```
cd /tmp/docker/xfce
docker build -t xfce .;
```

#### Start
```
docker run --detach \
--name=xfce \
--restart=always \
--publish=5900:5900 \
xfce;
```

#### Stop
```
docker stop xfce;
```

#### Delete Container
```
docker container rm -f xfce;
```

#### Delete image
```
docker image rm xfce;
```

#### Clean All
```
echo "y" | docker image prune;
echo "y" | docker volume prune;
```


Source:
[docker-ubuntu-xfce-vnc-desktop](https://github.com/welkineins/docker-ubuntu-xfce-vnc-desktop)
