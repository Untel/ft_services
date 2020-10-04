if [[ $1 == "re" ]]
then
    echo "Cleaning..."
    kubectl		delete all --all
    docker      system prune -a
    minikube    delete
fi

srcs=./srcs
services=(nginx)

echo "Linking Minikube daemon to Docker daemon"
minikube start --vm-driver=docker -p minikube docker-env
eval $(minikube -p minikube docker-env)

echo "Montage de MetalLB"
kubectl apply -f srcs/metallb/namespace.yaml
kubectl apply -f srcs/metallb/metallb.yaml
kubectl apply -f srcs/metallb/deploy.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

for service in "${services[@]}"
do
	echo "Création de l'image $service"
	docker build -t $service-img $srcs/$service

	echo "Deploiement du service $service"
    kubectl apply -f $srcs/$service/deploy.yaml
done
