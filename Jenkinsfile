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
                    sh 'banner "banner Starting Labrinth..." '
		    sh 'echo "export AWS_ACCESS_KEY_ID=env.AWS_ACCESS_KEY_ID" > aws_src'
		    sh 'echo "export AWS_SECRET_ACCESS_KEY=env.AWS_SECRET_ACCESS_KEY" >> aws_src'
		    sh 'echo "export AWS_DEFAULT_REGION=env.AWS_DEFAULT_REGION" >> aws_src'
		    sh 'echo "export AWS_DEFAULT_OUTPUT=env.AWS_DEFAULT_OUTPUT" >> aws_src'
	            sh 'cat aws_src'
                }
            }
        }
	stage('Build Image') {
	    environment {
                ECR_URI = sh(script:'aws ecr describe-repositories --repository-names env.ECR_REPO | jq ".repositories[].repositoryUri" | tr -d \" ', returnStdout: true).trim()
	    }
	    steps {
		sh 'source src_aws'
	        sh 'aws ecr get-login --no-include-email'
		sh 'docker login'
		sh 'aws configure'
                }
	}
    }
}
