package com.filter;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringReader;
import java.io.StringWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.tomcat.util.http.fileupload.util.Streams;

import com.sun.org.apache.xerces.internal.xni.parser.XMLDocumentFilter;

// p 563
//@WebFilter(filterName="xsltFilter", urlPatterns= { "/days14/xml/*"})
public class XSLTFilter implements Filter {
	
	private String xslPath = null;

	@Override
	public void destroy() { 
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		 response.setContentType("text/html; charset=UTF-8");
		 
		 PrintWriter writer = response.getWriter();
		 
		 XSLTResponseWrapper responseWrapper =
				 new XSLTResponseWrapper((HttpServletResponse) response);
		 
		 chain.doFilter(request, responseWrapper);
		 
		 // XSLT 변환
		 try {
TransformerFactory factory = TransformerFactory.newInstance();			
			Reader xslReader = new BufferedReader(new FileReader(xslPath));
			StreamSource xslSource = new StreamSource(xslReader);			
Transformer transformer = factory.newTransformer(xslSource);
			
			String xmlDocument = responseWrapper.getBufferedString();
//System.out.println("변환할 문서 : " + xmlDocument);
			Reader xmlReader = new StringReader(xmlDocument);
			StreamSource xmlSource = new StreamSource(xmlReader);
			
			StringWriter buffer = new StringWriter(4096);
			//  book.xsl
transformer.transform(xmlSource, new StreamResult(buffer));
			
			writer.print( buffer.toString() );
			
		} catch (Exception e) {
		    throw new ServletException(e);
		}
		 
		 writer.flush();
		 writer.close();
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		 	this.xslPath = filterConfig.getServletContext().getRealPath("/WEB-INF/view/xsl/book.xsl");
	}

}
