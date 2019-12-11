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
  1. days16 폴더 추가 > ex01.jsp 파일 추가
  2. days16 / guestbook 폴더 추가
     days16 / images 폴더 추가
            / ex01.jsp 파일 추가
  
     p 426          
  3. 방명록( guestbook ) - MVC 패턴
  4. package 추가
     days16.guestbook.controller
     days16.guestbook.service
     days16.guestbook.dao
     days16.guestbook.command
     
     p 448
     days16.guestbook.model
                       Message 클래스 ( DTO )
     
  5. WEB-INF/view/days16/     
  
  6. WEB-INF/view/days16/commandHandlerURI.properties 
  7. web.xml    
  8. CommandHandler 인터페이스 추가    
     NullHandler 추가     
                                           DTO      DTO
  9. MVC 패턴                                                      모델 -> 서비스 -> DAO -> 오라클
  클라이언트 - 모든 요청 -> web.xml -> 컨트롤러 서블릿 -> 모델( Model )
                *.do                     ~Handler
                                         r.s( list, list )
                                                  포워딩               return ??.jsp
    <-응답
         
   9-1. p 426
       DAO 구현
       Service 구현
       ConnectionProvider 처리 - DBCP( 커넥션 풀 )
             방명록 구현   
   
   p 431 DAO에서 Connecction 에 접근하는 방법
      1) DAO클래스의 메서드에서 직접 Connection 생성  ( X )
      2) DAO객체를 생성할 때 생성자에서 Connection 전달(  DI : 의존성 주입 )
      3) DAO클래스의 메서드 파라미터로 Connection 전달( DI : 의존성 주입 )
      
   p 434  com.util.JdbcUtil 클래스            
   
   
   content.do?seq=10 -> C
                       ContentHandler
                             ->              ContentService
                                                     dao.조회수증가
                                                     dao.게시글내용
                         re.sA(dto, dot);
                         return content.jsp
                             
                             
  10. 서비스  클래스 들은 DAO를 실행하는 도중에 SQLException 이 발생하면
       ServiceException을 발생시키도록 구현하겠다..
  
  11. 클래스 기능 이해.
      p 455   MessageListView 클래스 코딩           ?
      p 457   GetMessageListSevice 클래스 코딩  ?
  
  12. p 461   MessageNotFoundException 선언
      p 462   InvalidPasswordException 선언                                                          
  -->

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