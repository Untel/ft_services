if [ $1 = "re" ]
then
    echo "Cleaning..."
    kubectl		delete all --all
    docker      system prune -a
    minikube    delete
fi

srcs=./srcs
services=(nginx)

echo "Linking Minikube daemon to Docker daemon"
eval $(minikube -p minikube docker-env)
minikube start --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000

echo "Montage de MetalLB"
kubectl apply -f srcs/metallb/namespace.yaml
kubectl apply -f srcs/metallb/metallb.yaml
kubectl apply -f srcs/metallb/deploy.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
#minikube addons enable ingress
#kubectl apply -f ingress.yaml

for service in ${services[@]}
do
	echo "Création de l'image $service"
	docker build -t $service-img $srcs/$service

	echo "Deploiement du service $service"
    kubectl apply -f $srcs/$service/deploy.yaml
done
