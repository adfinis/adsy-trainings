![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Introduction to SUSE CAP 


## What is SUSE CAP

* SUSE **C**loud **A**pplication **P**lattform
* CloudFoundry on SUSE CaasP or native K8s
* installed and configured via Helm Charts
* Hosting of cf applications
* specifically for stateless/12f apps

## What SUSE CAP is not 

* Kubernetes 
* Hosting of self built Containers
* standalone CloudFoundry on VMs
* Hosting of databases
 
## For what is it useful?

* Easy deployment of applications for devs
* Deployment from source code using buildpacks
* Kinda like Heroku

## How to install it?

* Through Helm Charts created by SUSE
* Deployment of CloudFoundry and UAA server are independent charts
* Optional deployment of Stratos UI

## How to interact with it?

* Through Stratos UI
* Through CloudFoundry CLI 

## Deployment steps

* Doc: https://www.suse.com/documentation
* edit **scf-config-values.yaml**
* Chart Repo: kubernetes-charts.suse.com
* UAA Chart: **suse/uaa**
* CloudFoundry Chart: **suse/cf**
* Stratos Chart: **suse/console**

## Demo

Deployment on Azure AKS 

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
