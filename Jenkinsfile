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
                script {
                    try {
                        git 'https://github.com/marcoservio/catalogo-carros.git'
                    } catch (Exception e) {
                        slackSend (color: 'error', message: "[ FALHA ] Não foi possivel fazer o checkout - ${BUILD_URL} em ${currentBuild.duration}s", tokenCredentialId: 'slack-token')
                        sh "echo $e"
                        currentBuild.result = 'ABORTED'
                        error('Erro')
                    }
                }
            }
        }

        stage('Restore') {
            steps {
                script {
                    dir('src') {     
                        try {               
                            sh 'dotnet restore'
                        } catch (Exception e) {
                            slackSend (color: 'error', message: "[ FALHA ] Não foi possivel fazer o restore - ${BUILD_URL} em ${currentBuild.duration}s", tokenCredentialId: 'slack-token')
                            sh "echo $e"
                            currentBuild.result = 'ABORTED'
                            error('Erro')
                        }
                    }
                }
            }
        }

        stage('Up MySQL') {
            steps {
                script {
                    dir('src') {
                        try {
                            sh 'docker-compose up -d'
                        } catch (Exception e) {
                            slackSend (color: 'error', message: "[ FALHA ] Não foi possivel fazer subir o Banco de Dados MySQL - ${BUILD_URL} em ${currentBuild.duration}s", tokenCredentialId: 'slack-token')
                            sh "echo $e"
                            currentBuild.result = 'ABORTED'
                            error('Erro')
                        }
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    dir('tests') {
                        try {
                            sh 'dotnet test'
                        } catch (Exception e) {
                            slackSend (color: 'error', message: "[ FALHA ] Não foi possivel executar os testes - ${BUILD_URL} em ${currentBuild.duration}s", tokenCredentialId: 'slack-token')
                            sh "echo $e"
                            currentBuild.result = 'ABORTED'
                            error('Erro')
                        }
                    }
                }
            }
        }

        stage('Down MySQL') {
            steps {
                script {
                    dir('src') {
                        try {
                            sh 'docker-compose down'
                        } catch (Exception e) {
                            slackSend (color: 'error', message: "[ FALHA ] Não foi possivel remover o Banco de Dados MySQL - ${BUILD_URL} em ${currentBuild.duration}s", tokenCredentialId: 'slack-token')
                            sh "echo $e"
                            currentBuild.result = 'ABORTED'
                            error('Erro')
                        }
                    }
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    dir('src') {
                        try {
                            sh 'dotnet build'
                        } catch (Exception e) {
                            slackSend (color: 'error', message: "[ FALHA ] Não foi possivel fazer o build - ${BUILD_URL} em ${currentBuild.duration}s", tokenCredentialId: 'slack-token')
                            sh "echo $e"
                            currentBuild.result = 'ABORTED'
                            error('Erro')
                        }
                    }
                }
            }
        }        

        stage('Publish') {
            steps {
                script {
                    dir('src') {
                        try {
                            sh 'dotnet publish -c Release -o publish'
                        } catch (Exception e) {
                            slackSend (color: 'error', message: "[ FALHA ] Não foi possivel fazer o publish - ${BUILD_URL} em ${currentBuild.duration}s", tokenCredentialId: 'slack-token')
                            sh "echo $e"
                            currentBuild.result = 'ABORTED'
                            error('Erro')
                        }
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    try {
                        dockerapp = docker.build("marcoservio/catalogo-carros:${env.BUILD_ID}", '-f ./src/Dockerfile ./src')
                    } catch (Exception e) {
                            slackSend (color: 'error', message: "[ FALHA ] Não foi possivel fazer o build do Docker - ${BUILD_URL} em ${currentBuild.duration}s", tokenCredentialId: 'slack-token')
                            sh "echo $e"
                            currentBuild.result = 'ABORTED'
                            error('Erro')
                    }
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    try {                    
                    docker.withRegistry('https://registry.hub.docker.com/', 'dockerhub') {
                        dockerapp.push('latest')
                        dockerapp.push("1.1.${env.BUILD_ID}")
                    }
                    } catch (Exception e) {
                            slackSend (color: 'error', message: "[ FALHA ] Não foi possivel fazer o push do Docker - ${BUILD_URL} em ${currentBuild.duration}s", tokenCredentialId: 'slack-token')
                            sh "echo $e"
                            currentBuild.result = 'ABORTED'
                            error('Erro')
                    }
                }
            }
        }

        stage('Down API') {
            steps {
                script {
                    dir('helm') {
                        try {      
                            withKubeConfing([credentialsId: 'kube-config']) {        
                                sh 'helm uninstall -n catalogo-carros catalogo-carros'
                            }
                        } catch (Exception e) {
                                sh "echo $e"
                        }
                    }
                }
            }
        }

        stage('Up API') {
            steps {
                script {
                    dir('helm') {
                        try {       
                            withKubeConfing([credentialsId: 'kube-config']) {
                               sh 'helm install -n catalogo-carros catalogo-carros catalogo-carros'
                            }
                        } catch (Exception e) {
                                slackSend (color: 'error', message: "[ FALHA ] Não foi possivel subir a API - ${BUILD_URL} em ${currentBuild.duration}s", tokenCredentialId: 'slack-token')
                                sh "echo $e"
                                currentBuild.result = 'ABORTED'
                                error('Erro')
                        }
                    }
                }
            }
        }
        
        stage('Notificando') {
            steps {
                slackSend (color: 'good', message: '[ Sucesso ] O novo build esta disponivel em: http://localhost/swagger ', tokenCredentialId: 'slack-token')
            }
        }
    }
}