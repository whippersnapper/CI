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
[ec2-user@ip-172-30-2-162 jenkins_scripts]$ cat createJenkinsSlaveContainer.sh 
#!/bin/bash

SLAVE_CONTAINER_NAME=$1

docker run -it -d \
--privileged \
--name ${SLAVE_CONTAINER_NAME} \
--volumes-from jenkins-keys \
-h ${SLAVE_CONTAINER_NAME} \
-e ROLE="slave" \
appcontainers/jenkins

echo "Created ${SLAVE_CONTAINER_NAME} container."
