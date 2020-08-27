FROM jenkinsci/blueocean:1.23.2

ENV JAVA_OPTS "$JAVA_OPTS -Djenkins.install.runSetupWizard=false"
