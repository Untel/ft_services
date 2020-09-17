if [[ $1 == "re" ]]
then
    echo "Cleaning..."
    kubectl		delete all --all
    docker      system prune -a
    minikube    delete
fi

srcs=./srcs
services=(nginx)

minikube start --vm-driver=docker 

for service in "${services[@]}"
do
	echo "Création de l'image $service"
	docker build -t $service-img $srcs/$service

	echo "Deploiement du service $service"
    kubectl apply -f srcs/$service/deploy.yaml
done
