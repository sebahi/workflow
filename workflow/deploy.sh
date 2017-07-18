#!/bin/bash

JBPM_HOST='localhost'
JBPM_PORT='8443'

GROUPID="$(mvn org.apache.maven.plugins:maven-help-plugin:2.2:evaluate -Dexpression=project.groupId |grep -Ev '(^\[|Download\w+:)' )"
ARTIFACTID="$(mvn org.apache.maven.plugins:maven-help-plugin:2.2:evaluate -Dexpression=project.artifactId |grep -Ev '(^\[|Download\w+:)')"
ARTIFACTVER="$(mvn org.apache.maven.plugins:maven-help-plugin:2.2:evaluate -Dexpression=project.version |grep -Ev '(^\[|Download\w+:)')"
ARTIFACTDIR="$(echo $GROUPID.$ARTIFACTID | awk '{gsub(/\./,"/");gsub(/\:/,"/")}1')"
ARTIFACT=$GROUPID:$ARTIFACTID:$ARTIFACTVER

JBPM_REST_DEPLOYMENT_URL="$(echo https://$JBPM_HOST:$JBPM_PORT/jbpm-console/rest/deployment/$ARTIFACT)"

# Execute curl get rest command with Basic authorization  to check any previos deploymens match with artifct
# if deployment exist Undeploy artifact from server
curl -i -H "authorization: Basic a3Jpc3Y6a3Jpc3Y=" -H "Content-Type: application/xml" -H "Accept:application/json" -X GET $JBPM_REST_DEPLOYMENT_URL --insecure > deploystatus.log

UNDEPLOYED="false"

if grep \"status\":\"DEPLOYED\" deploystatus.log
    then
        echo "*****Deployment already exists. Un-deploying."

    # rest call to Undeploy Artifact if already exist, Undeploy is asynchronous call, will take some time to undeploy. response is only for Acceptance, repose is not the status of the undeployment

        curl -i -H "authorization: Basic a3Jpc3Y6a3Jpc3Y=" -H "Content-Type: application/xml" -H "Accept:application/json" -X POST -d @descriptor.xml  $JBPM_REST_DEPLOYMENT_URL/undeploy --insecure > undeploystatus.log

        if grep \"status\":\"ACCEPTED\" undeploystatus.log
        then
            echo "*****Un-deployment package accepted"

            for x in {1..8};
            do
                curl -i -H "authorization: Basic a3Jpc3Y6a3Jpc3Y=" -H "Content-Type: application/xml" -H "Accept:application/json" -X GET $JBPM_REST_DEPLOYMENT_URL --insecure >> undeploystatus.log

                if grep \"status\":\"UNDEPLOYED\" undeploystatus.log
                then
                    echo "*****Un-deployment success"
                    UNDEPLOYED="true"
                    # delete Artifact from jboss .m2 directory.(workaround for jbpm issue of not deleting artifact from local maven home))
                    # Changing permissions on local Maven home directory
                    docker exec -u 0 $CONTAINER chmod -R 777 /opt/jboss/.m2/repository/$ARTIFACTDIR
                    # Deleting artifact from local jboss Maven home.
                    docker exec -u 0 $CONTAINER rm -rf /opt/jboss/.m2/repository/$ARTIFACTDIR
                    break
                else
                    for i in {1..15};
                    do
                       echo -n "."
                       sleep 1
                    done
                fi
            done

            echo 'undeployed :'$UNDEPLOYED

             if [ $UNDEPLOYED == "false" ]; then
                echo "*****Un-deployment failed. Please check undeploy status log."
                exit 1
             fi

        else
            echo "*****Un-deployment job not accepted. Please check undeploy status log."
            exit 1
        fi
fi

# remove temporary rest call status logs
if [ -e undeploystatus.log ]; then
	rm -f undeploystatus.log
fi

if [ -e deploystatus.log ]; then
	rm -f deploystatus.log
fi

# Rest call to submit artifact to deployment to JBPM SERVER
curl -i -H "authorization: Basic a3Jpc3Y6a3Jpc3Y=" -H "Content-Type: application/xml" -H "Accept:application/json" -X POST -d @descriptor.xml  $JBPM_REST_DEPLOYMENT_URL/deploy --insecure >> buildstatus.log

# Checking Status of rest call, if it is accepted wait for deployment to finish
DEPLOYED="false"

if grep \"status\":\"ACCEPTED\" buildstatus.log
then
    echo "*****Deployment package accepted"

        for x in {1..8};
        do
        curl -i -H "authorization: Basic a3Jpc3Y6a3Jpc3Y=" -H "Content-Type: application/xml" -H "Accept:application/json" -X GET $JBPM_REST_DEPLOYMENT_URL --insecure > deploystatus.log

        if grep \"status\":\"DEPLOYED\" deploystatus.log
        then
            echo "*****Deployment success"
            DEPLOYED="true"
            break
        else
            for i in {1..15};
            do
                   echo -n "."
                   sleep 1
            done
        fi

    done

    echo 'Deployed : '$DEPLOYED

     if [ $DEPLOYED == "false" ]; then
        echo "*****Deployment failed. Please check deploy status log."
        exit 0
     fi

else
    echo "*****Deployment job not accepted. Please check build status log."
    exit 0
fi

if [ -e buildstatus.log ]; then
	rm -f deploystatus.log
fi

