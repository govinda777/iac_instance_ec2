# iac_instance_ec2
Simple ec2 

aws configure

terraform init

terraform plan

terraform apply

## Pipeline

chmod +x build.sh

1 - Suba o Jenkins

docker build -t jenkins-local -f jenkins.Dockerfile .

2 - Pare o Jenkins

docker stop jenkins-local



3 - Suba o Jenkins

> Sem cópia de certificado

docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins-local

> Com cópia de certificado

docker run -d -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v ./kubeconfig:/var/jenkins_home/.kube/config \
  -v /Users/gosouza/.minikube/ca.crt:/var/jenkins_home/.kube/ca.crt \
  -v /Users/gosouza/.minikube/profiles/flux/client.crt:/var/jenkins_home/.kube/client.crt \
  -v /Users/gosouza/.minikube/profiles/flux/client.key:/var/jenkins_home/.kube/client.key \
  --name jenkins-local jenkins-local

docker exec -it jenkins-local bash

4 - Validar se o Jenkins está se comunicando com o Minikube




https://a7c4-2804-7f0-6883-dbae-58cc-889f-c761-c862.ngrok-free.app/