# https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-deploy-elasticsearch.html
# https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-volume-claim-templates.html

kubectl create -f https://download.elastic.co/downloads/eck/2.1.0/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/2.1.0/operator.yaml
kubectl apply -f es-namespace.yaml
kubectl apply -f es-cluster.yaml -n elastic

# PASSWORD=$(kubectl get secret es-cluster-es-elastic-user -n elastic -o go-template='{{.data.elastic | base64decode}}')
