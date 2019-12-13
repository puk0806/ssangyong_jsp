package com.filter;

import java.io.IOException;
import java.util.Iterator;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

// 필터 클래스 
public class NullParameterFilter implements Filter {
	// 문자열 배열 선언..
	private String[] parameterNames = null;
	// parameterNames[0]= "id"
	// parameterNames[1]= "name"
	
	// 필터 객체 생성  init()
	@Override
	public void init(FilterConfig config) throws ServletException {
		// p 548 표 19. 1.
		// getInitParameter() : 설정파일의 <init-param> parameterNames 태그 파라미터값 얻어오는 함수
		// <param-value>id,name</param-value>
		String names = config.getInitParameter("parameterNames");
		
		StringTokenizer st = new StringTokenizer(names,",");
		parameterNames = new String[st.countTokens()];
		
		for (int i = 0; st.hasMoreTokens(); i++) {
			parameterNames[i] = st.nextToken();
		}
				
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("> NullParameterFilter.doFilter() 호출됨...");		
		chain.doFilter(request , response);
		
/*		
		 // ServletReqeuestWrapper 클래스
 NullParameterRequestWrapper requestWrapper = new
		  NullParameterRequestWrapper((HttpServletRequest)request);
 //checkNull()  reqeuest 파라미터 id="", name="" 초기화
		  requestWrapper.checkNull(parameterNames);
		   
		  chain.doFilter(requestWrapper, response);
*/		  
	}


	@Override
	public void destroy() {
		// 필터 소멸될 때 호출되는 메서드
	}

}
