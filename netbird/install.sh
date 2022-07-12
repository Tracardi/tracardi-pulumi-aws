kubectl apply -f netbird-namespace.yaml
kubectl apply -f netbird-echo.yaml -n netbird
kubectl apply -f netbird-nginx-lb.yaml -n netbird




