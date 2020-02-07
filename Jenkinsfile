
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
