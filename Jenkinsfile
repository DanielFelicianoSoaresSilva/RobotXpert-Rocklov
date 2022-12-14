pipeline {
    agent {
        docker { image 'python' }
    }

    stages {
        stage('Preparation') {
            steps {
                sh 'curl -fsSL https://deb.nodesource.com/setup_16.x | bash -'
                sh 'apt-get install -y nodejs'
                sh 'apt-get install -y xvfb ca-certificates net-tools netcat gnupg ffmpeg libgtk-3-0 libgdk-pixbuf2.0-dev libxcomposite-dev libdbus-glib-1-2 libatk-bridge2.0-0 wget libgbm1 libnss3 libxss1 libasound2'
                sh 'pip install -r requirements.txt'
                sh 'rfbrowser init'
            }
        }
        stage('Run API tests') {
            steps {
                sh 'cd backend && robot -d ./logs tests'
            }
        }
        stage('Run UI tests') {
            steps {
                sh 'cd frontend && robot -d ./logs -v headless:True tests'
            }
        }
    }
    post {
        always {
            robot archiveDirName: 'robot-plugin', logFileName: '**/logs/log.html', otherFiles: '**/logs/**/*.png', outputFileName: '**/logs/output.xml', outputPath: '', overwriteXAxisLabel: '', reportFileName: '**/logs/report.html'
            chuckNorris()
        }
    }
}
