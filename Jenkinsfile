pipeline {
    agent any

    stages {
        stage('Download Repositories') {
            steps {
                script {
                    echo 'Download Repositories...'
                    // Dando permissão de execução ao script e depois executando-o
                    sh '''
                    chmod +x ./jenkins/step_Download_Repositories.sh
                    ./jenkins/step_Download_Repositories.sh
                    '''
                }
            }
        }
        stage('Get Plan to the TF CONTROLLER') {
            steps {
                script {

                    echo 'Get Plan to the TF CONTROLLER...'
                    // Dando permissão de execução ao script e depois executando-o
                    sh '''
                    chmod +x ./jenkins/step_get_plan_to_the_tf_controller.sh
                    ./jenkins/step_get_plan_to_the_tf_controller.sh
                    '''
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
