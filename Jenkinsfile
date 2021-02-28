pipeline {
  agent {
    kubernetes {
      label 'agent'
      yamlFile 'build.yaml'
    }

  }
  stages {
    stage('build') {
      steps {
        sh 'make push'
      }
    }

  }
}