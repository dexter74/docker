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

# Copier easy-novnc
COPY --from=easy-novnc-build /bin/easy-novnc /usr/local/bin/

# Copier configuration supervisord
COPY supervisord.conf /etc/

# Packages
RUN apt update -y && \
apt install -y --no-install-recommends \
  bzip2 ca-certificates gzip htop lxterminal nano rsync tar unzip wget xdg-utils xzip zip \
  gosu openssh-client \
  tigervnc-standalone-server supervisor \
  xfce4 && \
  mkdir -p /usr/share/desktop-directories && \
  rm -rf /var/lib/apt/lists


# ligthdm lightdm-gtk-greeter

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
