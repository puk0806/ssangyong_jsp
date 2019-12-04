<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "ex03_sessionAuth.jsp" %>
<%
// 공지사항 : 로그인을 해야 사용가능

if(auth == null){
   out.println("<script>");
   out.println("alert('로그인 후 공지사항 사용 가능')");
   out.println("location.href = 'ex03_default.jsp'");
   out.println("</script>");
   out.close();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale=1">
<title>2019. 12. 3. 오전 11:43:00</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>

</style>
</head>
<body>

<h3>공지사항</h3>
<li>
   <li>Lorem ipsum dolor sit amet, consectetur adipisicing.</li>
   <li>Similique quod excepturi quidem nesciunt est aliquam.</li>
   <li>Ex saepe a sapiente sit aspernatur pariatur.</li>
   <li>Unde illum qui amet perferendis consequatur a.</li>
   <li>Aperiam porro nostrum in expedita doloribus similique.</li>
   <li>Fugit voluptatem expedita beatae ipsam ea eveniet.</li>
   <li>Omnis debitis esse nobis in delectus necessitatibus?</li>
   <li>Corrupti modi sit mollitia quisquam suscipit ipsum.</li>
   <li>Voluptatum optio dolor quod alias inventore ex.</li>
   <li>Recusandae obcaecati officiis ullam ex odio placeat?</li>
   <li>Distinctio ad consectetur doloremque aut assumenda qui!</li>
   <li>Eos cupiditate voluptatem est atque nihil assumenda.</li>
   <li>Corrupti incidunt ex quidem eum labore accusantium.</li>
   <li>Nostrum incidunt ipsa in ad deserunt ipsam!</li>
   <li>Velit animi natus veritatis blanditiis totam vel!</li>
   <li>Assumenda velit eligendi laboriosam modi ut totam!</li>
   <li>In provident nesciunt accusamus sapiente harum doloribus?</li>
   <li>Ab omnis tempore nam neque reprehenderit exercitationem.</li>
   <li>Fuga reiciendis quaerat earum asperiores numquam veritatis.</li>
   <li>Cum assumenda nihil porro quae quaerat tempore!</li>
   <li>Mollitia veritatis possimus odit maiores modi amet.</li>
   <li>Quae laborum doloribus facere ex culpa ad.</li>
   <li>Facilis qui tempore mollitia ipsa illo aliquam?</li>
   <li>Necessitatibus provident veritatis totam quas cum impedit.</li>
   <li>Non veniam amet voluptates placeat! Tenetur consequatur!</li>
   <li>Facilis quod repudiandae amet non recusandae fugiat.</li>
   <li>Quam dicta placeat dolor deserunt. Eveniet molestias.</li>
   <li>At laudantium delectus hic est sed porro.</li>
   <li>Optio magni sapiente neque quaerat atque enim!</li>
   <li>Molestias sunt reiciendis assumenda sed. Molestias placeat!</li>
</li>
<script>
$(function() {});
</script>
</body>
</html>






















