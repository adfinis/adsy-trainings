% Kubernetes Troubleshooting
% Antonio Tauro
% November 25, 2018

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Kubernetes Troubleshooting 

--- 

## What to do if a service isn't running as expected?

## Is the service reachable? 

`curl mydomain.local`

## Is the pod running?

`kubectl get pods`

## if not, why? 

`kubectl describe pod xxxx`

## if the pod is running, what is it telling us?

`kubectl logs pod xxxx`

## Other helpful commands

* `kubectl delete pod xxxx` = basically restart Pod
* `kubectl get events` 
* `kubectl get deploy xxxx -o yaml`
* `kubectl get ingress xxxx -o yaml`

--- 

## Most common known Errors

* ImagePullBackOff
* FailedCreatePodSandBox
* Backoff from starting
* Readiness or Liveness Probe failing (Unhealthy)
* Scheduling Errors

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
