package com.yydh.myapp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TVUser {

	public static void main(String[] args) {
		
		/*
		 * IoC-XML방식
		 */
		AbstractApplicationContext factory =
				new GenericXmlApplicationContext("applicationContext2.xml");
		
		TV tv = (TV)factory.getBean("tv");
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
		
		factory.close();
		
		
		
		
		
		
		
		
		
		
	}

}
