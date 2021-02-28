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
        sh 'REPO=$REPO NAME=$NAME TAG=$TAG make push'
      }
    }
  }
  parameters {
    string(defaultValue: 'registry.crazyzone.be', name: 'REPO', trim: true)
    string(defaultValue: 'daux.io', name: 'NAME', trim: true)
    string(defaultValue: 'latest', name: 'TAG', trim: true)
  }
}