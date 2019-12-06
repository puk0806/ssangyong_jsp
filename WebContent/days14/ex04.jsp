<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 6. 오전 11:26:26</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
  p 250 표현 언어( [EL] Expression Language )
     - JSTL 1.0 규약에 소개된 내용.
     - 스크립트 언어( 스크립트 요소 중에 하나 )
     - JSP2.3 , EL3.0
     - JSP 스크립트 요소를 보완하는 역할
     - 기능
        ㄱ. JSP 네가지 기본 객체의 영역+속성 사용
        pageScope, re, s,a
         ㄴ. 수치 연산, 관계연산, 논리  연산자 제공
         ㄷ. 자바 클래스 메서드 EL 안에서 호출가능( *** )    
         ㄹ. 쿠키, JSP 기본 객체 사용 가능
         ㅁ. 람다식 사용 가능
         ㅂ. 스트림 API를 통한 컬렉션 처리
         ㅅ. 정적 메서드 실행 ( *** )
     
     
  
   1. EL 데이터 타입
   2. EL 기본 객체
   3. EL 연산자
   4. EL 컬렉션
   5. *** EL 메서드 호출하기 ***
   6. EL 람다식과 스트림 API
   
   
   
   EL 선언 형식   
 -->  
<%--  ${ expr } --%>
<%-- 
<jsp:include page="/module/${ skin.id }/header.jsp"></jsp:include>
 --%>
<%--  
<b>${ sessionScope.member.id }</b>
 --%>

<!-- p 252 한페이지는 꼭 읽어보기  -->
<%-- 
1) EL 선언 : ${  }
2) EL 선언 : #{  } X    Spring  mybatis $ #
 --%>
 
<%-- c:out 태그의 value 속성값으로 EL 사용가능하다..
<c:out value="${  }"></c:out>
 --%> 

<%--
  EL 데이터 타입(자료형) 과 리터럴
  1)  boolean 형 : true, false   ${ true }
  2)  정수   ==    java.lang.Long 타입  ${ 0 }
  3)  실수   ==    java.lang.double 타입 ${ 3.14 }
  5)  문자열            java.lang.String
  6)  null   
 --%> 

${ true }<br>
${ 100 }<br>
${ 3.14 }<br> 
<input type="text"  value="${ '홍길동' }" /> <br>
<input type="text"  value='${ "홍길동" }' /> <br>
<%-- <input type="text"  value="${ \"홍길동\" }" /> <br> --%>

<!-- 
   p 114 JSP 기본 객체( 9 )
     request, response, out, [pageContext]
     application, session, config, page, exception
     
   p 254 EL 기본 객체
     [pageContext] == JSP pageContext 동일
     
      pageScope  영역
      requestScope
      sessionScope
      applicationScope
      
      param
      paramValues == reqeust.getParameterValues()
      
      header
      headerValues
      
      cookie
      initParam  == application.getInitParameter()
 -->
 <!-- request.getParameter("name") -->
 param.name =  ${ param.name }<br>
 <%-- 
	 <%
	    String referer = request.getHeader("referer");
	 %>
	 referer = <%= referer %><br>
  --%>
 referer = ${ header["referer"] }<br>
 referer = ${ header.referer }<br>
 
 
<script>
$(function (){});
</script>
</body>
</html>