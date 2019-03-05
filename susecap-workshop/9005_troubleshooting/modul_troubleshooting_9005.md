![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Troubleshooting

## what to do in case of fire?

# Hosted Apps

## Use the cf cli

```
$ cf logs
$ cf events
$ cf restage
```
## Use cf curl to talk to the API directly

```
$ cf curl /v2/apps
$ cf curl -X DELETE /v2/apps/233f....
```

# SUSE CAP

## Check Pods

```
$ kubectl get pods -n scf
$ kubectl get pods -n uaa
```
If something is acting strange, or health status is not 1/1, go inside the pod and check monit

## Delete pod

Try a recreation of the Pod having a problem

```
$ kubectl delete pod xxxx
```

## Check monit status in Pod

```
api/0:/var/vcap/jobs/cloud_controller_ng# monit status | head
The Monit daemon 5.2.5 uptime: 7d 0h 50m

Process 'crond'
  status                            running
  monitoring status                 monitored

```

## Check for logs in the Pod

```
api/0:/var/vcap/jobs/cloud_controller_ng# tail /var/vcap/sys/log/nginx_cc/nginx.error.log
2019/02/15 15:45:40 [warn] 3149#0: *325777 send() to syslog failed while logging request, client: 10.244.4.6, server: _, request: "GET /internal/v4/syslog_drain_urls?batch_size=1000&next_id=0 HTTP/1.1", upstream: "http://unix:/var/vcap/sys/run/cloud_controller_ng/cloud_controller.sock/internal/v4/syslog_drain_urls?batch_size=1000&next_id=0", host: "api.scf.svc.cluster.local:9023"
2019/02/15 15:45:50 [error] 3149#0: send() failed (111: Connection refused)
2019/02/15 15:45:50 [error] 3149#0: send() failed (111: Connection refused)
2019/02/15 15:45:50 [warn] 3149#0: *325781 send() to syslog failed while logging request, client: 10.244.5.6, server: _, request: "HEAD /v2/info HTTP/1.1", upstream: "http://unix:/var/vcap/sys/run/cloud_controller_ng/cloud_controller.sock/v2/info", host: "api-0:9022"
```

## ReplicaSet

If a replicaset is giving problems, try to set the replicas to #1

```
$ kubectl scale statefulset/mysql --replicas 1
```

troubleshoot on one single replicaset rather than on multiple instances


## Finally, check for known issues on suse/scf

https://github.com/SUSE/scf/issues



---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
