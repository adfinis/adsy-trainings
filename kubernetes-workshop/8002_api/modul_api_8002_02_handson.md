% Kubernetes API
% Lukas Grossar

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Kubernetes API

---

## Create a namespace for yourself

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: example
```

Choose a name for your namespace and save it as `namespace.yaml`

## Create a namespace for yourself

```shell
$ kubectl create -f 00_namespace.yaml
namespace/example created
```

## Create a deployment in your namespace

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: apache-hello-world
  labels:
    app: hello-world
spec:
  selector:
    matchLabels:
      app: hello-world
  template:
    metadata:
      labels:
        app: hello-world
    spec:
      containers:
      - name: apache-hello-world
        image: adfinissygroup/apache-hello-world
        ports:
        - containerPort: 80
```

## Create a deployment in your namespace

```shell
$ kubectl create -f 02_deployment.yaml
deployment.apps/apache-hello-world created
```

## Create a service for you deployment

```yaml
apiVersion: v1
kind: Service
metadata:
  labels:
    app: hello-world
  name: apache-hello-world
spec:
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: hello-world
```

## Create a service for your deployment

```shell
$ kubectl create -f 02_service.yaml
service/apache-hello-world created
```

## Expose your service via ingress

```yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: apache-hello-world
  labels:
    app: hello-world
spec:
  rules:
  - host: hello-world.example.com
    http:
      paths:
      - backend:
          serviceName: apache-hello-world
          servicePort: 80
```

## Expose your service via ingress

```shell
$ kubectl create -f 02_ingress.yaml
ingress.extensions/apache-hello-world created
```

Check that you see the right content on your Ingress.

## Request a PVC for your deployment

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: apache-hello-world
  labels:
    app: hello-world
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 16Mi
```

## Request a PVC for your deployment

```shell
$ kubectl create -f 01_pvc.yaml
persistentvolumeclaim/apache-hello-world created
```

## Patch the deployment to include the PVC

```json
[{
    "op": "add",
    "path": "/spec/template/spec/containers/0/volumeMounts",
    "value": [{
      "mountPath": "/usr/local/apache2/htdocs",
      "name": "htdocs"
    }]
  },
  {
    "op": "add",
    "path": "/spec/template/spec/volumes",
    "value": [{
      "name": "htdocs",
      "persistentVolumeClaim": {
        "claimName": "apache-hello-world"
      }
    }],
  }
]
```

## Patch the deployment to include the PVC

```shell
$ kubectl patch --type=json -p "$(cat patch.json)" deployments.apps apache-hello-world
deployment.apps/apache-hello-world patched
```

Now you should see different content when you access your container via Ingress.

## Repeat while showing events

```shell
$ kubectl get events -w
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

[RFC 1123]: https://tools.ietf.org/html/rfc1123 "RFC 1123"
