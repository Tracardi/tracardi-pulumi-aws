# this setup is based on https://www.containiq.com/post/deploy-redis-cluster-on-kubernetes

kubectl delete -f redis-storage.yaml
kubectl delete -n redis -f redis-config.yaml
kubectl delete -n redis -f redis-statefulset.yaml
kubectl delete -f redis-namespace.yaml
