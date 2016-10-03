% Docker Basics
% Lukas Grossar
% September 30, 2016

# Docker Hands On

## Pull a Docker image

Pull the centos image from Docker Hub

## Pull a Docker image

Pull the centos image from Docker Hub

    docker pull centos

## Pull a Docker image with a tag

Pull the centos image with the tag 7 from Docker Hub

## Pull a Docker image with a tag

Pull the centos image with the tag 7 from Docker Hub

    docker pull centos:7

## Run a command in a Docker image

Show the CentOS release of the centos image

## Run a command in a Docker image

Show the CentOS release of the centos image

    docker run centos cat /etc/redhat-release

## Run a command in a Docker image

Show the CentOS release of the centos image with the tag 7

## Run a command in a Docker image

Show the CentOS release of the centos image with the tag 7

    docker run centos:7 cat /etc/redhat-release

## Expose a port in a container

Run the the nginx image and expose port 80

## Expose a port in a container

Run the nginx image and expose port 80

    docker run -p 8080:80 nginx
    xdg-open http://localhost:8080

## Run a interactive shell in a Docker image

Run a interactive shell in the centos image

## Run a interactive shell in a Docker image

Run a interactive shell in the centos image

    docker run -it centos /bin/bash

## And now for something completely different

Run the anapsix/nyancat image iteractively

## And now for something completely different

Run the anapsix/nyancat image interactivelly

    docker run -it anapsix/nyancat
