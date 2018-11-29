% Kubernetes API
% Lukas Grossar

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

---

# Kubernetes API

An introduction to the Kubernetes API

---

## Interaction with the Kubernetes API

`kubectl`

:   The default CLI tool for Kubernetes

Kubernetes Dashboard

:   Web GUI for interaction with Kubernetes

## Kubernetes API Convention

Objects

:   Objects describe a desired state

    Scheduler tries to ensure the desired state

    Objects are defined in [YAML](http://yaml.org/)

## Kubernetes Object Example

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: myapp
  labels:
    app: myapp
spec:
  containers:
  - name: myapp
    image: registry.example.com/myapp:2.7
```

## Kubernetes API Convention

* Objects needs to define at least
  * apiVersion
  * kind
  * metadata
  * spec

## Object Kind

`apiVersion`

:   Which API version should be used for this object

`kind`

:   What kind of object is this (e.g. Pod, Deployment)

Together `apiVersion` and `kind` define which API scheme will be used for the
`spec` field.

## Object Specification

`spec`

:   Object properties

## Object Specification

* Defines the object properties
* Different schemas per kind

## Object Metadata

`name`

:   Name of the object, unique within a namespace

`namespace`

:   Namespace the object should be placed in

`labels`

:   Unstructured labels for selection and filtering

`annotations`

:   Unstructured label for cluster internal usage

## Object Metadata

* Metadata places the object within Kubernetes
* Definition of additional information via labels
  * usable for search and filtering
* Definition of additional properties via annotations
  * only usable within Kubernetes (Ingress annotations)
* Name must be a [RFC 1123] compliant subdomain

---

## Kubernetes Namespaces

* Namespaces provide a logical separation of objects
* Most objects in Kubernetes are namespaced
* Namespace names must be valid DNS labels
  * [RFC 1123]
  * `[a-z0-9]|[a-z0-9][-a-z0-9]*[a-z0-9]`

## Kubernetes Namespaces

* Namespaces can be used for customer/app separation
* This should be reflected in the naming scheme

```bash
${customer}-${app}-${stage}
```

## Kubernetes Namespaces

Only few objects with cluster-scope are not namespaced

* Namespaces
* ClusterRoles
* ClusterRoleBindings
* StorageClasses
* Nodes
* PersistentVolumes

::: notes
- Namespaces are not namespaced for a reason
- PersistentVolumes are not namespaced, but PersistentVolumeClaims are, because
  PersistentVolumes might need to be provisioned by admins.
:::

---

## Kubernetes CLI

`kubectl` is the command line interface for Kubernetes

```bash
kubectl <command>
```

## kubectl get

Get a specific object or list of objects

```shell
$ kubectl get pods
NAME                            READY   STATUS    RESTARTS   AGE
wp-mariadb-0                    1/1     Running   0          99s
wp-wordpress-569dccff6c-kczdv   1/1     Running   0          99s
```

```shell
$ kubectl get pod/wp-mariadb-0
NAME                            READY   STATUS    RESTARTS   AGE
wp-mariadb-0                    1/1     Running   0          99s
```

## kubectl get

Filter objects by label using `-l` or `--labels`

```shell
$ kubectl get all -l release=wp -o name
NAME                            READY   STATUS    RESTARTS   AGE
pod/wp-mariadb-0                1/1     Running   0          28m
wp-wordpress-569dccff6c-kczdv   1/1     Running   0          99s

NAME                   TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
service/wp-mariadb     ClusterIP   10.99.100.225   <none>        3306/TCP   28m
service/wp-wordpress   ClusterIP   10.110.59.25    <none>        80/TCP     28m

NAME                           DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/wp-wordpress   1         1         1            1           28m

NAME                          DESIRED   CURRENT   AGE
statefulset.apps/wp-mariadb   1         1         28m
```

## kubectl get

Multiple output formats available via `-o` or `--output`

* json
* yaml
* wide
* name

## kubectl describe

Show detailed state of the object, including events

```shell
$ kubectl describe pod wp-mariadb-0
Name:           wp-mariadb-0
Namespace:      default
[...]
Events:
  Type     Reason                 Age    From               Message
  ----     ------                 ----   ----               -------
  Normal   Scheduled              8m21s  default-scheduler  Successfully assigned wp-mariadb-0 to minikube
  Normal   SuccessfulMountVolume  8m20s  kubelet, minikube  MountVolume.SetUp succeeded for volume "pvc-1ec6c99a-ecd2-11e8-a1c7-005eab6edd6d"
  Normal   SuccessfulMountVolume  8m20s  kubelet, minikube  MountVolume.SetUp succeeded for volume "config"
  Normal   SuccessfulMountVolume  8m20s  kubelet, minikube  MountVolume.SetUp succeeded for volume "default-token-jffgp"
  Normal   Pulled                 8m20s  kubelet, minikube  Container image "docker.io/bitnami/mariadb:10.1.34" already present on machine
  Normal   Created                8m20s  kubelet, minikube  Created container
  Normal   Started                8m19s  kubelet, minikube  Started container
```

## kubectl delete

Delete a Kubernetes object

```shell
$ kubectl delete pod wp-mariadb-0
pod "wp-mariadb-0" deleted
```

For pods controlled by a controller the deletion of a pod is equivalent to a restart.

## kubectl logs

Show logs output from a container

```shell
$ kubectl logs -f wp-wordpress-569dccff6c-kczdv
172.17.0.1 - - [21/Nov/2018:10:02:04 +0000] "GET /wp-login.php HTTP/1.1" 200 1075
172.17.0.1 - - [21/Nov/2018:10:02:14 +0000] "GET /wp-login.php HTTP/1.1" 200 1075
172.17.0.1 - - [21/Nov/2018:10:02:24 +0000] "GET /wp-login.php HTTP/1.1" 200 1075
172.17.0.1 - - [21/Nov/2018:10:02:34 +0000] "GET /wp-login.php HTTP/1.1" 200 1075
172.17.0.1 - - [21/Nov/2018:10:02:44 +0000] "GET /wp-login.php HTTP/1.1" 200 1075
```

## kubectl exec

Run a command in a container

```shell
$ kubectl exec wp-mariadb-0 cat /etc/mysql/my.cnf
[mysqld]
port   = 3306
socket = /run/mysqld/mysqld.sock
```

## kubectl exec

Run an interactive shell in a container

```shell
$ kubectl exec -it wp-mariadb-0 bash
user@wp-mariadb-0:/$
```

## kubectl run

Run an interactive shell in a temporary pod

```shell
$ kubectl run debugger --generator=run-pod/v1 --image=alpine --rm=true -it -- sh
If you don't see a command prompt, try pressing enter.
/ #
```

The pod will be deleted as soon as you exit the shell

---

## Kubernetes API Reference

Overview of references for multiple API versions

<https://kubernetes.io/docs/reference/>

---

# Attribution / License

* Slide Skeleton https://de.wikipedia.org/wiki/Skeleton_(Programmierung)

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

[RFC 1123]: https://tools.ietf.org/html/rfc1123 "RFC 1123"
