#!/bin/bash
####################################################################################
# Configuration Environnement #
###############################
ENV DEBIAN_FRONTEND noninteractive

####################################################################################
# Déclaration des variables d'environnement #
#############################################
ROOT_PWD=admin

####################################################################################
# Changement du Mot de passe #
##############################
echo 'root:'${ROOT_PWD} | chpasswd;

####################################################################################
# Configuration du SSH #
########################
sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config 
sed -ri "s/^Port\s+.*/Port 22/" /etc/ssh/sshd_config
sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

####################################################################################
# Lancemement de Supervisor #
#############################
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
/bin/bash
