pipeline {
  agent {
    kubernetes {
      label 'agent'
      yamlFile 'build.yaml'
    }
  }
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