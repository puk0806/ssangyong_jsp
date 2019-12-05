<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 5. 오후 2:04:36</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<h3>ex02.jsp</h3>
<!-- 
	p544 필터
	1. 필터 사용하는 곳
	클라이언트가 요청을 했을 때 JSP/서블릿 등을 실행하기 이전에	요청이 올바른지 또는 자원에 접근할수 있는권한이 있는지 여부를 미리 확인하는 기능 : 필터
	ex) 정수기 필터 1,2,3
	ex) 게시판 글 수정/삭제/쓰기하려면 인증+권한 있어야지만
		서블릿 doGet(){ 세션 또는 쿠키게 인증X > 로그인페이지 이동 }
								 인증O > 수정,삭제..
	2. 필터는 http 요청과 응답을 변경할 수 있는 재사용 가능한 클래스
	ex) [write.jsp] -> [인증필터 클래스]			[write.jsp 권한+인증X]
						web.xml 필터 등록
							url-pattern
	ex) 응답	[list.jsp]	-> 인증 필터 -> list.jsp 자원
			<- 응답			필터(암호화, xml형태)
	3. 필터 구현 핵심 3개 타입 클래스
	ㄱ. javax.servlet.[Filter] 인터페이스
		- 필터 클래스 implement Filter
		1) init() : 필터 객체 생성될 떄 초기화 
		2) doFilter()
			- write.jsp 요청 -> 인증필터 -> 	JSP
							    doFilter(){
							    	세션 auth 존재X 로그인 페이지로 보내고
							    			존재O chanin.doFilter() ~> 다음필터 or 요청한 자원 이동
							    }	
		3) destory() : 필터 객체 소멸될 때 
	ㄴ. javax.servelet.[ServletRequestWrapper] 클래스
		- 필터가 요청을 변경한 결과를 저장하는 래퍼 클래스
	ㄷ. javax.servlet.[ServletResponseWrapper] 클래스
		- 필터가 응답을 변경하기 위해 사용하는 래퍼 클래스
	4. 인증필터 클래스 선언
	5. 필터 등록 : web.xml
			   @어노테이션 사용
	p548 표 19.1
		필터 설정하는 방법 : web.xml
	p550 <dispatcher> 속성 : REQUEST(기본값), FORWARD,INCLUDE 
	p551 @WebFilter 어노테이션 사용하는 방법
	
	p553 com.filter.NULLParameterRequestWrapper
		 com.filter.NullParameterFilter
		 		
	p556 web.xml 필터 설정
		 ex03_nullParam.jsp
	p557 브라우저 띄워서 ex03_nullParam.jsp 요청
	p557 브라우저 띄워서 ex03_nullParam.jsp?id=madvirus 요청
	
			
-->

<!-- 
	*.jsp 파일을 요청할 떄 NullParameterFillter거침	
 -->
 
 <!-- 
 	p557
 	[필터응용]
 	1. 사용자 인증
 	2. 캐싱 필터
 	3. 자언 접근에 대한 로깅
 	4. 응답 데이터 암호화, xml 변환 등등
 	5. 공통 기능 실행
 
  -->
 
 
<a href="ex03_nullParam.jsp">ex03_nullParam.jsp</a>
<a href="ex03_nullParam.jsp?id=madvirus">ex03_nullParam.jsp?id=madvirus</a>





<script>
$(function(){});
</script>
</body>
</html>