package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CharacterEncodingFilter implements Filter{

	private String encoding;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException { 
		 this.encoding =  filterConfig.getInitParameter("encoding");
		 if( encoding == null ) this.encoding="UTF-8";
	} 
	
	@Override
	public void destroy() { 
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response
			, FilterChain chain)
			throws IOException, ServletException { 
		
		//System.out.println("> CharacterEncodingFilter.doFilter()...");
		
		 request.setCharacterEncoding(this.encoding);
		 
		 chain.doFilter(request, response);
	}


}
