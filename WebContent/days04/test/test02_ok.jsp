<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale = 1">
<title>2019. 11. 22. 오전 11:30:44</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>test02_ok.jsp</h3>

> 좋아하는 동물 :
<!-- JSTL : 흐름 제어문 foreach문 -->
<c:forEach items="${ paramValues.pet }" var="pet">
   ${ pet } / 
</c:forEach>
<%-- 
${ paramValues.pet[0] },
${ paramValues.pet[1] },
${ paramValues.pet[2] }
 --%> 
<br>
<br>


<input type="checkbox" name="pet" value="dog">개<br>
<input type="checkbox" name="pet" value="pig">돼지<br>
<input type="checkbox" name="pet" value="cat">고양이<br>
<%
  String [] pets = request.getParameterValues("pet");
%>
<script> 
$(function (){
	$(":checkbox").each(function (){
	  <%
	     for( int i=0 ; i< pets.length ; i++){
	  %>
	      if( $(this).val() == '<%= pets[i] %>' ){
	    	  $(this).attr("checked","checked");
	      }
	  <%
	     }
	  %>
		
	}) ;
	
	/* 
	var pets = [ 'dog',	'cat'];
	$(":checkbox").each(function (){
		if(  pets.indexOf($(this).val()) >= 0) 
		   $(this).attr("checked","checked");
	});
	 */
	
});

</script>
<%-- 
<%
  String [] pets = request.getParameterValues("pet");
%>
<%!
  public String setChecked(String [] pets, String pet){
	for(int i=0; i<pets.length; i++)
		if( pets[i].equals(pet)) return "checked";	
	return "";
  }
%>
<input type="checkbox" name="pet" value="dog" <%= setChecked(pets, "dog") %>>개<br>
<input type="checkbox" name="pet" value="pig" <%= setChecked(pets, "pig") %>>돼지<br>
<input type="checkbox" name="pet" value="cat" <%= setChecked(pets, "cat") %>>고양이<br>
 --%>
</body>
</html>



<%-- 풀이 2 

<input type="checkbox" name="pet" value="dog">개
<input type="checkbox" name="pet" value="pig">돼지
<input type="checkbox" name="pet" value="cat">고양이

<%
  String [] pets = request.getParameterValues("pet");
%>
<script>
$(function (){
	var pets = [];
	<%
	   for( int i=0; i< pets.length ; i++){
		   String pet = pets[i];
	%>
	     pets.push('<%= pet %>');
	<%
	   }
	%>
	
	$(':checkbox').each(function (){
    	if(  pets.indexOf( $(this).val() ) )
    		$(this).attr("checked","checked");
     });	 
	// alert( pets );
	
});
</script>

 --%>
 
<%-- 풀이 1  

<%!
   String [] pets = { "dog", "cat" };
   public String getCheck(   String pet ){
	  for(int i = 0 ; i < pets.length; i++){
		  if( pets[i].equals(pet) )	return "checked";
	  }
	  return "";
   }
%>

<input type="checkbox" name="pet" value="dog" <%= getCheck("dog") %>>개
<input type="checkbox" name="pet" value="pig" <%= getCheck("pig") %>>돼지
<input type="checkbox" name="pet" value="cat" <%= getCheck("cat") %>>고양이

 --%>