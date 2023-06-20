pipeline {
    agent any

    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout') {
            steps {
                git 'https://github.com/marcoservio/catalogo-carros.git'
            }
        }

        stage('Restore') {
            steps {
                dir('src') {                    
                    sh 'dotnet restore'
                }
            }
        }

        stage('Build') {
            steps {
                dir('src') {
                    sh 'dotnet build'
                }
            }
        }

        stage('Start MySQL Docker') {
            steps {
                dir('src') {
                    sh 'docker-compose up -d mysql'
                }
            }
        }

        stage('Test') {
            steps {
                dir('src') {
                    sh 'dotnet test'
                }
            }
        }

        stage('Cleanup Docker') {
            steps {
                dir('src') {
                    sh 'docker-compose down'
                }
            }
        }

        stage('Publish') {
            environment {
                // Definir as variáveis de ambiente necessárias para o push no Docker Hub
                registry = 'marcoservio/catalogo-carros'
                dockerImage = ''
            }
            steps {
                // Construir a imagem Docker
                sh 'dotnet publish -c Release -o publish'
                sh 'docker build -t $registry:$BUILD_NUMBER .'
                
                // Fazer login no Docker Hub
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                }
                
                // Fazer o push da imagem Docker para o Docker Hub
                sh 'docker push $registry:$BUILD_NUMBER'
            }
        }
    }
}