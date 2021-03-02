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
    image: gcr.io/kaniko-project/executor:debug-539ddefcae3fd6b411a95982a830d987f4214251
    imagePullPolicy: Always
    command:
    - cat
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
            /kaniko/executor --dockerfile Dockerfile --context `pwd`/ --verbosity debug --insecure --skip-tls-verify --destination gcr.io/cloudorbit/app/dev/jenkinsapp:$BUILD_NUMBER --destination gcr.io/cloudorbit/app/dev/jenkinsapp:latest
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