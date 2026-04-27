pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "prakharvs/webserver"
        DOCKER_CREDENTIALS = "docker_credentials"
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

        // 🔥 LOCAL RUN (NO EC2)
        stage('Run Container Locally') {
            steps {
                bat """
                docker stop webserver || exit 0
                docker rm webserver || exit 0
                docker run -d -p 8080:80 --name webserver %DOCKER_IMAGE%:latest
                """
            }
        }

        stage('Show URL') {
            steps {
                echo "🌐 App running at: http://localhost:8080"
            }
        }
    }
}