#!/bin/bash
docker image build -t godemo2504/jenkins-demo2:$1 -f jenkins-plugin-model/Dockerfile .

if [ -z ${DOCKER_HUB_USER+x} ]
then 
    echo 'Skipping login - credentials not set' 
else 
    docker login -u $DOCKER_HUB_USER -p $DOCKER_HUB_PASSWORD
fi

docker push godemo2504/jenkins-demo2:$1
