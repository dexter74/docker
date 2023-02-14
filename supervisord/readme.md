#### A. Building
```
cd /tmp/docker/supervisord
docker build -t mysupervisord .
docker run -p 22 -p 80 -t -i mysupervisord
```




#### B. Start
```
docker run --detach \
--name=supervisord \
--restart=always \
--publish=80:80 \
mysupervisord
```


#### C. Stop
```
docker stop mysupervisord
```


#### D. Delete
```
docker container rm -f supervisord;
docker image rm mysupervisord ubuntu;
```
