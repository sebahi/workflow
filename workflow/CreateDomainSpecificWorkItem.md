Here is the steps to create a domain specific work item.    

* Create work item definition Inventory.wid under the resources folder (JBPM workbench will load process definitions, forms, and work item definitions from the folder).

* Add the following content (the language is MVEL) into Inventory.wid file. 
Multiple work items can be declared in one .wid file. Work items are comma separated.

```
import org.drools.core.process.core.datatype.impl.type.StringDataType;
import org.drools.core.process.core.datatype.impl.type.ObjectDataType;

[
 [
    "name" : "inventory",
    "description" : "inventory content",
    "version" : "1.0",
    "parameters" : [
         "projectId" : new StringDataType(),
         "bagId" : new StringDataType(),
         "systemId" : new StringDataType(),
         "filepath" : new StringDataType(),
         "accessType" : new StringDataType()
    ],
    "results" : [
        "Result" : new ObjectDataType()
    ],
    "displayName" : "inventory",
    "eclipse:customEditor" : "org.drools.eclipse.flow.common.editor.editpart.work.SampleCustomEditor",
    "category" : "Service",
    "documentation" : "index.html"
  ]
]
```

* Create file drools.rulebase.conf under resources/META-INF

* In the drools.rulebase.conf file, declare .wid files in a space separated string

```
drools.workDefinitions = ../Rest.wid ../Inventory.wid
```

* Run `mvn eclipse:eclipse` from command line prompt to get maven dependencies.  

* Run `mvn clean install` from command line prompt.  

* Re-launch eclipse.  Open an existing bpmn file (if none exists, create one with JBPM wizard) with BPMN2 process editor.  The domain specific work item Inventory should show up in the modeler under the service tasks panel.
