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
public class ConditionalProcessTest extends JbpmJUnitBaseTestCase {

	@Test
	public void testPrintA() {
		RuntimeManager manager = createRuntimeManager("conditionalprocess.bpmn");
		RuntimeEngine engine = getRuntimeEngine(null);
		KieSession ksession = engine.getKieSession();
		
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("printA", "true");
		ProcessInstance processInstance = ksession.startProcess("conditionalprocess", params);
		// check whether the process instance has completed successfully
		assertProcessInstanceNotActive(processInstance.getId(), ksession);
		assertNodeTriggered(processInstance.getId(), "Print A");
		
		manager.disposeRuntimeEngine(engine);
		manager.close();
	}
	
	@Test
	public void testPrintB() {
		RuntimeManager manager = createRuntimeManager("conditionalprocess.bpmn");
		RuntimeEngine engine = getRuntimeEngine(null);
		KieSession ksession = engine.getKieSession();
		
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("printA", "false");
		ProcessInstance processInstance = ksession.startProcess("conditionalprocess", params);
		// check whether the process instance has completed successfully
		assertProcessInstanceNotActive(processInstance.getId(), ksession);
		assertNodeTriggered(processInstance.getId(), "Print B");
		
		manager.disposeRuntimeEngine(engine);
		manager.close();
	}

}