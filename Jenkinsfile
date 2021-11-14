pipeline {
    agent any
    environment {
       AWS_DEFAULT_REGION="us-east-1"
       AWS_DEFAULT_OUTPUT="json"
       ECR_REPO="labyrinth"
       CLUSTER="Lab-cluser"
       SERVICE="lab-api"
       }
    stages {
        stage('Env Setup Complete') {
            steps {
	        script {
                    sh 'banner "banner Starting Labrinth..." '
                }
            }
        }
	stage('Build Image') {
	    steps {
	        sh 'aws --profile Lab ecr get-login --no-include-email'
		sh 'docker login'
		sh 'aws configure'
                ECR_URI = sh(script:'aws --profile Lab ecr describe-repositories --repository-names env.ECR_REPO | jq ".repositories[].repositoryUri" | tr -d \" ', returnStdout: true).trim()
                }

	    }
	}
    }
}
