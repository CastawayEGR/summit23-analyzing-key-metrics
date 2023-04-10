# summit23-analyzing-key-metrics

### Deploy Grafana Operator

```
oc apply -f 00-grafana-operator/
```

Once the operator has completed installtion you may proceed.

### Deploy Grafana Instance

This deploys an instance of grafana and the thanos datasource to query cluster metrics.

```
oc apply -f 01-grafana-deployment/
```

### Deploy Grafana Dashboards

Optionally you can deploy the default kubernetes-mixin dashboards as well as other useful dashboards for troubleshooting.

```
oc create -f 02-provision-grafana-dashboards/
```

### Access Grafana Instance

Obtain the Grafana route.

```
oc get route grafana-route -n o11y -o jsonpath={.spec.host}
```

Login using the following:

| Username | Password |
| - | - |
| admin | redhat |

