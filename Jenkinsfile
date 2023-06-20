pipeline {
    agent any

    stages {
        stage('Checkout API') {
            steps {
                git 'https://github.com/marcoservio/catalogo-carros.git'
            }
        }

        stage('Restore') {
            steps {
                 dir('catalogo-carro/src') {                    
                    sh 'dotnet restore'
                }
            }
        }

        stage('Build') {
            steps {
                sh 'dotnet build'
            }
        }

        stage('Test') {
            steps {
                sh 'dotnet test'
            }
        }

        // stage('Publish') {
        //     environment {
        //         // Definir as variáveis de ambiente necessárias para o push no Docker Hub
        //         registry = 'marcoservio/catalogo-carros'
        //         dockerImage = ''
        //     }
        //     steps {
        //         // Construir a imagem Docker
        //         sh 'dotnet publish -c Release -o publish'
        //         sh 'docker build -t $registry:$BUILD_NUMBER .'
                
        //         // Fazer login no Docker Hub
        //         withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
        //             sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
        //         }
                
        //         // Fazer o push da imagem Docker para o Docker Hub
        //         sh 'docker push $registry:$BUILD_NUMBER'
        //     }
        // }
    }
}