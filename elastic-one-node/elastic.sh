kubectl apply -f elastic-namespace.yaml
kubectl apply -f elastic-storage.yaml -n elastic
kubectl apply -f elastic-svc-cluster.yaml -n elastic
kubectl apply -f elastic-sts-deployment.yaml -n elastic
kubectl apply -f elastic-svc-loadbalancer.yaml -n elastic