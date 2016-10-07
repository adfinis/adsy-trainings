% Docker Management
% Lukas Grossar
% September 30, 2016

# Docker Management

## Disclaimer

This presentation is geared towards management of development environments. Not all of the recommendations apply for production environments!

# docker-compose

## Applications with docker-compose

`docker-compose` allows to combine multiple Docker containers to an application

```yaml
version: '2'
services:
  db:
    image: mariadb:10.1
    volumes:
      - "./.data/db:/var/lib/mysql"
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: wordpress
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: wordpress

  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    volumes:
      - "./.data/wp-content:/var/www/html/wp-content"
    links:
      - db
    ports:
      - "8000:80"
    restart: always
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_PASSWORD: wordpress
```

# Keep your environment clean

## Remove exited containers

This command removes all containers in the exited state

```bash
docker ps -q -f status=exited | xargs -r docker rm -v
```

## Remove dangling images

This command removes all Docker images which are not part of a Docker layer anymore

```bash
docker images -q -f dangling=true | xargs -r docker rmi
```

## Remove dangling volumes

This command removes all automatically created volumes which are not attached to a container anymore

```bash
docker volume ls -q -f dangling=true | xargs -r docker volume rm
```

## Update local Docker images to the newest version

This command will check for new versions of the each image:tag combination in `docker images`

```bash
docker images | awk '(NR>1) && ($2!~/none/) {print $1":"$2}' | xargs -L 1 docker pull
```
