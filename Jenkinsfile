#!/usr/bin/env groovy

// Jenkinsfile (Declarative Pipeline)
pipeline {
    agent any
    environment {
        USER = credentials('USER')
        IP   = credentials('IP')
    }
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
        stage('Replacing the inventory file'){
            steps{
                sh 'sed -i "s/USER/${USER}/g" inventory'
                sh 'sed -i "s/IP/${IP}/g" inventory'
                sh 'cat inventory'
            }
        }
        stage('Executing the playbook'){
            steps{
                sh 'ansible-playbook -i inventory install-jenkins-playbook.yml'
            }
        }
    }
}
