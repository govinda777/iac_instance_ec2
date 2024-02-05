# Usar a imagem oficial do Jenkins
FROM jenkins/jenkins:lts

# O usuário root é necessário para instalar plugins e fazer outras configurações
USER root

# Instalar o plugin do GitHub
RUN jenkins-plugin-cli --plugins github

# Mudar para o usuário Jenkins para segurança
USER jenkins

# Expor a porta 8080 para acesso ao servidor web e a porta 50000 para agentes Jenkins
EXPOSE 8080 50000

# O ponto de entrada padrão da imagem Jenkins inicia o servidor
