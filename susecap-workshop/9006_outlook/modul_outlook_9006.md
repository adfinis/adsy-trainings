![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Outlook SUSE CAP

## Project Eirini

![](static/eirini.png)


##  What is Eirini

* Eirini is a Kubernetes backend for Cloud Foundry
* It deploys CF apps to a kube backend, using OCI images and Kube deployments.

##  Erini flow

* nice integrated `cf push` flow
* CF apps are mapped directy to kube `StatefulSet`

## Components

## Orchestrator Provider Interface (OPI)

* Abstraction layer for Cloud Foundry's Control Plane
* Makes Eirini a generic backend for any Scheduler
* Diego/Kube/Swarm as long as OPI integration is implemented

## Bifrost

* Converting of CC Requests to OPI specific objects
* Makes Apps run in K8s

## Stager

* Staging by running K8s/OPI one-off tasks


## Deployment instructions 

* https://github.com/cloudfoundry-incubator/eirini-release 
* Done with Helm
* `helm install eirini/uaa`
* `helm install eirini/cf`

## Further informations

https://github.com/cloudfoundry-incubator/eirini


--- 

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
