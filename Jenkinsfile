
pipeline {
  agent {
    label 'maven'
  }
    stages {
      stage('Build App') {
        steps {
          checkout scm
          sh "mvn install -DskipTests=true"
        }
      }

    stage('Build Image') {
      steps {
        script {
          openshift.withCluster() {
            openshift.withProject("vpogu-springboot") {
              openshift.selector("bc", "springboot-s2i").startBuild("--from-dir='.'").logs("-f")
              def version = openshift.selector("bc", "springboot-s2i").object().status.lastVersion
              def build = openshift.selector("build", "springboot-s2i-${version}").object()
              if (build.status.phase != 'Complete'){
                 currentBuild.result = "FAILURE"
                 throw new Exception(build.status.message)
              }
            }
          }
        }
      }
    }

    stage('Deploy DEV') {
      steps {
        script {
          openshift.withCluster() {
            openshift.withProject("vpogu-springboot") {
              openshift.selector("dc", "springboot-s2i").rollout().latest();
            }
          }
        }
      }
    }
  }
}
