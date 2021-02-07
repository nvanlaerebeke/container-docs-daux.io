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
ls -l /usr/bin/make
make push'''
      }
    }

  }
}