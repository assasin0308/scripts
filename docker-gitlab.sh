#! /bin/bash
GITLAB_HOME=/usr/local/gitlab
IMAGE_NAME=gitlab/gitlab-ce:latest
HOST_NAME=gitlab.cn
mkdir -p ${GITLAB_HOME}/config
mkdir -p ${GITLAB_HOME}/logs
mkdir -p ${GITLAB_HOME}/data
chmod 777 ${GITLAB_HOME} -R 


docker pull ${IMAGE_NAME}

docker run --detach \
 --hostname ${HOST_NAME} \
 --publish 443:443 --publish 80:80 --publish 2222:22 \
 --name gitlab \
 --restart always \
 --volume $GITLAB_HOME/config:/etc/gitlab \
 --volume $GITLAB_HOME/logs:/var/log/gitlab \
 --volume $GITLAB_HOME/data:/var/opt/gitlab \
 ${IAGE_NAME}