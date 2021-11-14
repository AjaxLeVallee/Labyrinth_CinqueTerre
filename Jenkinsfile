pipeline {
    agent any
    environment {
       AWS_DEFAULT_REGION=us-east-1
       AWS_DEFAULT_OUTPUT=json
       ECR_REPO="labyrinth"
       CLUSTER=Lab-cluser
       SERVICE=lab-api
       }
    stages {
        stage('Env Setup Complete') {
            steps {
                banner 'banner Starting Labrinth...'
            }
        }
	stage('Build Image') {
	    steps {
		aws ecr get-login --no-include-email
	        echo env.ECR_REPO
                EVR_URI = sh(returnStdout: true, script: 'aws ecr describe-repositories --repository-names env.ECR_REPO | jq .repositories[].repositoryUri)
		 echo env.ECR_URI
                docker images ls
                docker build . -t env.ECR_URI:env.BUILD_NUMBER
                docker push env.ECR_URI:env.BUILD_NUMBER
	    }
	}
    }
}
