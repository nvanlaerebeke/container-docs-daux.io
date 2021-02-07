pipeline {
  agent any
  stages {
    stage('Message') {
      steps {
        echo 'Start'
      }
    }

    stage('build') {
      steps {
        sh '''find . 
make push'''
      }
    }

  }
}