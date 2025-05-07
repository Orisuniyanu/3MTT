pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'orisuniyanu/my-app'
        DOCKERFILE_PATH = './Dockerfile'
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_CREDENTIALS_ID = 'docker-credentials-id'
        SNYK_TOKEN = credentials('snyk-api-token')
        VM_USER = 'iemmanuel'
        VM_HOST = '192.168.126.131'
        VM_DEPLOY_DIR = '/home/iemmanuel/website'
        SSH_CREDENTIALS_ID = 'ssh-vm-creds-id'
    }

    stages {

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE_NAME} -f ${DOCKERFILE_PATH} ."
                }
            }
        }

        stage('Scan with Snyk') {
            steps {
                withCredentials([string(credentialsId: 'snyk-api-token', variable: 'SNYK_TOKEN')]) {
                    sh 'snyk auth $SNYK_TOKEN'
                    sh "snyk test --docker ${DOCKER_IMAGE_NAME} || true"
                }
            }
        }
    }
}