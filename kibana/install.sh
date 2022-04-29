# https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-deploy-kibana.html

kubectl create -f https://download.elastic.co/downloads/eck/2.1.0/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/2.1.0/operator.yaml
kubectl apply -f kb-cluster.yaml -n elastic

kubectl get secret es-cluster-es-elastic-user -n elastic -o=jsonpath='{.data.elastic}' | base64 --decode; echo

