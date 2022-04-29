kubectl delete -f elastic-storage.yaml -n elastic
kubectl delete -f elastic-svc-cluster.yaml -n elastic
kubectl delete -f elastic-sts-deployment.yaml -n elastic
kubectl delete -f elastic-svc-loadbalancer.yaml -n elastic
kubectl delete -f elastic-namespace.yaml