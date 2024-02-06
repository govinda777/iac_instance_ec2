# iac_instance_ec2
Simple ec2 

aws configure

terraform init

terraform plan

terraform apply

## Pipeline

1 - Suba o Jenkins

docker build -t jenkins-local -f jenkins.Dockerfile .
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins-local

2 - 


https://a7c4-2804-7f0-6883-dbae-58cc-889f-c761-c862.ngrok-free.app/