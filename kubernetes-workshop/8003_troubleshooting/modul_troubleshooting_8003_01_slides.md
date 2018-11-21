% Kubernetes Troubleshooting
% Antonio Tauro
% November 25, 2018

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Kubernetes Troubleshooting 

--- 

## How to troubleshoot your cluster

List your nodes and see their state

`kubectl get nodes`

## Logfiles of kubernetes components

For SUSE CaaSP Everything is logged to the journal

## Master Nodes

`journalctl -a -u kube-apiserver`

`journalctl -a -u etcd`

## Worker Nodes

`journalctl -a -u kubelet`

`journalctl -a -u kube-proxy`

## Some possible reasons your nodes are in failed state

* VM(s) shutdown
* Network issues
* Crashes in Kubernetes services
* Data loss or unavailability of persisten storage
* Operator error or misconfiguration

## What to do if a service isn't running as expected?

## Is the service reachable? 

`curl mydomain.local`

## Is the pod running?

`kubectl get pods`

## if not, why? 

`kubectl describe pod xxxx`

## if the pod is running, what is it telling us?

`kubectl logs pod xxxx`

`kubectl logs --previous pod xxxx`

## Other helpful commands

`kubectl delete pod xxxx` = basically restart Pod

`kubectl get events` 

`kubectl get deploy xxxx -o yaml`

`kubectl get ingress xxxx -o yaml`

`kubectl get endpoints`

--- 

## Most common known Errors

* ImagePullBackOff
* FailedCreatePodSandBox
* Backoff from starting
* Readiness or Liveness Probe failing (Unhealthy)
* Scheduling Errors


## Other helpful links

* [Kubernetes Docs | Debug Application](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application/)
* [Kubernetes Docs | Debug Cluster](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/)

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
