FROM jenkinsci/blueocean:1.23.2

USER root

ENV JAVA_OPTS "$JAVA_OPTS -Djenkins.install.runSetupWizard=false"
