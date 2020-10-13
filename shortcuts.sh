alias k='kubectl'
alias kgl='kubectl_get_logs'
alias kdp='kubectl_delete_pod'
alias dec='docker_exec_container'
alias kre='kubectl_reload'

#           kubectl_get_pod_name(name)
function    kubectl_get_pod_name {
    kubectl get pods | grep $1 > /dev/null
    if [ $? -ne 0 ]; then
        echo "error pod '$1' not found" >&2
        return -1;
    fi
    kubectl get pods | grep $1 | cut -f1 -d' '
}

#           kubectl_get_logs(name)
function    kubectl_get_logs {
    kubectl_get_pod_name $1 && \
    kubectl logs $(kubectl_get_pod_name $1)
}

#           kubectl_delete_pod(name)
function    kubectl_delete_pod {
    kubectl_get_pod_name $1 && \
    kubectl delete pod $(kubectl_get_pod_name $1)
}

#           docker_exec_container(name)
function    docker_exec_container {
    eval $(minikube docker-env)
    id=$(docker ps -f name=$1 | grep $1_$1 | cut -f1 -d' ')
    if [ -z "$id" ];then
        echo "error container '$1' not found" >&2
        return -1
    fi
    docker exec -ti $id sh
}

#			kubectl_reload(name, ...)
function	kubectl_reload {
    ft_service_path="$HOME/lab/ft_services/srcs"
    eval $(minikube -p minikube docker-env)
	for service in "$@"; do
		kubectl delete -f $ft_service_path/$service/deploy.yaml
        docker build -t "$service-img" "srcs/$service"
        kubectl apply -f $ft_service_path/$service/deploy.yaml
	done
}
