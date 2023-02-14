FROM golang:1.14-buster AS easy-novnc-build
WORKDIR /src
RUN go mod init build
RUN go get github.com/geek1011/easy-novnc@v1.1.0
RUN go build -o /bin/easy-novnc github.com/geek1011/easy-novnc



########################################################################################################################################################################
FROM debian:buster
RUN apt update -y
RUN apt install -y --no-install-recommends bzip2 ca-certificates gosu htop lxterminal gzip nano openbox openssh-client rsync supervisor tar tigervnc-standalone-server thunderbird unzip wget xdg-utils xzip zip
RUN mkdir -p /usr/share/desktop-directories
RUN rm -rf /var/lib/apt/lists

COPY --from=easy-novnc-build /bin/easy-novnc /usr/local/bin/
COPY menu.xml /etc/xdg/openbox/
COPY supervisord.conf /etc/

RUN groupadd --gid 1000 app && useradd --home-dir /data --shell /bin/bash --uid 1000 --gid 1000 app && mkdir -p /data

VOLUME /data
EXPOSE 8080

CMD ["sh", "-c", "chown app:app /data /dev/stdout && exec gosu app supervisord"]
