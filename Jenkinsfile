pipeline {
  agent {
    dockerfile {
      filename 'build/andykmilespy.Dockerfile'
    }

  }
  stages {
    stage('build image') {
      steps {
        sh 'docker run --rm -i hadolint/hadolint < builds/andykmilespy.Dockerfile'
      }
    }

  }
}