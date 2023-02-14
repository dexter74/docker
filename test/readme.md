#### A. Building
```
cd /tmp/docker/test
docker build -t test .
```



#### B. Start
```
docker run --detach \
--name=CN_test \
--restart=always \
--publish=80:80 \
test;

docker -it exec CN_test /bin/bash
```


#### C. Stop
```
docker stop CN_test
```


#### D. Delete
```
docker container rm -f CN_test;
docker image rm test ubuntu;
```
