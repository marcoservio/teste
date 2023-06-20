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

        stage('Up MySQL') {
            steps {
                dir('src') {
                    sh 'docker-compose up -d'
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

        stage('Down MySQL') {
            steps {
                dir('src') {
                    sh 'docker-compose down'
                }
            }
        }

        stage('Publish') {
            steps {
                dir('src') {
                    sh 'dotnet publish -c Release -o publish'
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    dockerapp = docker.build("marcoservio/catalogo-carros:${env.BUILD_ID}", '-f ./src/Dockerfile ./src')
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com/', 'dockerhub') {
                        dockerapp.push('latest')
                        dockerapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }
    }
}