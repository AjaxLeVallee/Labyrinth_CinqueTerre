pipeline {
    agent any
    stages {
        stage('Env Setup') {
            steps {
                sh '''
                    banner 'banner Starting Labrinth...'
                    export AWS_DEFAULT_REGION=us-east-1
		    export AWS_DEFAULT_OUTPUT=json
		    export ECR_REPO="labyrinth"
		    export CLUSTER=Lab-cluser
		    export SERVICE=lab-api
                '''
            }
        }
	stage('Build Image') {
	    steps {
	    sh '''
		eval $(aws ecr get-login --no-include-email)
	        echo "${ECR_REPO}"
	    '''
	    }
	}
    }
}
