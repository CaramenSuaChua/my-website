pipeline {
    agent any

    environment {
        IMAGE_NAME = "caramensuachua/my-website"
        DOCKER_REGISTRY = "docker.io"
        EC2_USER = "ubuntu"
        EC2_IP = "54.169.191.228"
    }

    stages {

        stage('Build And Push Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'docker-hub2', url: '') {
                    sh "docker build -t ${IMAGE_NAME} ."
                    sh "docker push ${IMAGE_NAME}"
                }
            }
        }

        stage('Deploy to Docker Swarm') {
            steps {
                sshagent(['server-dev']) {
                    sh """
                        ssh -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_IP} '
                        sudo su
                        docker service update --image=${IMAGE_NAME} my-website
                        '
                    """
                }
            }
        }

    }
}
