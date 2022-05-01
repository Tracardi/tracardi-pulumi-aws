kubectl apply -f tracardi-namespace.yaml

# Copies secret to tracardi namespace
kubectl get secret es-cluster-es-elastic-user --namespace=elastic -oyaml | grep -v '^\s*namespace:\s' | kubectl apply --namespace=tracardi -f -

kubectl apply -f tracardi-web-api.yaml -n tracardi
kubectl apply -f tracardi-gui-api.yaml -n tracardi
kubectl apply -f tracardi-gui.yaml -n tracardi
kubectl apply -f tracardi-ingress.yaml -n tracardi