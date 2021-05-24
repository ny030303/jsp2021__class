package com.yydh.myapp2;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CollectionBeanClient {
	public static void main(String[] args) {
		/*   Set
		 * AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext3.xml");
		CollectionBean bean = (CollectionBean) factory.getBean("CollectionBean");
		
		Set<String> addressList = bean.getAdreList();
		for(String address : addressList) {
			System.out.println(address.toString());
		} 
		*/
		
		// map
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext4.xml");
		CollectionBean2 bean = (CollectionBean2) factory.getBean("CollectionBean");
		Map<String, String> addressList = bean.getAdressList();
		for(String address : addressList.keySet()) {
			String value = (String) addressList.get(address);
			System.out.println(address + " : " + value);
		}
		
	}
}
