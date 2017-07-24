#!/usr/bin/env groovy
node {
  stage('Workspace setup') {
    deleteDir()
    checkout scm
    sh "virtualenv --system-site-packages .venv"
  }
  stage('ansible-lint') {}
  stage('Create tarball') {}
}
