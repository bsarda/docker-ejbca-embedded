#!/bin/sh
docker ps -a | grep bsarda/ejbca-embedded | awk '{print $1}' | xargs -n1 docker rm -f
docker rmi bsarda/ejbca-embedded:latest
docker rmi bsarda/ejbca-embedded:6.3.1

docker build -t bsarda/ejbca-embedded .
docker tag bsarda/ejbca-embedded bsarda/ejbca-embedded:latest
docker tag bsarda/ejbca-embedded bsarda/ejbca-embedded:6.3.1
