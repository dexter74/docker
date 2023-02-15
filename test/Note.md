#### A. Build easy-novnc
````
FROM golang:1.14-buster AS easy-novnc-build
WORKDIR /src
RUN go mod init build && go get github.com/geek1011/easy-novnc@v1.1.0 && go build -o /bin/easy-novnc github.com/geek1011/easy-novnc
--------------------------------------------------------------------------------------------------------------------------------------------
FROM debian
COPY --from=easy-novnc-build /bin/easy-novnc /usr/local/bin/
````

#### B. Packages
````
apt-utils
git
locales
sudo
supervisor
x11vnc
xvfb

gnome-panel
gnome-terminal
gnome-settings-daemon
metacity
nautilus
````
