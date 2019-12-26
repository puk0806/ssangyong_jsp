<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

	// cos.jar 라이브러리 이용 파일전송 (servlets.com/cos)에서 다운
	// request X
	
	
	String saveDirectory = pageContext.getServletContext().getRealPath("/days25/upload");	// 업로드할 파일 경로(저장경로)
	int maxPostSize = 1024*1024*5;	// 기본단위 (byte)
	String encoding = "UTF-8";
	FileRenamePolicy fileRenamePolicy = new DefaultFileRenamePolicy();		// 파일 인덱스 자동부여 
	
	File saveDir = new File(saveDirectory);	// 저장 파일 객체 만들기
	if(saveDir.exists()){
		saveDir.mkdirs();
	}
	System.out.println(saveDirectory);
	
	
	MultipartRequest mrequest = new MultipartRequest(
										request				// 요청 request 객체
										,saveDirectory		// 업로드 경로(저장 경로)
										,maxPostSize		// 업로드 최대 크기
										,encoding			// 인코딩 방식
										,fileRenamePolicy	// 자동적으로 인덱스 붙여서 
										);
	
	String name = mrequest.getParameter("name");
	File uploadFile = mrequest.getFile("upload");	// upload == input 태그의 name 속성값 	// 파일 객체 가져옴
	long uploadFile_length = uploadFile.length();	// 파일 크기 가져오기
	String originalFileName = mrequest.getOriginalFileName("upload");	// 기존 파일 명
	String filesystemName = mrequest.getFilesystemName("upload");		// 저장 할때 파일 명
%>
	전송된 이름 : <%= name%> <br />
	첨부된 파일명 : <%= uploadFile.getName() %> <br />
	originalFileName : <%=originalFileName %> <br />
	filesystemName : <%=filesystemName %> <br />
	파일 크기 : <%=uploadFile_length %> <br />
	