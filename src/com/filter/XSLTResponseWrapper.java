package com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

// p 562
public class XSLTResponseWrapper
extends HttpServletResponseWrapper{

	private ResponseBufferWriter buffer = null;
	
	public XSLTResponseWrapper(HttpServletResponse response) {
		super(response);
		this.buffer = new ResponseBufferWriter();		
	}

	@Override
	public PrintWriter getWriter() throws IOException { 
		return this.buffer;
	}

	@Override
	public void setContentType(String type) {		
	}
	
	public String getBufferedString() {
		return this.buffer.toString();
	}

}
