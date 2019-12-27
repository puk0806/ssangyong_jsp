<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String saveDirectory 
	= pageContext.getServletContext().getRealPath("/days26/upload");  
	System.out.println( saveDirectory ); //
	
	// "/days25/upload"
	File saveDir = new File(saveDirectory);
	if( !saveDir.exists() ){
		  saveDir.mkdirs();
	}
	
	// 최대 첨부 파일 크기
	int maxPostSize = 1024*1024*5;   // 기본단위( byte ) 5MB
	String encoding = "UTF-8";
	// a.txt 업로드 -> a_1.txt,   a1.txt
	FileRenamePolicy fileRenamePolicy 
	   = new DefaultFileRenamePolicy();
	
	MultipartRequest mrequest 
	= new MultipartRequest(
			    request
			    , saveDirectory
			    , maxPostSize
			    , encoding
			    , fileRenamePolicy);
   
   Enumeration<String> en =  mrequest.getFileNames();
   while(en.hasMoreElements()){
	   String fileName = en.nextElement();
	   String originalFileName = mrequest.getOriginalFileName(fileName);
	   String filesystemName = mrequest.getFilesystemName(fileName);
%>
    <hr>
    fileName = <%= fileName %><br>
    originalFileName = <%= originalFileName %><br>
    filesystemName = <%= filesystemName %><br>
<%	   
   }
%>