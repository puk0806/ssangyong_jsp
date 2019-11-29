<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 29. 오후 3:28:48</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<div style="text-align: center;">
   <table width="600px" border="1" align="center">
      <tr>
         <td colspan="3">
            <jsp:include page="/layout/top.jsp"></jsp:include>
         </td>
      </tr>
      <tr>
         <td colspan="3">
            <jsp:include page="/days09/layout/content.jsp"></jsp:include>
         </td>
      </tr>
      <tr>
         <td colspan="3">
            <jsp:include page="/layout/bottom.jsp"></jsp:include>
         </td>
      </tr>
   </table>
</div>




<script>
$(function(){});
</script>
</body>
</html>