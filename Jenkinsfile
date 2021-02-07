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
        sh 'make push'
      }
    }

  }
}