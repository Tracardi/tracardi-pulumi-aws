#kubectl create secret generic regcred \
#    --from-file=.dockerconfigjson=/home/risto/.docker/config.json> \
#    --type=kubernetes.io/dockerconfigjson

kubectl apply -f tracardi-pro-namespace.yaml
kubectl apply -f tracardi-pro.yaml -n tracardi-pro