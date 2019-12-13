<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 13. 오전 9:08:43</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
-- 게시판
create table article(
  article_no number primary key
  , writer_id varchar2(50) not null
  , writer_name varchar2(50) not null
  , title  varchar2(255) not null
  , regdate date default sysdate
  , moddate date  
  , content clob 
  
  , read_cnt number default 0
);



create sequence seq_article; 
-->


<a href="/jspPro/article/write.do">write.do</a> <br />
<a href="/jspPro/article/list.do">list.do</a>


<script>
$(function(){});
</script>
</body>
</html>