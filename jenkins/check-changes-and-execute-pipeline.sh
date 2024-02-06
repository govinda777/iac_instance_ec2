#!/bin/bash

# Defina o diretório onde o repositório será clonado
REPO_DIR="/caminho/local/do/repo/iac_instance_ec2"
REPO_URL="https://github.com/govinda777/iac_instance_ec2"
JENKINSFILE="Jenkinsfile"

# Verifique se o diretório existe
if [ ! -d "$REPO_DIR" ]; then
    # Clone o repositório se ele não existir
    git clone "$REPO_URL" "$REPO_DIR"
else
    # Vá para o diretório do repositório e puxe as últimas mudanças
    cd "$REPO_DIR"
    git fetch origin main

    # Verifique se há alterações
    LOCAL=$(git rev-parse @)
    REMOTE=$(git rev-parse @{u})

    if [ "$LOCAL" != "$REMOTE" ]; then
        echo "Houve alterações. Atualizando o repositório e executando a pipeline."
        # Resetar as mudanças locais e puxar as novas mudanças
        git reset --hard
        git pull origin main

        # Aqui você adicionaria o comando para executar a pipeline
        # Isso dependerá de como você interage com o Jenkins. Um exemplo poderia ser:
        # curl -X POST http://seu-jenkins:8080/job/seu-job/build?token=SEU_TOKEN
        # Ou se você tiver o CLI do Jenkins configurado:
        # jenkins-cli -s http://seu-jenkins:8080/ build seu-job
    else
        echo "Não houve alterações."
    fi
fi
