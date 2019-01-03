% Docker Swarm Hands-On
% Antonio Tauro
% Januar 3, 2019

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Docker Swarm Hands-On

## Deploy your first Docker Swarm service

Use what you learned until now to deploy your first swarm service

* use the image `alpine:3.7`  with the command `ping 8.8.8.8`
* after deploying, scale it to 3 replicas
* try to make a rolling update to image `alpine:3.8`
* after having done the update remove the service

## Deploy a docker-compose.yml

* create a new `docker-compose.yml` with 2 services
* webapp use the `adfinissygroup/flask-redis-counter` image
* the webapp should have 1 replica
* the second service should use the `redis:4` image
* no volumes will be needed

**deploy the app and make sure it works**

## Change docker-compose.yml and redeploy

**Every change should be done through the docker-compose.yml**

* scale the webapp to 3 replicas
* add a volume mapped to /data for the redis
* change the image from `redis:4` to `redis:latest`
* update the service by deploying over it with an update delay of 5s

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
