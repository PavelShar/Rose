#!/bin/bash

# Install composer
# Move it to bin dir to use it just as 'composer'

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer