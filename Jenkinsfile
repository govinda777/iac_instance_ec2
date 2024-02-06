pipeline {
    agent any

    stages {
        stage('Download Repositories') {
            steps {
                script {
                    // Clonando o primeiro repositório
                    echo 'Cloning iac_instance_ec2 repository...'
                    sh 'rm -rf iac_instance_ec2 && git clone https://github.com/govinda777/iac_instance_ec2.git iac_instance_ec2'

                    // Clonando o segundo repositório
                    echo 'Cloning demo-tf-controller repository...'
                    sh 'rm -rf demo-tf-controller && git clone https://github.com/govinda777/demo-tf-controller.git demo-tf-controller'

                    // Listando diretórios
                    echo 'Listing cloned directories...'
                    sh 'ls -l'

                    // Verificando se os diretórios existem
                    echo 'Checking for directories...'
                    sh '''
                    if [ ! -d "iac_instance_ec2" ] || [ ! -d "demo-tf-controller" ]; then
                        echo "One or more directories do not exist."
                        exit 1
                    else
                        echo "Both directories exist."
                    fi
                    '''
                }
            }
        }
        stage('Get Plan to the TF CONTROLLER') {
            steps {
                script {
                    // Substitua com os comandos para gerar o plano Terraform
                    echo 'Generating Terraform plan...'
                    // sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Save Plan in Repo') {
            steps {
                script {
                    // Substitua com comandos para salvar o plano no repositório, como um commit
                    echo 'Saving plan in the repo...'
                    // sh '''
                    // git add tfplan
                    // git commit -m "Add Terraform plan"
                    // git push origin master
                    // '''
                }
            }
        }
        stage('Execute Policie') {
            steps {
                script {
                    // Substitua com os comandos para executar as políticas
                    echo 'Executing policies...'
                    // sh 'checkov -d .'
                }
            }
        }
        stage('Execute Sync Terraform in Cloud AWS') {
            steps {
                script {
                    // Substitua com os comandos para aplicar as mudanças no AWS
                    echo 'Applying changes in AWS...'
                    // sh 'terraform apply tfplan'
                }
            }
        }
        stage('Save tfstate in S3') {
            steps {
                script {
                    // Substitua com os comandos para salvar o estado do Terraform no S3
                    echo 'Saving Terraform state in S3...'
                    // sh 'terraform state push'
                }
            }
        }
    }
    post {
        success {
            script {
                echo 'Success!'
                // Coloque aqui os comandos para executar se a pipeline for bem-sucedida
            }
        }
        failure {
            script {
                echo 'Failure!'
                // Coloque aqui os comandos para executar se a pipeline falhar
            }
        }
    }
}
