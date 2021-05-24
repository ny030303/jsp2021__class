package www.yydh.myapp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TVUser {
	public static void main(String[] args) {
		/*
		 * POJO 방식
		 */
//		TV tv = new SamsungTV();
//		tv.powerOn();
//		tv.voluemeUp();
//		tv.volumeDown();
//		tv.powerOff();
		/*
		 * IoC-XML방식
		 */
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
		TV tv = (TV)factory.getBean("tv");
		tv.powerOn();
		tv.voluemeUp();
		tv.volumeDown();
		tv.powerOff();
		
		factory.close();
	}
}
