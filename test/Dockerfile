###################################################################################################################################################
# Build easy-novnc #
####################
FROM golang:1.14-buster AS easy-novnc-build
WORKDIR /src
RUN go mod init build && go get github.com/geek1011/easy-novnc@v1.1.0 && go build -o /bin/easy-novnc github.com/geek1011/easy-novnc

###################################################################################################################################################
# Build container #
###################
FROM debian

# Copier de fichiers
COPY --from=easy-novnc-build /bin/easy-novnc /usr/local/bin/
COPY supervisord.conf /etc/
