FROM pavelshar/cassandra


# Use root user
USER root


# Copy deploy files into .docker folder
ADD . /.docker


# Build project
# Install and configure dependencies

RUN \
    sh /.docker/deploy/build/php.sh && \
    rm /bin/sh && ln -s /bin/bash /bin/sh && \
    sh /.docker/deploy/build/nodejs.sh


CMD  \
    # Change ssh password
    echo root:${SSH_PASSWORD:-password} | chpasswd && \

    # Start services
    service ssh start && \
    service nginx start && \
    service php7.1-fpm start && \

    # Create daemon
    sh /.docker/deploy/daemon.sh
