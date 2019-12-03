<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 3. 오후 2:11:52</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
	p415 커넥션 풀(Connection Pool)
	JSP 페이지를 실행할 때 마다 DB연동 + COnnection 객체를 생성 + DB처리 + close...
	동시에 접속해서 처리하면 전체 성능 떨어진다. (해결방법 : 커넥션 풀)
	미리 pool에 Connection 객체를 생성 -> 가져다 사용하고 -> 다시 풀에 돌려주는 기법
	2. 톰캣(WAS)가 제공하는 커넥션 풀 사용하기
		- 커넥션 풀 환경 설정... META-INF 폴더 안에 context.xml
	
	1. 자가르타 프로젝트의 [DBCP]를 이용한 커넥션 풀 사용하기
	ㄱ. [DBCP와 관련된 jar 파일] + JDBC드라이버(ojdbc6.jar) 설치
		1) Commons DBCP API 관련 jar 파일
		2) Commons DBCP API 관련 jar 파일이 사용하는 Commons Pool API 관련 jar 파일 추가.
		3) 로그 기록에 사용하는 Commons Logging API 관련 jar 파일도 추가
			http://commons.apache.org (다운)0
				commons-dbcp2-2.1-bin.zip
				commons-pool2-4.1-bin.zip
				commons-logging-1.2-bin.zip
			압출풀면
				commons-dbcp2-2.1.jar
				commons-pool2-2.4.1.jar
				commons-logging-1.2.jar
			WEB-INF/lib 폴더에 추가
	ㄴ. 커넥션 풀 초기화 	
		- 서브릿 선언 p418 DBCPInit 서블릿 클래스 
		- web.xml 위의 서블릿 등록 + 자동 서블릿생성
	ㄷ. 커넥션 풀로부터 커넥션 객체를 얻어와서 사용
		- p422 viewMemberUsingPool.jsp
	
	
 -->


<script>
$(function(){});
</script>
</body>
</html>