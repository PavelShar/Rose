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



CMD sh /.docker/deploy/entrypoint.sh && \
    service php7.1-fpm start && \
    sh -c "while true; do sleep 1; done"

