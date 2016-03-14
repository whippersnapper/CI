#!/bin/bash

# Create jenkins-keys data volume container
docker run -it -d \
--name jenkins-keys \
-h jenkins-keys \
-v /var/lib/jenkins_slave_key \
-e ROLE="slave" \
appcontainers/jenkins
echo "Created jenkins-keys data volume container."
 
# Create jenkins-data data volume container
docker run -it -d \
--name jenkins-data \
-h jenkins-data \
--volumes-from jenkins-keys \
-v /var/lib/jenkins \
-e ROLE="slave" \
appcontainers/jenkins
echo "Created jenkins-data data volume container."
