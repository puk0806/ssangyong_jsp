package com.filter;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class NullParameterFilter implements Filter{
	
	private String[] parameterNames = null;
	
	// 필터객체 생성될 때 호출됨
	@Override
	public void init(FilterConfig config) throws ServletException {
		// p548 표 19.1
		// getInitParameter() : 설정파일의<init-para
		String names = config.getInitParameter("parameterNames");
		StringTokenizer st = new StringTokenizer(names,",");
		parameterNames = new String[st.countTokens()];
		
		for(int i =0 ;st.hasMoreTokens();i++) {
			parameterNames[i] = st.nextToken();
		}
		
	}
	

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("NullParameterFilter.doFilter 호출");
		chain.doFilter(request, response);
		
		// NullParameterRequestWrapper requestWrapper = new NullParameterRequestWrapper((HttpServletRequest)request);
		// requestWrapper.checkNull(parameterNames);;
		
		// chain.doFilter(requestWrapper, response);
		
	}

	@Override
	public void destroy() {
		
		
		
	}
	
	
	

}
