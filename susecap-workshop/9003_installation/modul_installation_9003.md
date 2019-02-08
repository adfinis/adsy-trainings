![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Installation of SUSE CAP

---

## Preparations

---

## on SUSE CaaSP

* SUSE CaaSP installed
* Helm (client-only) installation [instructions](https://github.com/helm/helm#install) 
* Fix PodSecurityPolicy to allow privileged (CaaSP v3+)

## on native K8S

* API v1.8+
* swappaccount=1
* Docker info shows aufs as storage driver
* StorageClass already deployed
* kube-dns running
* ntp / systemd-timesync running
* Docker allows privileged containers
* Privileged=true on kubelet
* TaskMax property of containerd set to infinity
* Helm Tiller/Client installation on native K8S
* [all requirements](https://www.suse.com/documentation/cloud-application-platform-1/book_cap_guides/data/sec_cap_changes_kube-reqs.html)


## Can also be installed on

* Azure AKS
* Amazon EKS
* OpenStack
* [docs](https://www.suse.com/documentation/cloud-application-platform-1/book_cap_guides/data/book_cap_guides.html)

## Minimum Hardware Requirements

* 8GB of memory per dashboard and master nodes
* 16GB of memory per worker
* 40GB disk space per dashboard and master nodes
* 60GB disk space per worker. 

## Installation

## Storage Class

* Choose a storage class and set it as default

```
kubectl patch storageclass myStorageClass \
 -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
 ```
* test the storage class by creating PVCs
* check if a PersistentVolume was created 

---

## Configuration

---

## scf-config-values.yaml

```
env:
  # Enter the domain you created for your CAP cluster DOMAIN: example.com
    
  # UAA host and port
  UAA_HOST: uaa.example.com
  UAA_PORT: 2793
```

## scf-config-values.yaml (continued)

```
kube:
  external_ips: ["11.100.10.10", "192.168.1", "192.168.2", "192.168.3"]

  storage_class:
    persistent: "persistent"
    shared: "shared"
        
  # The registry the images will be fetched from.
  # The values below should work for
  # a default installation from the SUSE registry.
  registry:
    hostname: "registry.suse.com"
    username: ""
    password: ""
  organization: "cap"

  psp:
    privileged: "suse.cap.psp"

```

## scf-config-values.yaml (continued)

```
secrets:
  # Create a password for your CAP cluster
  CLUSTER_ADMIN_PASSWORD: password
    
  # Create a password for your UAA client secret
  UAA_ADMIN_CLIENT_SECRET: password

sizing:
  cc_uploader:
    capabilities: ["SYS_RESOURCE"]
  diego_api:
    capabilities: ["SYS_RESOURCE"]
  diego_brain:
    capabilities: ["SYS_RESOURCE"]
  diego_ssh:
    capabilities: ["SYS_RESOURCE"]
  nats:
    capabilities: ["SYS_RESOURCE"]
  router:
    capabilities: ["SYS_RESOURCE"]
  routing_api:
    capabilities: ["SYS_RESOURCE"]
```  

## Add SUSE Charts Repo

```
> helm repo add suse https://kubernetes-charts.suse.com/
> helm repo list
 NAME            URL                                             
 stable          https://kubernetes-charts.storage.googleapis.com
 local           http://127.0.0.1:8879/charts                    
 suse            https://kubernetes-charts.suse.com/
```

## Test SUSE Charts Repo

```
> helm search suse
NAME                          VERSION DESCRIPTION
suse/cf-opensuse              2.14.5  A Helm chart for SUSE Cloud Foundry
suse/uaa-opensuse             2.14.5  A Helm chart for SUSE UAA
suse/cf                       2.14.5  A Helm chart for SUSE Cloud Foundry
suse/cf-usb-sidecar-mysql     1.0.1   A Helm chart for SUSE Universal Service Broker ...
suse/cf-usb-sidecar-postgres  1.0.1   A Helm chart for SUSE Universal Service Broker ...
suse/console                  2.2.0   A Helm chart for deploying Stratos UI Console
suse/metrics                  1.0.0   A Helm chart for Stratos Metrics
suse/nginx-ingress            0.28.3  An nginx Ingress controller that uses ConfigMap...
suse/uaa                      2.14.5  A Helm chart for SUSE UAA
```

## Deploy UAA

```
> helm install suse/uaa \
--name susecf-uaa \
--namespace uaa \
--values scf-config-values.yaml

> watch -c 'kubectl get pods --namespace uaa'
```

## Deploy SCF

* generate secrets

```
> SECRET=$(kubectl get pods --namespace uaa \
-o jsonpath='{.items[?(.metadata.name=="uaa-0")].spec.containers[?(.name=="uaa")].env[?(.name=="INTERNAL_CA_CERT")].valueFrom.secretKeyRef.name}')

> CA_CERT="$(kubectl get secret $SECRET --namespace uaa \
-o jsonpath="{.data['internal-ca-cert']}" | base64 --decode -)"
```
* deploy SCF Helm Chart

```
> helm install suse/cf \
--name susecf-scf \
--namespace scf \
--values scf-config-values.yaml \
--set "secrets.UAA_CA_CERT=${CA_CERT}"

> watch -c 'kubectl get pods --namespace scf'
```

## Deploy Stratos Web Console 

* optional
```
> helm install suse/console \
    --name susecf-console \
    --namespace stratos \
    --values scf-config-values.yaml

> watch -c 'kubectl get pods --namespace stratos'
```

## Demo


---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
