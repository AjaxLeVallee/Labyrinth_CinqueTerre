pipeline {
    agent any
    environment {
       AWS_DEFAULT_REGION="us-east-1"
       AWS_DEFAULT_OUTPUT="json"
       AWS_ACCESS_KEY_ID=credentials('AWS_ACCESS_KEY_ID')
       AWS_SECRET_ACCESS_KEY=credentials('AWS_SECRET_ACCESS_KEY')
       ECR_REPO="labyrinth"
       ECR_URI="221736926476.dkr.ecr.us-east-1.amazonaws.com/${env.ECR_REPO}"
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
	    steps {
	        sh "aws ecr get-login --no-include-email"
                sh "docker build . -t '${env.ECR_URI}:${env.BUILD_NUMBER}'"
                sh "docker push '${env.ECR_URI}:${env.BUILD_NUMBER}'"
	    }
	}
	stage('Trigger Build') {
	    steps {
                sh 'sed -e "s;%BUILD_NUMBER%;${envBUILD_NUMBER};g" -e "s;%ECR_URI%;${env.ECR_URI};g" ECS.json > ${env.ECR_REPO}-v_${env.BUILD_NUMBER}.json'
	        sh "echo HI"
	    }
	}
    }
}
