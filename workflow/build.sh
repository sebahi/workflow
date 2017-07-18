#!/bin/bash

JBPM_CONTAINER=$1
if [ -z "$JBPM_CONTAINER" ]; then
    JBPM_CONTAINER='jbpm-container'
fi

mvn clean package
docker cp target/*workflow*.jar $JBPM_CONTAINER:/usr/src/workflow.jar
docker cp pom.xml $JBPM_CONTAINER:/usr/src
docker exec -u 0 $JBPM_CONTAINER mvn install:install-file -Dfile=/usr/src/workflow.jar -DpomFile=/usr/src/pom.xml -Dmaven.repo.local=/opt/jboss/wildfly/bin/repositories/kie -DcreateChecksum=true

