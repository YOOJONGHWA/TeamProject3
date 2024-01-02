package com.itwillbs.api;

import java.util.Calendar;

public class CreateOrderCode {
	
	public static String createOrderCode() {
		 
		Calendar cal = Calendar.getInstance();
		 
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		int d = cal.get(Calendar.DATE);
 
		StringBuilder sb = new StringBuilder();
		sb.append(y).append(m).append(d);
 
		for (int i = 0; i < 10; i++) {
			int random = (int)(Math.random() * 10);
			sb.append(random);
		}
		
		return sb.toString();
	}
}