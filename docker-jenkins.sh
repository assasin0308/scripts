#! /bin/bash
JENKINS_HOME=/usr/local/jenkins
IMAGE_NAME=jenkins/jenkins:latest

mkdir -p ${JENKINS_HOME}
chmod 777 ${JENKINS_HOME}/  -R

docker pull ${IMAGE_NAME}

docker run -itd --rm --name jenkins -p 8080:8080 -p 50000:50000 -v ${JENKINS_HOME}:/var/jenkins_home ${IMAGE_NAME}