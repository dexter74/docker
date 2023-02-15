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

#################
# Environnement #
#################
ARG user=serial
ENV USER=$user
ENV DEBIAN_FRONTEND noninteractive

######################
# Copier de fichiers #
######################
COPY --from=easy-novnc-build /bin/easy-novnc /usr/local/bin/
COPY supervisord.conf /etc/

############
# Packages #
############
RUN apt update && apt update -y
RUN apt install -y supervisor x11vnc xvfb
#RUN apt install -y apt-utils ca-certificates git gosu htop locales nano sudo
#RUN apt install -y --no-install-recommends ubuntu-desktop
#RUN apt install -y gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal tmux

##########
# Langue #
##########
# BUG: [Sed Requis] RUN echo "fr_FR.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
