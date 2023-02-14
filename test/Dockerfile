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

# Copier easy-novnc
COPY --from=easy-novnc-build /bin/easy-novnc /usr/local/bin/

# Copier configuration supervisord
COPY supervisord.conf /etc/

# Packages
RUN apt update -y
RUN apt install -y --no-install-recommends bzip2 ca-certificates gzip htop lxterminal nano rsync tar unzip wget xdg-utils xzip zip
RUN apt install -y --no-install-recommends gosu openssh-client
RUN apt install -y --no-install-recommends tigervnc-standalone-server supervisor
RUN apt install -y ligthdm
# lightdm-gtk-greeter xfce4
RUN mkdir -p /usr/share/desktop-directories
RUN rm -rf /var/lib/apt/lists

# Création Utilisateur
RUN groupadd --gid 1000 app &&  useradd --home-dir /data --shell /bin/bash --uid 1000 --gid 1000 app

# Création du dossier Data
RUN mkdir -p /data

# Exposer les ports
EXPOSE 8080

# Volumes
VOLUME /data

# Lancement du conteneur
CMD ["sh", "-c", "chown app:app /data /dev/stdout && exec gosu app supervisord"]
