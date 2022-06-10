kubectl apply -f bridge-mqtt-namespace.yaml

# Copies secret to tracardi namespace
kubectl get secret es-cluster-es-elastic-user --namespace=elastic -oyaml | grep -v '^\s*namespace:\s' | kubectl apply --namespace=bridge-mqtt -f -


kubectl apply -f bridge-mqtt.yaml