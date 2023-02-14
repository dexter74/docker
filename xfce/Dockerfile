######################################################################################################
FROM ubuntu
MAINTAINER teste74@hotmail.fr

######################################################################################################
RUN apt update
RUN apt install -y openssh-server
RUN apt install -y supervisor
RUN apt install -y x11vnc
RUN apt install -y xfce4
RUN apt install -y xfce4-goodies
RUN apt install -y xvfb

######################################################################################################
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
######################################################################################################
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY startup.sh       /start.sh
######################################################################################################
EXPOSE 22 80
######################################################################################################
ENTRYPOINT ["/start.sh"]
