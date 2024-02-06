# Clonando o primeiro repositório
echo 'Cloning iac_instance_ec2 repository...'
rm -rf iac_instance_ec2 && git clone https://github.com/govinda777/iac_instance_ec2.git iac_instance_ec2

# Clonando o segundo repositório
echo 'Cloning demo-tf-controller repository...'
rm -rf demo-tf-controller && git clone https://github.com/govinda777/demo-tf-controller.git demo-tf-controller

# Listando diretórios e seus conteúdos de forma recursiva
echo 'Listing cloned directories and their contents recursively...'
ls -lR

# Verificando se os diretórios existem
echo 'Checking for directories...'

if [ ! -d "iac_instance_ec2" ] || [ ! -d "demo-tf-controller" ]; then
    echo "One or more directories do not exist."
    exit 1
else
    echo "Both directories exist."
fi
