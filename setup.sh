#!/bin/sh

source ./shortcuts.sh

if [[ $1 == "re" ]]
then
    echo "Cleaning..."
    # kubectl		delete all --all
    # docker      system prune -a
    minikube    delete
fi

srcs=./srcs
services=(nginx mysql ftps phpmyadmin wordpress)


# export HTTP_PROXY=http://192.168.99.124:80
# export HTTPS_PROXY=https://ft_service:443
# export NO_PROXY=localhost,127.0.0.1,10.96.0.0/12,192.168.99.0/24,192.168.39.0/24

echo "Starting minikube"
minikube start --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000
echo "Linking Minikube daemon to Docker daemon"
eval $(minikube -p minikube docker-env)

echo "Montage de MetalLB"
kubectl apply -f srcs/metallb/namespace.yaml
kubectl apply -f srcs/metallb/metallb.yaml
kubectl apply -f srcs/metallb/deploy.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

for service in ${services[@]}
do
	echo "Création de l'image $service"
	docker build -t $service-img $srcs/$service

	echo "Deploiement du service $service on path $srcs/$service/deploy.yaml"
    kubectl apply -f $srcs/$service/deploy.yaml
done

minikube dashboard &