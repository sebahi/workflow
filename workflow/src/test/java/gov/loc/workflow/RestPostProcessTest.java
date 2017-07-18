package gov.loc.workflow;

import java.util.HashMap;
import java.util.Map;

import org.jbpm.test.JbpmJUnitBaseTestCase;
import org.junit.Test;
import org.kie.api.runtime.KieSession;
import org.kie.api.runtime.manager.RuntimeEngine;
import org.kie.api.runtime.manager.RuntimeManager;
import org.kie.api.runtime.process.ProcessInstance;

/**
 * This is a sample file to test a process.
 */
public class RestPostProcessTest extends JbpmJUnitBaseTestCase {

	//@Test
	public void testProcess() throws Exception {
		//TODO: Bootstrap CDI container and work item handler producers
		
		System.setProperty ("jsse.enableSNIExtension", "false"); //To avoid handshake alert: unrecognized_name
		
		RuntimeManager manager = createRuntimeManager("restpostprocess.bpmn");
		RuntimeEngine engine = getRuntimeEngine(null);
		KieSession ksession = engine.getKieSession();
		
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("NoteMessage", "test message");
		ProcessInstance processInstance = ksession.startProcess("restpostprocess", params);
		// check whether the process instance has completed successfully
		assertProcessInstanceNotActive(processInstance.getId(), ksession);
		assertNodeTriggered(processInstance.getId(), "Create Note");
		
		manager.disposeRuntimeEngine(engine);
		manager.close();
	}

}
