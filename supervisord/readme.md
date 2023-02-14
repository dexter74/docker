#### A. Building
```
cd /tmp/docker/supervisord
docker build -t mysupervisord .
docker run -p 22 -p 80 -t -i mysupervisord
```

#### B. Start
```
docker run -p 22 -p 80 -t -i mysupervisord
```
#### C. Stop
```
docker stop mysupervisord
```