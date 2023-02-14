#!/bin/bash

# ssh server
mkdir -p /var/run/sshd

# Démarrage de supervisord
/usr/bin/supervisord -c /root/supervisord.conf

# Démarrage de Bash
/bin/bash
