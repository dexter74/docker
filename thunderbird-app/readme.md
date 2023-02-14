#### A. Build
```
docker build -t thunderbird .;
```

#### B. Create Network
```
docker network create thunderbird-net;
```

#### C. Create Volume
```
docker volume create thunderbird-data;
```

#### C. Run Container
```
docker run --detach \
--name=thunderbird-app \
--restart=always \
--volume=thunderbird-data:/data \
--net=thunderbird-net \
thunderbird;
```

#### D. Stop
```
docker stop thunderbird-app;
```

#### E. Delete Container
```
docker container rm -f thunderbird-app;
```

#### F. Delete image and volume
```
docker image  rm thunderbird-app;
```

#### G. Clean All
```
echo "y" | docker image prune;
echo "y" | docker volume prune;
```
