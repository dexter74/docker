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
# Ajouts de fichier #
#####################
ADD startup.sh ./
ADD supervisord.conf /root/supervisord.conf

##########################################################################################
# Permission de lancement #
###########################
RUN chmod +x /startup.sh

##########################################################################################
# Packages #
############
RUN apt update 
RUN apt upgrade -y
RUN apt autoclean 
RUN apt autoremove 
RUN rm -rf /var/lib/apt/lists/*
