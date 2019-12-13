package com.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

// ServletContextListener 
// 웹 어플리케이션 시작/종료 -> 이벤트 호출..
public class DBCPInitListener 
    implements ServletContextListener{

	// 웹 어플리케이션 종료
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		 System.out.println("> 웹사이트 종료 마무리 ...");
	}

	// 웹 어플리케이션 시작
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("> 웹사이트 시작 초기화 ...");
		//sce.getServletContext() == applicatoin
		String poolConfig =
				sce.getServletContext().getInitParameter("poolConfig");
		System.out.println(poolConfig + " 설정....");
	}

}
