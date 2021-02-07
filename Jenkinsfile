pipeline {
  agent {
    docker {
      image 'docker'
    }

  }
  stages {
    stage('Message') {
      steps {
        echo 'Start'
      }
    }

    stage('build') {
      steps {
        sh '''env


while [ TRUE ];
do
    echo waiting
    sleep 1
done
'''
      }
    }

  }
}