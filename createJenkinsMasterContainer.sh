#!/bin/bash

docker run -it -d \
--privileged \
--name jenkins \
-h jenkins \
--volumes-from jenkins-keys \
--volumes-from jenkins-data \
-p 8080:8080 \
--link node-slave:node-slave \
appcontainers/jenkins \

echo "Created Jenkins head server container."

