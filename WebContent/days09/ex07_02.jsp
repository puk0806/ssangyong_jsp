<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri ="http://java.sun.com/jsp/jstl/core" %>
<%
   String contextPath = application.getRealPath("/");
   System.out.print("contextPath"+contextPath);
   System.out.print("------------------------------------------------------");
   String file;
   String dir = request.getParameter("dir") == null ? "days01" : request.getParameter("dir");
   file = request.getParameter("file") == null ? "ex01.jsp" : request.getParameter("file");
   File cpDir = new File(contextPath);
   File[] files = cpDir.listFiles();
   
   // 파일, 디렉토리 확인
   %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale=1">
<title>2019. 11. 29. 오전 10:33:40</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>

</style>
</head>
<body>
<form id="form1">
<!-- 코딩 context path 안에 있는 폴더명을 option 태그 -->
<select name="dir" id="dir">
   <%
   for(int i = 0; i < files.length; i++) {
      if(files[i].isDirectory()) {
         String dirName = files[i].getName();
         if(dirName.startsWith("days")) {
      %>
      <option><%= dirName%></option>
       <%
         }
      }
   }
%>

<%
   String path = application.getRealPath("/" + dir);
   File f = new File(path);
   files = f.listFiles();
%>
</select>

<select name="file" id="file">
   <%
         for(int i = 0; i < files.length; i++) {
            %>
            <option><%=files[i].getName() %></option>
            <%
         }
      %>
</select>

<br>

<%
   String fileName = String.format("%s\\%s", path, file);
   System.out.println("fileName : " + fileName);
   
   FileReader fr = null;
   BufferedReader br = null;
   StringBuffer sb = null;
   String content = null;
   
   try {
      sb = new StringBuffer();
      fr = new FileReader(fileName);
      br = new BufferedReader(fr);
      String line = null;
      while((line = br.readLine()) != null) {
         sb.append(line + "\r\n");
      }
      br.close();
      fr.close();
      
      content = sb.toString();
      content = content.replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br>");
   } catch(Exception e) {
      e.printStackTrace();
   }
   
%>

<div style="height:300px;overflow-y:scroll; border: solid 1px gray; padding: 5px;">
   <code>
      <%= content %>
   </code>
</div>

<script>
$(function() {
      $("#dir, #file").change(function() {
    	 if($(this).attr("id")=="dir") $("#file").val("");
    	  
         $("#form1").submit();
      });
      $("#dir").val('${empty param.dir ? "days01" : param.dir}');
      $("#file").val('${empty param.file ? "ex01.jsp" : param.file}');
 
});
</script>
</form>
</body>
</html>
