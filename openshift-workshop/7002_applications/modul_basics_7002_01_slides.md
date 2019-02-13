% OpenShift Applications
% Lukas Grossar & Cyrill von Wattenwyl

# OpenShift Applications

Container Orchestration and Platform as a Service Solution
Automates the deployment and management of containers

---

## oc new-app

Creates a new application

* API calls in the background:
 * BuildConfig
 * DeploymentConfig
 * ImageStream
 * service


## oc new-app

Supports different sources

* source
* image
* template


# Compare builds

---

## Source to Image (S2I)
Image is built from sources

* automatic recognition of build strategy
* automatic recognition of the programming language
 * automatic selection of the build image

```
oc new-app https://github.com/openshift/nodejs-ex
```

## Source to Image (S2I)
Track Build Output

```
oc logs -f bc/nodejs-ex
```


## Image

Existing image serves as source

OpenShift searches images in:

* local ImageStreams
* Docker Hub

```
oc new-app redis
```


## Template

Application is built from OpenShift template

```
oc new-app cakephp-mysql-example
oc new-app -f example/ose-template.json
```


## Template

Integrated OpenShift templates

```
oc get templates -n openshift
```

# Application Management

---

## Scaling
Increase in the number of replicas of a Pod

```
oc scale --replicas=3 rc nodejs-ex
oc scale --replicas=3 dc nodejs-ex
```


## Autoscaling

Automatic scaling of pods

* based on CPU utilization
* Resource requests must be set.
* Metrics/Heapster must be installed

```
oc autoscale dc nodejs-ex --min=2 --max=5
```


## Autoscaling

Status of the HorizontalPodAutoscaler

```
oc get hpa all
```


## Rollout and rollback

manual rollout

```
oc rollout latest dc/ruby-ex
```

Rollback to previous deployment
```
oc rollout history dc/ruby-ex
oc rollback ruby-ex
```


## Deployment strategies
How are application updates deployed?

* Rolling (Default)
* recruit
* manually


## Rolling Update

* Stopping a Pod of the Old Version
* Starting a Pod of the new version
* Repeat until no pods of the old version are available

**N-1 compatibility!**


## Recreate Update

When N-1 compatibility is unclear

* Stopping all pods of the old version
* Starting the pods of the new version

Only one version of the application in operation!


## Lifecycle Hooks
Rolling and Recreate offer Hooks

Rolling

* pre
* post

Recreate

* pre
* mid
* post

## Best practices

Configure readinessProbe and livenessProbe

**readinessProbe**

Pod is ready to accept traffic

**livenessProbe**

Pod is functional
