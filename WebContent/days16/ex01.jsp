<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 10. 오전 8:40:01</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>


<!-- 
	p446 DB테이블 생성
	
create table guestbook_message(
    message_id number not null primary key,
    guest_name varchar2(50) not null,
    password varchar2(10) not null,
    message clob not null
)

	p446 DB시퀀스 생성
create sequence seq_guestbook_message;
 -->
<a href="/jspPro/days16/guestbook/list.do">방명록 목록</a>


<script>
$(function(){});
</script>
</body>
</html>