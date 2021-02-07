pipeline {
  agent any
  stages {
    stage('Message') {
      steps {
        echo 'Start Building Container'
      }
    }

    stage('build') {
      steps {
        sh 'make push'
      }
    }

  }
}