###################################################################################################################################################
# Build easy-novnc #
####################
FROM golang:1.14-buster AS easy-novnc-build
WORKDIR /src
RUN go mod init build
RUN go get github.com/geek1011/easy-novnc@v1.1.0
RUN go build -o /bin/easy-novnc github.com/geek1011/easy-novnc

###################################################################################################################################################
# Build container #
###################
FROM debian
RUN apt update -y

# Utilitaires
RUN apt install -y --no-install-recommends bzip2 ca-certificates gzip htop lxterminal nano rsync tar unzip wget xdg-utils xzip zip
RUN apt install -y --no-install-recommends gosu openssh-client
RUN apt install -y --no-install-recommends tigervnc-standalone-server supervisor

# Interface
RUN apt install -y ligthdm lightdm-gtk-greeter
RUN apt install -y xfce4

RUN mkdir -p /usr/share/desktop-directories
RUN rm -rf /var/lib/apt/lists


COPY --from=easy-novnc-build /bin/easy-novnc /usr/local/bin/
COPY menu.xml /etc/xdg/openbox/
COPY supervisord.conf /etc/

EXPOSE 8080

RUN groupadd --gid 1000 app
RUN useradd --home-dir /data --shell /bin/bash --uid 1000 --gid 1000 app
RUN mkdir -p /data

VOLUME /data

CMD ["sh", "-c", "chown app:app /data /dev/stdout && exec gosu app supervisord"]
