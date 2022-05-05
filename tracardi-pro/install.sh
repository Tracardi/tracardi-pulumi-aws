#kubectl create secret generic regcred \
#    --from-file=.dockerconfigjson=/home/risto/.docker/config.json> \
#    --type=kubernetes.io/dockerconfigjson

kubectl apply -f tracardi-pro-namespace.yaml
kubectl apply -f tracardi-pro.yaml -n tracardi-pro
kubectl apply -f tracardi-pro-scheduler.yaml -n tracardi-pro
kubectl apply -f tracardi-schedule-server.yaml -n tracardi-pro
kubectl apply -f tracardi-schedule-worker.yaml -n tracardi-pro