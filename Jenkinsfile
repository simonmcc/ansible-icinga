#!/usr/bin/env groovy
node {
  stage('Workspace setup') {
    deleteDir()
    checkout scm
    sh "./setup.sh"
  }
  stage('ansible-lint') {}
  stage('Create tarball') {}
}
