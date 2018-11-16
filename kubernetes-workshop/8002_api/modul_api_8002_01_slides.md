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
