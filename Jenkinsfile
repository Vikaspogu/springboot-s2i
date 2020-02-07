
pipeline {
  agent {
    label 'maven'
  }
    stages {
      stage('Build App') {
        steps {
          checkout scm
          sh "${mvnCmd} install -DskipTests=true"
        }
      }

    stage('Build Image') {
      steps {
        sh "cp target/openshift-tasks.war target/ROOT.war"
        script {
          openshift.withCluster() {
            openshift.withProject("dev") {
              openshift.selector("bc", "tasks").startBuild("--from-file=target/ROOT.war", "--wait=true")
            }
          }
        }
      }
    }

    stage('Deploy DEV') {
      steps {
        script {
          openshift.withCluster() {
            openshift.withProject("dev") {
              openshift.selector("dc", "tasks").rollout().latest();
            }
          }
        }
      }
    }
  }
}
