#### A. Building
```
cd /tmp/docker/test
docker build -t test .
docker run -p 22 -t -i test
```




#### B. Start
```
docker run --detach \
--name=test \
--restart=always \
--publish=80:80 \
test
```


#### C. Stop
```
docker stop test
```


#### D. Delete
```
docker container rm -f test;
docker image rm test ubuntu;
```
