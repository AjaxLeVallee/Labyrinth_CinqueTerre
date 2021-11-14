pipeline {
    agent any
    environment {
       AWS_DEFAULT_REGION="us-east-1"
       AWS_DEFAULT_OUTPUT="json"
       AWS_ACCESS_KEY_ID=credentials('AWS_ACCESS_KEY_ID')
       AWS_SECRET_ACCESS_KEY=credentials('AWS_SECRET_ACCESS_KEY')
       ECR_REPO="labyrinth"
       CLUSTER="Lab-cluser"
       SERVICE="lab-api"
       }
    stages {
        stage('Env Setup Complete') {
            steps {
	        script {
		    sh 'source /var/lib/jenkins/src_aws'
                    sh 'banner "banner Starting Labrinth..." '
                }
            }
        }
	stage('Build Image') {
	    environment {
                ECR_URI = sh(script:"aws ecr describe-repositories --repository-names env.ECR_REPO | jq '.repositories[].repositoryUri' | tr -d \" ", returnStdout: true).trim()
	    }
	    steps {
	        sh 'aws ecr get-login --no-include-email'
                }
	}
    }
}
