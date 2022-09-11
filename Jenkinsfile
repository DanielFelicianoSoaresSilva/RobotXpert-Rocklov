pipeline {
    agent {
        docker { image 'python' }
    }

    stages {
        stage('Preparation') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run API tests') {
            steps {
                sh 'cd backend && robot -d ./logs tests'
            }
        }
        stage('Run UI tests') {
            steps {
                sh 'cd frontend && robot -d ./logs tests'
            }
        }
    }
}
