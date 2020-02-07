FROM registry.redhat.io/openshift/openjdk-11-rhel7:1.0
RUN pwd && ls
COPY target/springboot-demo-0.0.1-SNAPSHOT.jar deployments/
