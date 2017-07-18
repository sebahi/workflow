Workflow development

Prerequisite:

 * JDK8. Configure environment variable JAVA_HOME.
 * Maven3
 * Git
 * Eclipe IDE
 * Eclipse BPMN2 Modeler and the Drools and jBPM Eclipse plugin (Installation guide: http://docs.jboss.org/jbpm/release/6.5.0.Final/jbpm-docs/html/ch18.html.  Plugin URL: http://downloads.jboss.org/jbpm/release/6.5.0.Final/updatesite/)
 * JBMP 6.5

Clone repo and import cert:
 
 * Make a local clone of the workflow repo
    * git clone git@github.com:loc-rdc/workflow.git
 
 * Import CTS QA cert (workflow/src/main/resources/cert/transferqaCA.cert) to JDK trusted key store
    
    * Locate JDK's trusted key store: [JAVA_HOME]/jre/lib/security/cacerts

    * Execute the command from [JAVA_HOME]/jre/lib/security: sudo keytool -import -trustcacerts -keystore cacerts -storepass changeit -alias transferqaCA -file [dir_of_cts_cert]/transferqaCA.cert
 
 * Run mvn test from workflow from command line to test imported cert. If successful, no 401 http status code should be seen in commandline output.
 
Develop BMPN2:

 * Import existing project worklflow/workflow to Eclipse IDE. 
 * BMPN2 process editor is the recommended BMPN2 modeler.  

Deploy process definition:
 
 Please use script in workflow/workflow_deployment to deploy process definition. Instructions for manual deployment is here: 


 * Run mvn clean install from workflow/workflow.  The command will create a kjar file (a jar with the kmodule.xml file) workflow-1.0.0-SNAPSHOT.jar.
 * Start JBPM.  Log into JBPM console http://localhost:8080/jbpm-console.  
 * Go to Authoring -> Artifact Repository.  Click upload on the right uppper corner to upload the kjar file workflow-1.0.0-SNAPSHOT.jar.
 * Go to Deploy -> Process Deployments. Click New Deployment Unit on the right upper corner to deploy the kjar.
 * Go to Process Management -> Process Definitions. The three business processes in the kjar should be presented.
 * Before starting a process instance in the kjar, add a JVM parameter to your JBPM server.  Edit [JBPM_HOME]/wildfly-10.0.0-FINAL/bin/standalone.sh.  Add the line JAVA_OPTS="$JAVA_OPTS -Djsse.enableSNIExtension=false" after the debug mode config.  This is needed to avoid the handshake alert: unrecognized_name error when sending REST API to CTS.
 * See [JBPM_HOME]/wildfly-10.0.0-FINAL/standalone/log/server.log for process instance output.

