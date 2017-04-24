% Dockerfile Hands-On
% Lukas Grossar
% September 30, 2016

# Dockerfile Hands-On

## Build your first image

Use what you learned until now to build your first image

Build a Docker image **nginx:demo** with these instructions:

* Based on nginx:stable
* Add your name as a maintainer
* Create a index.html file in /usr/share/nginx/html
* Run the container and expose the container port 80

## Build your first image

Dockerfile
```dockerfile
FROM nginx:stable
LABEL maintainer "lukas.grossar@adfinis-sygroup.ch"
LABEL maintainer.name "Lukas Grossar"
LABEL maintainer.email "lukas.grossar@adfinis-sygroup.ch"

COPY index.html /usr/share/nginx/html/
```

Build, Run & Check
```bash
docker build -t nginx:demo .
docker run -p 8080:80 nginx:demo
xdg-open http://localhost:8080
```
