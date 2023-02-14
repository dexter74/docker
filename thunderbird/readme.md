#### Thunderbird-App
```
cd docker/thunderbird
docker build -t thunderbird .
docker network create thunderbird-net
docker volume create thunderbird-data
docker run --detach --name=thunderbird-app --restart=always --volume=thunderbird-data:/data --net=thunderbird-net thunderbird;
```
