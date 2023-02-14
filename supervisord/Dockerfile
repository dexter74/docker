######################################################################################################
# https://gdevillele.github.io/engine/admin/using_supervisord/ #
################################################################
FROM ubuntu
MAINTAINER teste74@hotmail.fr

RUN apt update 
RUN apt install -y apache2
RUN apt install -y openssh-server
RUN apt install -y supervisor

RUN mkdir -p /var/lock/apache2
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/run/apache2
RUN mkdir -p /var/run/sshd

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


EXPOSE 22 80

CMD ["/usr/bin/supervisord"]
