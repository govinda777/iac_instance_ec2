FROM jenkins/jenkins:lts

USER root

# Instalar plugins do Jenkins
RUN jenkins-plugin-cli --plugins github \
    kubernetes-cli:1.12.1 \
    kubernetes-credentials:0.11 \
    kubernetes-credentials-provider:1.258.v95949f923a_a_e

# Baixar e instalar o kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

# Criar diretório .kube para armazenar o config
RUN mkdir /var/jenkins_home/.kube

# Mudar de volta para o usuário Jenkins
USER jenkins

# Expor as portas padrão do Jenkins
EXPOSE 8080 50000
