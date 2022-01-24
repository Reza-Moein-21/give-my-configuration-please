#!/bin/bash

CONTAINER_NAME=config-server
docker stop $CONTAINER_NAME > /dev/null && echo Container $CONTAINER_NAME stoped
sleep 1
docker container run \
--rm -d \
--name $CONTAINER_NAME \
--network reza-net \
-p 9002:9002 \
--ip 10.10.1.2 \
config-server:1.0.0 > /dev/null && echo Container $CONTAINER_NAME is runing