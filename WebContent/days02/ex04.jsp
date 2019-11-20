<%@ page 
	contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"
	session="true"
	trimDirectiveWhitespaces="false"	
	autoFlush="true"
	info="page 지시자 설명한 jsp파일"
	isELIgnored="false"
	isThreadSafe="true"	
	language="java"
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 20. 오후 2:44:58</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- 
p56 page지시자의 주요 속성
- contentType 속성 		: JSP페이지가 생성할 문서의 타입 지정하는 속성 
	(MIME 타입 : 이메일의 내용을 설형하기 위해 작성
		-> 이메일 + http 프로토콜에서 응답데이터의 내용을 설명하기 위해서 저장타입)

	charset=UTF-8 : (캐릭터셋 : html 문서의 인코딩 방식 : 한글 포함 utf-8,euc-kr)
			charset = 기본 ISP-8859-1,인코딩,(영어, 서유럽문자, 한글포함안됨)	-> 작성할때 인코딩 방식
- pageEncoding="UTF-8" 	: 읽어드릴때 인코딩 방식
- trimDirectiveWhitespaces="false"	: 맨위 고백을 제거하는 속성	
- autoFlush="true"		: 버퍼가 차면 전송할지 설정하는 속성
- info="page 지시자 설명한 jsp파일": 페이지 정보를 적을 속성
- errorPage=""			: 에러 페이지 처리할 속성
- isELIgnored="false" 	: EL을 무시할건가 묻는 속성
- isThreadSafe="true"	: 쓰레드 안전하게 사용할건가 하는 속성
- language="java"		: 사용할 언어 설정하는 속성(jsp : java만 사용 가능)
-->

<script>
$(function(){});
</script>
</body>
</html>