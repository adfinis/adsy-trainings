% Kubernetes Troubleshooting
% Antonio Tauro
% November 23, 2018

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

## Kubernetes Troubleshooting HandsOn

---

### Create a new file deployment-ghello.yml

```
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: ghello
  labels:
    app: ghello
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: ghello
    spec:
      containers:
      - name: ghello
        image: adfinissygroup/hello:latest
        imagePullPolicy: IfNotPresent
        livenessProbe:
          failureThreshold: 3
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 1
          exec:
            command:
            - /bin/sh
            - -c
            - curl -s localhost:8080/healthz | grep "hello_world 1"
        ports:
        - containerPort: 80
          name: http
          protocol: TCP
        readinessProbe:
          failureThreshold: 3
          periodSeconds: 10
          successThreshold: 1
          tcpSocket:
            port: http
          timeoutSeconds: 1
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      terminationGracePeriodSeconds: 30
```

### Apply it to your Kubernetes Cluster

`kubectl apply -f deployment-ghello.yml`

### Check if the Pod starts up correctly

`kubectl get pod`

### Find out what the problem is & fix it

* `kubectl describe pod ghello`
* `kubectl edit deploy ghello`

### After fixing all the problems

Try to expose this pod to the world.

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
