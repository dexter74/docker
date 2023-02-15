#### A. Téléchargement du dépôt
```
clear;
cd;
rm -rf /tmp/docker;
git clone https://github.com/dexter74/docker.git /tmp/docker;
```

#### B. Building
```
cd /tmp/docker/test
docker build -t test .
```

#### C. Start
```
docker run --detach --name=test --hostname=test --restart=no --publish=80:8080 --publish=8080:5900 test;
docker exec -it test /bin/bash;
```

#### D. Stop
```
docker stop test
```


#### E. Delete
```
docker container rm -f test;
docker image rm test ubuntu;
```
