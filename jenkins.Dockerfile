FROM jenkins/jenkins:lts

USER root

# Instalar plugins do Jenkins
RUN jenkins-plugin-cli --plugins github \
    kubernetes-cli:1.12.1 \
    kubernetes-credentials:0.11 \
    kubernetes-credentials-provider:1.258.v95949f923a_a_e

# Instalar dependências necessárias, se houver
RUN apt-get update && apt-get install -y apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Baixar e instalar o kubectl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && apt-get install -y kubectl

# Limpar cache do APT
RUN apt-get clean

# Mudar de volta para o usuário Jenkins
USER jenkins

# Expor as portas padrão do Jenkins
EXPOSE 8080 50000
