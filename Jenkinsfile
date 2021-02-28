pipeline {
  environment { 
      REPO = 'registry.crazyzone.be'
      NAME = 'daux.io'
      TAG = "latest"
  }  
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