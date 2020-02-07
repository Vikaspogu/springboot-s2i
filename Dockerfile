FROM openshift/openjdk-11-rhel7:1.0
COPY target/springboot-demo-0.0.1-SNAPSHOT.jar /deployments/
