docker build -t jenkins-local -f jenkins.Dockerfile .

docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins-local

CONTAINER ID = 289c8a8f0d12

docker exec -it 289c8a8f0d12 bash


➜ iac_instance_ec2 (main) ✗ docker exec -it 289c8a8f0d12 bash
jenkins@289c8a8f0d12:/$ at /var/jenkins_home/secrets/initialAdminPassword
bash: at: command not found
jenkins@289c8a8f0d12:/$ cat /var/jenkins_home/secrets/initialAdminPassword
da1f87058d994eceb42a951966e6dbda


$JENKINS_USER = "govinda777""
$JENKINS_PASSWORD = "hermes1"



