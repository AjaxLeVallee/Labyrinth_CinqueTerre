pipeline {
    agent any
    stages {
        stage('Env Setup') {
            steps {
                sh '''
                    banner 'banner Starting Labrinth...'
                    export AWS_DEFAULT_REGION=us-east-1
		    export AWS_DEFAULT_OUTPUT=json
		    ECR_REPO="labyrinth"
		    CLUSTER=Lab-cluser
		    SERVICE=lab-api
		    eval $(aws ecr get-login --no-include-email)
                '''
            }
        }
	stage('Build Image') {
	    steps {
	    sh '''
	        echo "${ECR_REPO}"
	    '''
	    }
	}
    }
}
