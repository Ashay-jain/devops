pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Check out the code from a specific branch on GitHub
                checkout([$class: 'GitSCM', branches: [[name: 'test']], userRemoteConfigs: [[url: 'https://github.com/Ashay-jain/devops.git']]])
            }
        }


        stage('Dockerize') {
            steps {
                // Build Docker image and tag it
                sh 'docker build -t dockerhub-id/test:latest .'
            }
        }
	 stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          sh  'docker push dockerhub-id/test:latest' 
        }
                  
          }
        }
    }
}
