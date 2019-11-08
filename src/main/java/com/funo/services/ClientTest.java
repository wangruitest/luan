package com.funo.services;

import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;

public class ClientTest {

	public static void main(String[] args) {
		JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
		org.apache.cxf.endpoint.Client client = dcf
				.createClient("http://127.0.0.1:8080/funo/services/PhoneServices?wsdl");
		Object[] objects = null;
		try {
			objects = client.invoke("queryRegionInfos", "fzgly", "lyxxh@123");
			System.out.println(objects[0].toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
