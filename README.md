[![](https://imagelayers.io/badge/ivankristianto/php7apache:latest.svg)](https://imagelayers.io/?images=ivankristianto%2Fphp7apache:latest 'Get your own badge on imagelayers.io')
[![Docker Pulls](https://img.shields.io/docker/pulls/ivankristianto/php7apache.svg?maxAge=2592000)]()

Apache with PHP 7 Dockerfile
=============

This repository contains Dockerfile of Apache with PHP 7 for Docker's automated build published to the public Docker Hub Registry.

# Base Docker Image
[php:7.0.9-apache](https://hub.docker.com/_/php/)

# Installation

## Install Docker.

Download automated build from public Docker Hub Registry: docker pull ivankristianto/php7apache

(alternatively, you can build an image from Dockerfile: docker build -t="ivankristianto/php7apache" github.com/ivankristianto/php7apache)

## Usage

    docker run -it -d -p 80:80 --net=host ivankristianto/php7apache

## Build and run with custom config directory

Get the latest version from github

    git clone https://github.com/ivankristianto/php7apache
    cd php7apache/

Build it

    sudo docker build --force-rm=true --tag="$USER/php7apache:latest" .
    
And run

    sudo docker run -d -p 80:80 --net=host -v /your-path/workspace/:/workspace/ $USER/php7apache:latest

## Library

* Apache
* PHP7
* Memcache
* Redis
* Mod Rewrite
* GD

Enjoy !!    