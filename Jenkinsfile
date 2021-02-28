pipeline {
  properties([parameters([string(defaultValue: 'repo.crazyzone.be', name: 'REPO', trim: true), string(defaultValue: 'daux.io', name: 'NAME', trim: true), string(defaultValue: 'latest', name: 'TAG', trim: true)])])
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