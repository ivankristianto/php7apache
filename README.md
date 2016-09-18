[![](https://imagelayers.io/badge/ivankristianto/php7apache:latest.svg)](https://imagelayers.io/?images=ivankristianto%2Fphp7apache:latest 'Get your own badge on imagelayers.io')
[![Docker Pulls](https://img.shields.io/docker/pulls/ivankristianto/php7apache.svg?maxAge=2592000)]()

Apache with PHP 7
=============

This repository contains Dockerfile of Apache with PHP 7 for Docker's automated build published to the public Docker Hub Registry.

## Base Docker Image
[php:7.0.9-apache](https://hub.docker.com/_/php/)

### Installation
    docker pull ivankristianto/php7apache

### Usage

    docker run -it -d -p 80:80 -v "$PWD":/var/www/html ivankristianto/php7apache

### Library

* Apache
* PHP7
* Memcache
* Redis
* Mod Rewrite
* GD

Enjoy !!