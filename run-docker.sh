#!/bin/bash

docker container run --rm -d --name config-server -p 9001:9001 config-server:1.0.0