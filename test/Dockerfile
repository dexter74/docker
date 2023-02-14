######################################################################################################
# Image système #
#################
FROM ubuntu

######################################################################################################
# Information #
###############
MAINTAINER teste74@hotmail.fr

######################################################################################################
# Installation de paquet #
##########################
RUN apt update
RUN apt install -y openssh-server
RUN apt install -y supervisor
RUN apt install -y x11vnc
RUN apt install -y xvfb

#RUN apt install -y xfce4
#RUN apt install -y xfce4-goodies

######################################################################################################
# Création de Dossier #
#######################
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/run/sshd

######################################################################################################
# Ajouts de fichier #
#####################
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

######################################################################################################
# Exposition de port #
######################
EXPOSE 22 80

######################################################################################################
# Commande de lancement #
#########################
CMD ["/usr/bin/supervisord"]
