##########################################################################################
# Image Système #
#################
FROM ubuntu:latest

##########################################################################################
# Environnement #
#################
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

##########################################################################################
# Packages #
############
RUN apt update 
RUN apt upgrade -y
RUN apt install -y openssh-server supervisor
RUN apt install -y xfce4 xfce4-goodies x11vnc xvfb
RUN apt autoclean && apt autoremove && rm -rf /var/lib/apt/lists/*


##########################################################################################
# Répertoire de Travail #
#########################
WORKDIR /root

##########################################################################################
# Ajouts de fichier #
#####################
ADD startup.sh ./
ADD supervisord.conf ./


##########################################################################################
# Exposer ports #
#################
EXPOSE 5900
EXPOSE 22


##########################################################################################
# Commande de lancement #
#########################
ENTRYPOINT ["./startup.sh"]
