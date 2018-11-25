% Kubernetes Networking
% Lukas Grossar

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

---

## Kubernetes Networking

Hands-on with what's happening in the background

---

## Create a service

```yaml
apiVersion: v1
kind: Service
metadata:
  labels:
    app: hello-world
  name: apache-hello-world
  namespace: example
spec:
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: hello-world
```

## Create a service

```shell
$ kubectl create -f 02_service.yaml
service/apache-hello-world created
```

## Describe the service

```shell
$ kubectl describe service/apache-hello-world
Name:              apache-hello-world
Namespace:         example
Labels:            app=hello-world
Annotations:       <none>
Selector:          app=hello-world
Type:              ClusterIP
IP:                172.16.4.19
Port:              http  80/TCP
TargetPort:        80/TCP
Endpoints:         172.24.137.45
Session Affinity:  None
Events:            <none>
```

## Look for you service in iptables

```shell
$ iptables | grep 'example/apache-hello-world'
-A KUBE-SEP-6LAKM6QVW4IKLDQJ -s 172.16.4.19/32 [...] -j KUBE-MARK-MASQ
-A KUBE-SEP-6LAKM6QVW4IKLDQJ -p tcp [...] -m tcp -j DNAT --to-destination 172.16.4.19:80
-A KUBE-SERVICES -d 172.16.4.19/32 -p tcp [...] -m tcp --dport 80 -j KUBE-SVC-33Y4WN6EIIX3LNYJ
-A KUBE-SVC-33Y4WN6EIIX3LNYJ [...] -j KUBE-SEP-6LAKM6QVW4IKLDQJ
```

---

# Attribution / License

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
