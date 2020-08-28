#!/usr/bin/env groovy

// Jenkinsfile (Declarative Pipeline)
pipeline {
  agent any
  stages {
    stage('building Jenkins image!') {
      steps {
        sh 'docker build -t stashconsulting/jenkins-multibranch-plugin:$BUILD_NUMBER .'
      }
    }
    stage('tagging Jenkins image!') {
      steps {
        sh 'docker tag stashconsulting/jenkins-multibranch-plugin:$BUILD_NUMBER stashconsulting/jenkins-multibranch-plugin:latest .'
      }
    }
    stage('pushing Jenkins image to the registry!') {
      steps {
        withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) {
        sh 'docker push stashconsulting/jenkins-multibranch-plugin:$BUILD_NUMBER'
        sh 'docker push stashconsulting/jenkins-multibranch-plugin:latest'
      }
    }
  }
}
