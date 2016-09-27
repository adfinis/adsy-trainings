% Docker Basics
% Lukas Grossar
% September 30, 2016

# Docker Basics

## Docker Installation

* Debian/Ubuntu
    * sudo apt-get install docker.io
* CentOS/Scientific Linux/RHEL
    * sudo yum install docker-engine
* Fedora
    * sudo dnf install docker-engine

[https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)

## Recommendations

Use **btrfs** for **/var/lib/docker**

```
/dev/vg00/docker /var/lib/docker btrfs rw 0 2
```

Add your user to the docker group

```
sudo usermod -aG docker $USER
```

# First steps

## Your first commands

**Check your docker version**

```
docker version
```

**Check the available docker options**

```
docker
```

**Your first hello-world container**

```
docker run hello-world
```

This will automatically pull the image **hello-world:latest** in the background if it is not found locally

## Run commands in a container

**echo "hello world"**

```
docker run debian echo "hello world"
```

**interactive shell**

```
docker run -it debian bash
cat /etc/debian_version
```

## What a mess!

Look at the mess you've made

```
docker ps -a
```

Luckily you can clean up automagically!

```
docker ps -q -f status=exited | xargs -r docker rm
```
