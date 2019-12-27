<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 27. 오전 9:15:29</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- 
	테이블 추가
	create table filetest(
	  num number not null primary key
	  , subject varchar2(50) not null
	  , filesystemname varchar2(100) not null
	  , originalfilename varchar2(100) not null
	  , filelength number
	);
	
	create sequence seq_filetest;
-->


<a href="write.do">파일 게시글 쓰기</a><br>
<a href="list.do">파일 게시글 목록</a><br>

<script>
$(function(){});
</script>
</body>
</html>