# https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-deploy-elasticsearch.html
# https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-volume-claim-templates.html

kubectl delete -f https://download.elastic.co/downloads/eck/2.1.0/crds.yaml
kubectl delete -f https://download.elastic.co/downloads/eck/2.1.0/operator.yaml
kubectl delete -f es-namespace.yaml
kubectl delete -f es-cluster.yaml -n elastic

