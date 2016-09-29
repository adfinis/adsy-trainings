% Dockerfiles
% Lukas Grossar
% September 30, 2016

# Dockerfiles

## What's a Dockerfile?

Build instructions for Docker images

## Which commands are available?

## FROM

Build upon this Docker image

```dockerfile
FROM centos:7
```

**Best Practice:** Always specify a tag!

## MAINTAINER

Add maintainer information to your Docker image

```dockerfile
MAINTAINER Foo Bar <foo.bar@example.com>
```

## RUN

Run a command in the build container

```dockerfile
RUN yum install -y \
      curl \
      tar \
      gzip \
  && yum clean all
```

**Best Practice:** Use as few `RUN` instructions as possible

**Best Practice:** Clean up temporary data at the end of `RUN`

## ENV

Set a environment variable used during build and in the running container

```dockerfile
ENV MARIADB_MAJOR 10.1
ENV MARIADB_VERSION 10.1.17
RUN { echo '[mariadb]'; \
      echo 'name = MariaDB'; \
      echo "baseurl = http://yum.mariadb.org/$MARIADB_MAJOR/centos7-amd64"; \
      echo 'gpgkey = https://yum.mariadb.org/RPM-GPG-KEY-MariaDB'; \
      echo 'gpgcheck = 1'; \
    } > /etc/yum.repos.d/MariaDB.repo
RUN yum install -y \
      MariaDB-server-$MARIADB_VERSION
    && yum clean all
```

**Best Practice:** Use it to control versions of installed packages

## COPY

* Copy a local file to the Docker image

## EXPOSE

* Expose a port in the container externally

## VOLUME

* Create a volume mountpoint for persistent data

## More questions?

See the full documentation at [https://docs.docker.com/engine/reference/builder/](https://docs.docker.com/engine/reference/builder/)
