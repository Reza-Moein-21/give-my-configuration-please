#!/bin/bash

docker container run \
--rm -d \
--name config-server \
--network reza-net \
-p 9002:9002 \
--ip 10.10.1.2 \
config-server:1.0.0