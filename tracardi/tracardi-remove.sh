kubectl create ns tracardi
kubectl delete -f tracardi-web-api.yaml -n tracardi
kubectl delete -f tracardi-gui-api.yaml -n tracardi
kubectl delete -f tracardi-gui.yaml -n tracardi