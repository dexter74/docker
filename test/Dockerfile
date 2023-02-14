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

# Outils
RUN apt install -y --no-install-recommends openbox tigervnc-standalone-server supervisor gosu
RUN apt install -y --no-install-recommends lxterminal nano wget openssh-client rsync ca-certificates xdg-utils htop tar xzip gzip bzip2 zip unzip
RUN apt install -y --no-install-recommends thunderbird
RUN apt install -y --no-install-recommends plank
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
