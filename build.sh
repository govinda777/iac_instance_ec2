#!/bin/bash

CA_CERT="/Users/gosouza/.minikube/ca.crt"
CLIENT_CERT="/Users/gosouza/.minikube/profiles/flux/client.crt"
CLIENT_KEY="/Users/gosouza/.minikube/profiles/flux/client.key"

if [ $(stat -f "%u" $CA_CERT) -ne 1000 ] || [ $(stat -f "%u" $CLIENT_CERT) -ne 1000 ] || [ $(stat -f "%u" $CLIENT_KEY) -ne 1000 ]; then
    echo "Alterando a propriedade dos arquivos de certificado para UID 1000..."
    sudo chown 1000:1000 $CA_CERT
    sudo chown 1000:1000 $CLIENT_CERT
    sudo chown 1000:1000 $CLIENT_KEY
fi

# Ajusta as permissões dos arquivos
echo "Alterando as permissões dos arquivos de certificado..."
chmod 644 $CA_CERT
chmod 644 $CLIENT_CERT
chmod 600 $CLIENT_KEY

docker-compose down

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

echo "Alterando as permissões dos arquivos de configuração do Kubernetes..."

sudo chown 1000:1000 /Users/gosouza/.minikube/ca.crt
sudo chown 1000:1000 /Users/gosouza/.minikube/profiles/flux/client.crt
sudo chown 1000:1000 /Users/gosouza/.minikube/profiles/flux/client.key

# Executar um novo contêiner Jenkins
echo "Iniciando um novo contêiner Jenkins..."

# Carrega a chave do GitHub App na variável de ambiente local
GITHUB_APP_KEY_CONTENT=$(cat ./gitHubApp.key)

# Verifica se a variável foi carregada corretamente
if [ -z "$GITHUB_APP_KEY_CONTENT" ]; then
    echo "Falha ao carregar a chave do GitHub App. Certifique-se de que gitHubApp.key está no diretório correto."
    exit 1
fi

# Executa o Docker Compose passando a variável de ambiente
env GITHUB_APP_KEY_CONTENT="$GITHUB_APP_KEY_CONTENT" docker-compose up -d

docker exec -it jenkins-local bash
