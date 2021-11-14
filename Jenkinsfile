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
		# eval $(aws ecr get-login --no-include-email)
	        echo env.ECR_REPO
                ECR_URI=$(aws ecr describe-repositories \
                  --repository-names env.ECR_REPO \
                 | jq .repositories[].repositoryUri \
                 | tr -d '"')
                docker images ls
                docker build . -t "${ECR_URI}:${BUILD_NUMBER}"
                docker push ${ECR_URI}:${BUILD_NUMBER}
	    }
	}
    }
}
