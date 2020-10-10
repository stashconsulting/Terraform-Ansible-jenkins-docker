FROM jenkinsci/blueocean:1.23.2

USER root

RUN apk update

RUN apk add ansible

RUN apk add openssh

ENV JAVA_OPTS "$JAVA_OPTS -Djenkins.install.runSetupWizard=false"
