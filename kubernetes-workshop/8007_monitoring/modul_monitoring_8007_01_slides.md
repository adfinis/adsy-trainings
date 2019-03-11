% Kubernetes Monitoring
% Lukas Grossar

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# Kubernetes Monitoring

Monitoring dynamic environments

---

## Monitoring Approaches

* Blackbox monitoring
* Whitebox monitoring

## Blackbox Monitoring

Blackbox monitoring

:   Monitoring externally visible behavior

    * Load
    * Memory
    * Diskspace
    * Processes

## Whitebox Monitoring

Whitebox monitoring

:   Monitoring application behavior

    * Metrics representation of internal state
    * Logs
    * ...

## Limitations

Blackbox monitoring

:   Can't provide detailed information the application

Whitebox monitoring

:   Information is only application specific

    Big picture requires aggregation

---

## Prometheus

* de-facto standard for Kubernetes monitoring
* Time series database
* Alerting toolkit
* Query language to access time series data
* Service discovery for Kubernetes services

## Prometheus Limitation

* Availability over accuracy
* No high-availability
* No distributed storage
* Pull based monitoring

## Prometheus Architecture

![](static/prometheus_architecture.png "Prometheus Architecture")

---

## Prometheus Data Format

Simple text based format

```
metric_name{label="value"} value timestamp
```

Each combination of `metric_name` and labels represents a time series.

##

```
# HELP http_requests_total The total number of HTTP requests.
# TYPE http_requests_total counter
http_requests_total{method="post",code="200"} 1027 1395066363000
http_requests_total{method="post",code="400"}    3 1395066363000

# A histogram, which has a pretty complex representation in the text format:
# HELP http_request_duration_seconds A histogram of the request duration.
# TYPE http_request_duration_seconds histogram
http_request_duration_seconds_bucket{le="0.1"} 33444
http_request_duration_seconds_bucket{le="0.5"} 129389
http_request_duration_seconds_bucket{le="1"} 133988
http_request_duration_seconds_bucket{le="+Inf"} 144320
http_request_duration_seconds_sum 53423
http_request_duration_seconds_count 144320
```

---

## Prometheus Queries

How to query Prometheus time series

## Prometheus Queries

Simple queries are similar to the data format

```
metric_name{label="value"}
```

The output is called instant vector, a single value for the current timestamp.

## Prometheus Queries

Time series can be selected by labels

```
http_requests_total{namespace="default",service="wp-wordpress"}
```

## Range vectors

A query can also requests all values within a timeframe

```
metric_name{label="value"}[5m]
```

## Filters

[Filters](https://prometheus.io/docs/prometheus/latest/querying/functions/) can be applied to vectors.

```
predict_linear(
  http_requests_total{
    namespace="default",
    service="wp-wordpress"
  }[5m],
  24*3600
)
```

---

## Alerting

Alerting Rules in Prometheus

## Alert configuration

* Alerts are configured in Prometheus
* Prometheus sends alerts to Alertmanager
* Alertmanager triggers notifications

## Alert definition

```yaml
groups:
- name: example
  rules:
  - alert: HighErrorRate
    expr: http_requests_total{code=~"5[0-9]{2}"} > 0
    for: 10m
    labels:
      severity: page
    annotations:
      summary: "High error rate for {{ $labels.app }}"
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
