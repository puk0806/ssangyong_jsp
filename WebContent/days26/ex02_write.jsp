<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>kenik - 2019. 12. 27. 오전 8:05:49</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<h3 style="text-align: center">write.jsp</h3>
<form action="write_ok.do" method="post"
 enctype="multipart/form-data" >
 <table border="1" style="width: 500px;" align="center">
  <tr>
    <td> subject </td>
    <td> <input type="text" name="subject" /></td>
  </tr>
  <tr>
  	<td> attach file </td>
  	<td><input type="file" name="attachFile" /></td>
  </tr>
  <tr>
   <td colspan="2"><input type="submit" /></td>
  </tr>
 </table>
</form>



<script>
$(function (){});
</script>
</body>
</html>