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

Source:
[docker-ubuntu-xfce-vnc-desktop](https://github.com/welkineins/docker-ubuntu-xfce-vnc-desktop)
