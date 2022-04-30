# this setup is based on https://www.containiq.com/post/deploy-redis-cluster-on-kubernetes

kubectl apply -f redis-namespace.yaml
kubectl apply -f redis-storage.yaml
kubectl apply -n redis -f redis-config.yaml
kubectl apply -n redis -f redis-statefulset.yaml

# The service endpoints for each Redis pod are given below:
# syntax
# pod_name.service_name.namespace.svc.cluster.local
# 
# Example
# redis-0.redis.redis.svc.cluster.local
# redis-1.redis.redis.svc.cluster.local
# redis-2.redis.redis.svc.cluster.local

