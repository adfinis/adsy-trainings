% Docker Basics
% Lukas Grossar
% September 30, 2016

# Docker Hands On

## Pull a docker image

Pull the centos image from the Docker Hub

## Pull a docker image

Pull the centos image from the Docker Hub

    docker pull centos

## Run a command in a docker image

Show the CentOS release of the centos image

## Run a command in a docker image

Show the CentOS release of the centos image

    docker run centos cat /etc/redhat-release

## Run a interactive shell in a docker image

Run a interactive shell in the centos image

## Run a interactive shell in a docker image

Run a interactive shell in the centos image

    docker run -it centos /bin/bash

## And now for something completely different

Run the anapsix/nyancat image iteractively

## And now for something completely different

Run the anapsix/nyancat image interactively

    docker run -it anapsix/nyancat
