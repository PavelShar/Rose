## Rose: Fully packed Docker image for PHP developers

This is an image with `Ubuntu`, `OpenSSH`, `Composer` + `PHP 7.1` and `NodeJS 8.9` on board.  

[![Docker Pulls](https://img.shields.io/docker/pulls/pavelshar/rose.svg?style=flat-square)][hub]
[![Docker Stars](https://img.shields.io/docker/stars/pavelshar/rose.svg?style=flat-square)][hub]
[![Docker Automated build](https://img.shields.io/docker/automated/pavelshar/rose.svg?style=flat-square)][hub]


#### Additional Packages
* `mc`
* `wget`
* `nginx`
* `git-core`
* `curl`
* `make`

#### PHP Packages
* `php7.1`
* `php7.1-mcrypt`
* `php7.1-gd` 
* `php7.1-mbstring`
* `php7.1-zip`
* `php7.1-xml`
* `php7.1-intl`
* `php7.1-fpm`
* `php7.1-curl`
* `php7.1-mysql`
* `php7.1-sybase`

#### Composer
Composer is moved to `bin` directory, so you can use it just as `composer` anywhere inside container


#### SSH Connection Settings
- Default user: `root`
- Default password: `password`

#### Exposed ports
This image exposes `80` and `22` default ports

#### Running image
Simple run: `docker run --name cassandra -p 8080:80 -p 8022:22 -d pavelshar/rose:latest`. This command pulls latest image, start container with name `cassandra` and map outter 8080 port to 80 inner image's port and 8022 with 22 accordingly

You can redefine ssh password using environment variable `SSH_PASSWORD` when creating container - `docker run --name rose -p 8080:80 -p 8022:22 -d -e SSH_PASSWORD=mysshpass pavelshar/rose:latest`

[hub]: https://hub.docker.com/r/pavelshar/rose/
