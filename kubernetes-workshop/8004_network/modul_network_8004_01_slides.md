% Kubernetes Networking
% Lukas Grossar

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

---

## Kubernetes Networking

Introduction to the networking layers in Kubernetes

---

## Kubernetes Networking Layers

![](static/yummy-birthday-cake-on-platter.jpg "rainbow layers")

## Kubernetes Networking Layers

* Host network
* Overlay/CNI network
* Service network

## Host network

* Standard network interfaces configured on the host
* Used for external communication
* Not managed by Kubernetes

## Overlay/CNI network

* Flat virtual network via CNI plugins (e.g. Flannel)
* Used for Pod-Pod communication
* Split into smaller subnets per host (/23)
* Every pod receives an IP within the host subnet

##

![](static/Kubernetes_Networking.svg "Kubernetes Networking Layers")

## Service network

* Virtual IP addresses for internal services (ClusterIP)
* Not attached to any interfaces
* Managed by `kube-proxy`
* Visible in `iptables` configuration

## Network flow

![](static/kubernetes_sdn_network.png "Kubernetes Network Flow")

## Network flow for ClusterIP

![](static/kubernetes_service_network.png "Kubernetes ClusterIP Network Flow")

---

# Attribution / License

* Kubernetes Networking Graphics by [Mark Betz](https://medium.com/google-cloud/understanding-kubernetes-networking-pods-7117dd28727)

* Slides
Adfinis SyGroup AG, 2017, Attribution-NonCommercial 2.0
(CC BY-NC 2.0)

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
