pipeline {
  agent {
    kubernetes {
      label 'agent'
      yaml '''
kind: Pod
metadata:
  name: kaniko
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug-539ddefcae3fd6b411a95982a830d987f4214251
    imagePullPolicy: Always
    command:
    - cat
    tty: true
'''
    }
  }
  stages {
    stage('Build with Kaniko') {
      steps {
        git(url: 'https://github.com/nvanlaerebeke/containers-docs-daux.io', credentialsId: 'github')
        container(name: 'kaniko') {
          sh '''
            /kaniko/executor \
            --dockerfile `pwd`/Dockerfile \
            --context `pwd` \
            --destination=$REPO/$NAME:$TAG
            '''
        }        
      }
    }
  }
  parameters {
    string(defaultValue: 'registry.crazyzone.be', name: 'REPO', trim: true)
    string(defaultValue: 'daux.io', name: 'NAME', trim: true)
    string(defaultValue: 'latest', name: 'TAG', trim: true)
  }
}