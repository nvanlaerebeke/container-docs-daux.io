pipeline {
  agent {
    kubernetes {
      yaml """
kind: Pod
metadata:
  name: kaniko
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:latest
    imagePullPolicy: Always
    command:
    - /busybox/cat
    tty: true
"""
    }
  }
  stages {
    stage('build') {
      steps {
        container(name: 'kaniko', shell: '/busybox/sh') {
            sh 'ls -lah'
            sh 'pwd'
            sh """
            #!/busybox/sh 
            /kaniko/executor --dockerfile Dockerfile --context `pwd`/ --verbosity debug --destination registry.crazyzone.be/daux.io:latest
            """
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