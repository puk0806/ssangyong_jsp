<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String dir;		// 디렉토리
	String file;	// 파일
	
	dir = request.getParameter("dir")== null ? "days06":request.getParameter("dir");
	file = request.getParameter("file")== null ? "ex01.jsp":request.getParameter("file");
	
	// p129 표5.7	application 기본 내장 객체
	// getRealPath() 			(암기)
	// getResource()
	// getResourceAsStream()
	
	String path =  application.getRealPath("/");
	String path2 =  application.getRealPath("/days06");
	
	String path3 = application.getRealPath("/"+dir);
	
	// 파일, 디렉토리 관리하는 클래스 : 생성, 삭제, 등등
	File f = new File(path3);
	File[] files = f.listFiles();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 29. 오전 10:33:43</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- 
	p127 웹 어필리케이션의 자원 구하기
	- JSP 페이지에서 웹 어플리케이션(웹 사이트) 내에 특정 폴더에 위치한 파일을 사용 해야할 될 때	
-->
<h4>application.getRealPath("/") - <%=path %></h4>
<!-- C:\Class\JspClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspPro\ -->
<h4>application.getRealPath("/days06") - <%= path2 %></h4>
<!-- C:\Class\JspClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspPro\days05 -->

<form action="" id="form1">
	<select name="file" id="file">
	<%
		for(int i=0 ;i <files.length;i++){
	%>	
			
			<option><%=files[i].getName() %></option>
	<%	}
	%>
	</select>
</form>

<%
	String fileName = String.format("%s\\%s",path3,file);
	System.out.println(fileName);
	FileReader fr = null;
	BufferedReader br = null;
	StringBuffer sb = null;
	String  content = null;
	
	try{
		fr = new FileReader(fileName);
		br = new BufferedReader(fr);
		sb = new StringBuffer();
		String line = null;
		
		while((line=br.readLine())!=null ){
			sb.append(line+"\r\n");
		}
		
		br.close();
		fr.close();
		
		content = sb.toString();
		content = content
					.replace("<", "&lt;")
					.replace(">","&gr")
					.replace("\r\n", "<br>");
		
		
				
	}catch (Exception e){
		e.printStackTrace();
	}
%>

<div>
	<code>
		<%=content %>	
	</code>
</div>


<script>
$(function(){
	$("#file").change(function(){
		$("#form1").submit();
	});
	
	$("#file").val('${param.file}')
});

</script>
</body>
</html>