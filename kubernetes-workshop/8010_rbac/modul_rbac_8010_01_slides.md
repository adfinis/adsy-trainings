% Role Based Access Control
% Lukas Grossar

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

---

# Kubernetes RBAC

Access management for the Kubernetes API

---

## Kubernetes Roles

Roles grant permissions to access the API

* Permissions are additive
* No way to deny permissions

## Kubernetes Roles

```yaml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  namespace: default
  name: pod-reader
rules:
- apiGroups: 
  - "" # "" indicates the core API group
  resources: 
  - pods
  verbs:
  - get
  - list
```

## Kubernetes Roles

The following ClusterRoles are deployed by default

- cluster-admin
- admin
- edit
- view

ClusterRoles are cluster-wide templates, but granted permissions depend on the binding of the role.

## RoleBinding

Roles are bound to users or groups via RoleBinding

- RoleBindings are namespaced
  - Permissions are granted in this namespace only
- ClusterRoleBindings grant permissions in all namespaces
- Roles can be bound to Users or Groups


## RoleBinding

```yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: admin
  namespace: development
subjects:
- kind: User
  name: dashboard
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: dashboard-viewer
  apiGroup: rbac.authorization.k8s.io
```

## RoleBinding

```yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: admin
  namespace: development # Permissions are only granted in this namespace
subjects:
- kind: User
  name: dave
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: admin
  apiGroup: rbac.authorization.k8s.io
```

## ClusterRoleBinding


```yaml
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: cluster-admin-k8s-ops
subjects:
- kind: Group
  name: k8s-ops
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
```

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
