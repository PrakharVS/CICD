pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "prakharvs/webserver"
        DOCKER_CREDENTIALS = "docker_credentials"
        EC2_IP = "65.2.134.81"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'master', url: 'https://github.com/PrakharVS/CICD.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat """
                docker build -t %DOCKER_IMAGE%:%BUILD_NUMBER% .
                docker tag %DOCKER_IMAGE%:%BUILD_NUMBER% %DOCKER_IMAGE%:latest
                """
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: DOCKER_CREDENTIALS,
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    bat """
                    echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin
                    """
                }
            }
        }

        stage('Push Image') {
            steps {
                bat """
                docker push %DOCKER_IMAGE%:%BUILD_NUMBER%
                docker push %DOCKER_IMAGE%:latest
                """
            }
        }

        // 🔥 ADD THIS STAGE
        stage('Check Terraform') {
            steps {
                bat "terraform -v"
            }
        }

        stage('Terraform Deploy') {
            steps {
                    bat """
                    terraform init
                    terraform taint null_resource.deploy
                    terraform apply -auto-approve -var="ec2_ip=%EC2_IP%"
                    """
            }
        }

        stage('Show Deployment URL') {
            steps {
                echo "🌐 Deployment Successful!"
                echo "👉 Open: http://${EC2_IP}"
            }
        }
    }
}