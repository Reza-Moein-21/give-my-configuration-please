pipeline {
    agent any
    stages {
        stage('Pull') {
            steps {
                git credentialsId: 'github-pass', url: 'https://github.com/Reza-Moein-21/give-my-configuration-please.git'
            }
        }
        stage('Build') {
            steps {
                sh './build-docker.sh'
            }
        }
        stage('Run') {
            steps {
                sh 'run-docker.sh'
            }
        }
    }
}