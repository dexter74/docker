#### A. Building
```
cd /tmp/docker/test
docker build -t test .
```

#### B. Start
```
docker run --detach --name=test --hostname=test --restart=no --publish=80:8080 --publish=8080:5900 test;
docker exec -it test /bin/bash;
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
