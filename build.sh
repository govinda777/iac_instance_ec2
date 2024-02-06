#!/bin/bash

# Nome do contêiner e da imagem
CONTAINER_NAME="jenkins-local"
IMAGE_NAME="jenkins-local"

# Construir a imagem Docker
echo "Construindo a imagem Docker..."
docker build -t ${IMAGE_NAME} -f jenkins.Dockerfile .

# Verificar se o contêiner existe (em qualquer estado)
container_id=$(docker ps -aq -f name=^/${CONTAINER_NAME}$)

# Parar e remover o contêiner se ele existir
if [ -n "$container_id" ]; then
    echo "Parando e removendo o contêiner existente..."
    docker stop $container_id
    docker rm -f $container_id
fi

# Executar um novo contêiner Jenkins
echo "Iniciando um novo contêiner Jenkins..."
docker run -d -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v $(pwd)/kubeconfig:/var/jenkins_home/.kube/config \
  -v /Users/gosouza/.minikube/ca.crt:/var/jenkins_home/.kube/ca.crt \
  -v /Users/gosouza/.minikube/profiles/flux/client.crt:/var/jenkins_home/.kube/client.crt \
  -v /Users/gosouza/.minikube/profiles/flux/client.key:/var/jenkins_home/.kube/client.key \
  --name ${CONTAINER_NAME} ${IMAGE_NAME}

docker exec -it jenkins-local bash