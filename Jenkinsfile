#!/usr/bin/env groovy

// Jenkinsfile (Declarative Pipeline)
pipeline {
    agent any
    stages {
        stage('building Jenkins image!') {
            steps {
                sh 'docker build -t stashconsulting/jenkins-multibranch-plugin:$BUILD_ID .'
            }
        }
        stage('tagging Jenkins image!') {
            steps {
                sh 'docker tag stashconsulting/jenkins-multibranch-plugin:$BUILD_ID stashconsulting/jenkins-multibranch-plugin:latest'
            }
        }
        stage('pushing Jenkins image to the registry!') {
            when {
                branch 'master'
            }
            steps {
                withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) {
                    sh 'docker push stashconsulting/jenkins-multibranch-plugin:$BUILD_ID'
                    sh 'docker push stashconsulting/jenkins-multibranch-plugin:latest'
                }
            }
        }
    }
}
