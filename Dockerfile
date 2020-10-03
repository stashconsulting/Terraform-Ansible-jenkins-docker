FROM jenkinsci/blueocean:1.23.2

USER root

ENV JAVA_OPTS "$JAVA_OPTS -Djenkins.install.runSetupWizard=false"

COPY plugins.txt /usr/share/jenkins/ref/

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
