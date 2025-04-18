pipeline {
    agent any

    environment {
        IMAGE_NAME = "caramensuachua/my-website"
        DOCKER_REGISTRY = "docker.io"
        EC2_USER = "ubuntu"
        EC2_IP = "172.31.30.198"
    }

    stages {

        stage('Build And Push Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                    sh "docker push ${IMAGE_NAME}"
                }
            }
        }

        // stage('Deploy to Docker Swarm') {
        //     steps {
        //         sshagent(['ec2-ssh-key']) {
        //             sh """
        //                 ssh -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_IP} '
        //                 sudo docker service update --image=${IMAGE_NAME} my-website
        //                 '
        //             """
        //         }
        //     }
        // }

    }
}
