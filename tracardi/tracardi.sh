kubectl create ns tracardi
kubectl apply -f tracardi-gui-api.yaml -n tracardi
kubectl apply -f tracardi-gui.yaml -n tracardi