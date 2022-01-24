pipeline {
    agent any
    environment {
       VERSION='1.0.0'
       NAME='config-server'
    }
    stages {
        stage('PULL FROM GIT') {
            steps {
                git credentialsId: 'github-pass', url: 'https://github.com/Reza-Moein-21/give-my-configuration-please.git'
            }
        }
        stage('BUILD IMAGE') {
            steps {
                sh 'docker build --rm -t $NAME:$VERSION .'
            }
        }

        stage('STOP CURRENT CONTAINER') {
            steps {
                sh 'docker stop $NAME > /dev/null && echo Container $NAME stopped'
            }
        }

        stage('RUN NEW CONTAINER') {
            steps {
                sh '''
                    docker container run \
                    --rm -d \
                    --name $NAME \
                    --network reza-net \
                    -p 9002:9002 \
                    --ip 10.10.1.2 \
                    $NAME:$VERSION > /dev/null && echo Container $NAME is running
                '''
            }
        }
    }

    post {
       success {
                sh 'docker image rm -f $(docker images --filter "dangling=true" -q --no-trunc) > /dev/null && echo untag images removed'
            }
       }
}