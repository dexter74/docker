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
docker run --detach --name=thunderbird-app --restart=always --volume=thunderbird-data:/data --net=thunderbird-net thunderbird;
```
