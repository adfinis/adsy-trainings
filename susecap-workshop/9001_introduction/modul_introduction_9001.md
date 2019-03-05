![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Introduction to SUSE CAP 


## What is SUSE CAP

* SUSE **C**loud **A**pplication **P**lattform
* Cloud Foundry on SUSE CaasP or native K8s
* installed and configured via Helm Charts
* PaaS for applications
* Code deployment
* specifically for stateless/12f apps

## What SUSE CAP is not 

* Kubernetes 
* Hosting of self built Containers
* standalone Cloud Foundry on VMs
* Hosting of databases
 
## For what is it useful?

* Easy deployment of applications for devs
* Deployment from source code using buildpacks
* Kinda like Heroku

## How to install it?

* Using Helm Charts created by SUSE
* Deployment of Cloud Foundry and UAA server are independent charts
* Optional deployment of Stratos UI for Cloud Foundry management

## How to interact with it?

* Through Stratos UI
* Through Cloud Foundry CLI 

## Deployment steps

* Doc: https://www.suse.com/documentation
* edit **scf-config-values.yaml**
* Chart Repo: kubernetes-charts.suse.com
* UAA Chart: **suse/uaa**
* Cloud Foundry Chart: **suse/cf**
* Stratos Chart: **suse/console**

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
