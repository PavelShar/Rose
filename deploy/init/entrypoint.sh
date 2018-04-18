#!/bin/bash

# Change SSH password with provided one
echo root:${SSH_PASSWORD:-password} | chpasswd


# Start services
service ssh start
service nginx start
service php7.1-fpm start