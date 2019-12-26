<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 전송된 데이터를 가지는 스트림 객체로 부터 파라미터 + 파일 데이터를 파싱해야함
	request.setCharacterEncoding("UTF-8");
	Enumeration<String> en = request.getHeaderNames();	// 파이르이 header정보를 enum 타임으로 받아옴
	out.println("전송 받은 헤더 정보 출력 <br> ");
	while(en.hasMoreElements()){
		String key = en.nextElement();
		String value = request.getHeader(key);
		out.println(key+ " : "+ value+"<br>");
	}
	
	
	out.println("<br> 전송받은 데이터 출력<br>");
	ServletInputStream sis = request.getInputStream();	// 요청 input스트림 얻어오기
	DataInputStream dis = new DataInputStream(sis);		// 데이터 스트림으로 만들기
	
	String line = "";
	while((line=dis.readLine())!=null){	// 데이터 한줄씩 읽어 오기
		out.println( new String(line.getBytes("ISO-8859-1"),"UTF-8"));
	}
	
%>