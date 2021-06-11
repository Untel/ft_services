#!/bin/sh

source ./shortcuts.sh

if [[ $1 == "re" ]]
then
    echo "Cleaning..."
    kubectl		delete all --all
    docker      system prune -a
    minikube    delete
fi


echo "Starting minikube"
minikube start --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000
echo "Linking Minikube daemon to Docker daemon"
eval $(minikube -p minikube docker-env)

echo "Montage de MetalLB"
kubectl apply -f srcs/metallb/namespace.yaml
kubectl apply -f srcs/metallb/metallb.yaml
kubectl apply -f srcs/metallb/deploy.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

srcs=./srcs
services=(mysql influxdb nginx ftps phpmyadmin wordpress grafana telegraf)
for service in ${services[@]}
do
	echo "Création de l'image $service"
	docker build -t $service-img $srcs/$service
    
	echo "Deploiement du service $service on path $srcs/$service/deploy.yaml"
    kubectl apply -f $srcs/$service/
done

minikube dashboard &