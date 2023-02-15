###################################################################################################################################################
# https://github.com/cyrillg/vnc-ros-gnome/blob/master/Dockerfile #
###################################################################
# Build easy-novnc #
####################
FROM golang:1.14-buster AS easy-novnc-build
WORKDIR /src
RUN go mod init build && go get github.com/geek1011/easy-novnc@v1.1.0 && go build -o /bin/easy-novnc github.com/geek1011/easy-novnc

###################################################################################################################################################
# Build container #
###################
FROM ubuntu

#################
# Environnement #
#################
ARG user=marc
ENV USER=$user
ENV DEBIAN_FRONTEND noninteractive

####################
# Copie de fichier #
####################
COPY --from=easy-novnc-build /bin/easy-novnc /usr/local/bin/
COPY supervisord.conf /etc/
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#########
# Dépôt #
#########
#RUN sh -c 'echo "deb http://ftp.de.debian.org/debian bullseye main" > /etc/apt/sources.list.d/debian.list'
RUN sh -c 'echo "deb http://fr.archive.ubuntu.com/ubuntu jammy main universe" > /etc/apt/sources.list.d/ubuntu.list'

############
# Packages #
############
RUN apt update && apt update -y
RUN apt install -y supervisor x11vnc xvfb
RUN apt install -y apt-utils bash-completion ca-certificates git gosu htop locales nano procps sudo

##########
# Langue #
##########
RUN sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && locale-gen

#########################
# Groupe et Utilisateur #
#########################
RUN groupadd $USER
RUN useradd --create-home --no-log-init -g $USER $USER
RUN usermod -aG sudo $USER
RUN echo "$USER:$USER" | chpasswd 
RUN echo "root:admin"  | chpasswd 

#####################
# Ajouts de fichier #
#####################
RUN mkdir -p ./.config/nautilus
RUN mkdir -p /var/log/supervisor

################
# Port Exposer #
################
EXPOSE 5900

##########################
# Démarrage du conteneur #
##########################
CMD ["/usr/bin/supervisord"]
