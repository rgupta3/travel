package com.sony.travelRequest.test;

import java.util.ArrayList;
import java.util.List;

import junit.framework.TestCase;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sony.travelRequest.util.EmailComponent;

public class EmailComponentUnitTest extends TestCase {
	public void testSendMails() {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"mailContext.xml");

		EmailComponent emailComponent = (EmailComponent) context
				.getBean("emailComponent");
		List<String> emailIds = new ArrayList<String>();
		emailIds.add("rahul.gupta@ap.sony.com");
		emailComponent.sendMails(emailIds,
				"Test Email", "Test mail body for Travel App");
	}
}
