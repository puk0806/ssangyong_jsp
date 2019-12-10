<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="days16.guestbook.model.Message"%>
<%@ page import="days16.guestbook.service.MessageListView"%>
<%@ page import="days16.guestbook.service.GetMessageListService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
<head>
	<title>방명록 메시지 목록</title>
</head>
<body>

<form action="/jspPro/days16/guestbook/write.do" method="post">
이름: <input type="text" name="guest_name"> <br>
암호: <input type="password" name="password"> <br>
메시지: <textarea name="message" cols="30" rows="3"></textarea> <br>
<input type="submit" value="메시지 남기기" />
</form>
<hr>
<c:if test="${viewData.isEmpty()}">
등록된 메시지가 없습니다.
</c:if>

<c:if test="${!viewData.isEmpty()}">
<table border="1">
	<c:forEach var="message" items="${viewData.messageList}">
	<tr>
		<td>
		메시지 번호: ${message.message_id} <br/>
		손님 이름: ${message.guest_name} <br/>
		메시지: ${message.message} <br/>
		<a href="/jspPro/days16/guestbook/confirmDeletion.do?message_id=${message.message_id}">[삭제하기]</a>
		</td>
	</tr>
	</c:forEach>
</table>

<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
<a href="/jspPro/days16/guestbook/list.do?page=${pageNum}">[${pageNum}]</a> 
</c:forEach>

</c:if>
</body>
</html>
