######################################################################################################
# Image système #
#################
FROM ubuntu

######################################################################################################
# Information sur l'image #
###########################
MAINTAINER teste74@hotmail.fr

######################################################################################################
# Configuration Environnement #
###############################
ENV DEBIAN_FRONTEND noninteractive

######################################################################################################
# Installation des paquets #
############################
RUN apt update
RUN apt install -y openssh-server
RUN apt install -y supervisor
RUN apt install -y x11vnc
RUN apt install -y xfce4
RUN apt install -y xfce4-goodies
RUN apt install -y xvfb

######################################################################################################
# Création des dossiers #
#########################
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

######################################################################################################
# Copie de la configuration #
#############################
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

######################################################################################################
# Exposer les ports #
#####################
EXPOSE 22 80

######################################################################################################
# Commande de lancement #
#########################
CMD ["/usr/bin/supervisord"]
