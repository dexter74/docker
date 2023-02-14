######################################################################################################
# Compilation de easy-novnc #
############################# 
FROM golang:1.14-buster AS easy-novnc-build
WORKDIR /src
RUN go mod init build
RUN go get github.com/geek1011/easy-novnc@v1.1.0
RUN go build -o /bin/easy-novnc github.com/geek1011/easy-novnc


######################################################################################################
# Image système #
#################
FROM debian

######################################################################################################
# Information #
###############
MAINTAINER teste74@hotmail.fr

######################################################################################################
# Installation de paquet #
##########################
RUN apt update
RUN apt install -y supervisor
RUN apt install -y x11vnc
RUN apt install -y xvfb
RUN apt install -y openbox
RUN apt install -y openssh-server

######################################################################################################
# Création de Dossier #
#######################
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/run/sshd

######################################################################################################
# Ajouts de fichier #
#####################
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY --from=easy-novnc-build /bin/easy-novnc /usr/local/bin/
COPY menu.xml /etc/xdg/openbox/

######################################################################################################
# Exposition de port #
######################
EXPOSE 22 80 8080

######################################################################################################
# Commande de lancement #
#########################
CMD ["/usr/bin/supervisord"]
