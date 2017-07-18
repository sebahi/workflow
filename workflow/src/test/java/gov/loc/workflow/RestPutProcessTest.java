package gov.loc.workflow;

import org.jbpm.test.JbpmJUnitBaseTestCase;
import org.junit.Test;
import org.kie.api.runtime.KieSession;
import org.kie.api.runtime.manager.RuntimeEngine;
import org.kie.api.runtime.manager.RuntimeManager;
import org.kie.api.runtime.process.ProcessInstance;

/**
 * This is a sample file to test a process.
 */
public class RestPutProcessTest extends JbpmJUnitBaseTestCase {

	//@Test
	public void testProcess() throws Exception {
		//TODO: Bootstrap CDI container and work item handler producers

		System.setProperty ("jsse.enableSNIExtension", "false"); //To avoid handshake alert: unrecognized_name
		
		RuntimeManager manager = createRuntimeManager("restputprocess.bpmn");
		RuntimeEngine engine = getRuntimeEngine(null);
		KieSession ksession = engine.getKieSession();
		
		ProcessInstance processInstance = ksession.startProcess("restputprocess");
		// check whether the process instance has completed successfully
		assertProcessInstanceNotActive(processInstance.getId(), ksession);
		assertNodeTriggered(processInstance.getId(), "REST");
		
		manager.disposeRuntimeEngine(engine);
		manager.close();
	}

}
