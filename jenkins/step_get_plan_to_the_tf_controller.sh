#!/bin/bash

echo 'call TF Controller to get plan'

echo 'Obtendo o ID do plano do TF Controller...'

# Executar o comando para obter o ID do plano
PLAN_ID=$(kubectl get terraform iac-instance-ec2 -n flux-system -o jsonpath='{.spec.approvePlan}')

echo "ID do Plano: $PLAN_ID"

# Caminho para o arquivo iac-instance-ec2_terraform.yaml no repositório local
YAML_FILE="/path/to/demo-tf-controller/flux_tf_controller/clusters/my-cluster/gitrepositories/iac-instance-ec2_terraform.yaml"

# Atualizar o arquivo YAML com o ID do plano
sed -i "s/^\(\s*approvePlan:\s*\).*$/\1\"$PLAN_ID\"/" $YAML_FILE

echo "Arquivo YAML atualizado com o ID do plano."

# Navegar para o diretório do repositório
cd /path/to/demo-tf-controller

# Adicionar, commitar e enviar as alterações
git add $YAML_FILE
git commit -m "Atualizando approvePlan para $PLAN_ID"
git push origin main

echo "Alterações enviadas para o repositório."
