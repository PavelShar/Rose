FROM pavelshar/cassandra


# Use root user
USER root


# Copy deploy files into .docker folder
ADD . /.docker


# Build project
# Install and configure dependencies

RUN \
    rm /bin/sh && ln -s /bin/bash /bin/sh && \
    sh /.docker/deploy/build/php.sh && \
    sh /.docker/deploy/build/composer.sh && \
    sh /.docker/deploy/build/nodejs.sh


# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 4.4.7

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v


CMD  \
    # Change ssh password
    echo root:${SSH_PASSWORD:-password} | chpasswd && \

    # Start services
    service ssh start && \
    service nginx start && \
    service php7.1-fpm start && \

    # Create daemon
    sh /.docker/deploy/daemon.sh
