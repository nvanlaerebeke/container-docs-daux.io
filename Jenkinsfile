pipeline {
  agent {
    kubernetes {
      yaml '''
kind: Pod
metadata:
  name: kaniko
spec:
  volumes:
    - name: kaniko-cache
      nfs: 
        server: nas.crazyzone.be 
        path: /volume1/docker-storage/kaniko/cache
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug-539ddefcae3fd6b411a95982a830d987f4214251
    imagePullPolicy: Always
    command:
    - cat
    tty: true
    volumeMounts:
    - name: kaniko-cache
      mountPath: /cache
  - name: kaniko-warmer
    image: gcr.io/kaniko-project/warmer:eda57e5400e4cdecccb2a3d9db445e57e81a9c4f
    imagePullPolicy: Always
    command:
    - cat
    tty: true
    volumeMounts:
    - name: kaniko-cache
      mountPath: /cache
'''
    }

  }
  stages {
    stage('build') {
      steps {
container(name: 'kaniko', shell: '/busybox/sh') {
          sh '''#!/busybox/sh 
/kaniko/warmer --cache-dir=/cache --image=php:7-cli          
            '''
        }        
        container(name: 'kaniko', shell: '/busybox/sh') {
          sh '''#!/busybox/sh 
/kaniko/executor --dockerfile Dockerfile --context `pwd`/ --verbosity debug --destination registry.crazyzone.be/daux.io:latest --cache=true --cache-repo registry.crazyzone.be/cache
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