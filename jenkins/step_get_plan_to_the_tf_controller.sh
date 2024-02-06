#!/bin/bash

echo 'call TF Controller to get plan'

echo "Debug: PATH is $PATH"
which kubectl
kubectl version --client

echo 'Obtendo o ID do plano do TF Controller...'

OUTPUT=$(kubectl get terraform -n flux-system)

# Extrair o ID do plano usando grep e awk
PLAN_ID=$(echo "$OUTPUT" | grep 'iac-instance-ec2' | awk -F 'approvePlan: "' '{print $2}' | awk -F '"' '{print $1}')

echo "ID do Plano: $PLAN_ID"

# Caminho para o arquivo iac-instance-ec2_terraform.yaml no repositório local
YAML_FILE="demo-tf-controller/flux_tf_controller/clusters/my-cluster/gitrepositories/iac-instance-ec2_terraform.yaml"

# Atualizar o arquivo YAML com o ID do plano
sed -i "s/^\(\s*approvePlan:\s*\).*$/\1\"$PLAN_ID\"/" $YAML_FILE

echo "Arquivo YAML atualizado com o ID do plano."

# Navegar para o diretório do repositório
cd demo-tf-controller

# Adicionar, commitar e enviar as alterações
git add $YAML_FILE
git commit -m "Atualizando approvePlan para $PLAN_ID"
git push origin main

echo "Alterações enviadas para o repositório."
