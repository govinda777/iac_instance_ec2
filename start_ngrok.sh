#!/bin/bash

# Defina a porta em que o Jenkins está rodando localmente.
# O Jenkins por padrão roda na porta 8080.
JENKINS_PORT=8080

# Inicie o ngrok
echo "Iniciando ngrok para expor a porta $JENKINS_PORT..."
./ngrok http $JENKINS_PORT

# O comando acima irá iniciar o ngrok e expor a porta 8080 para a internet.
# A URL pública será exibida no console e pode ser usada para acessar o Jenkins remotamente.
