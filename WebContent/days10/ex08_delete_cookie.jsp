<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ?ckb_cookie=name&ckb_cookie=age -->
<%
    String [] c_names = request.getParameterValues("ckb_cookie");

    // 그 쿠키 객체의   setMaxAge(0) 설정하면 쿠키는 삭제
    Cookies c = new Cookies(request);
    for( int i = 0 ; i< c_names.length; i++){
      if( c.exists( c_names[i] ) ){
    	  Cookie cookie = Cookies.createCookie(
    			  c_names[i], "", "/", 0);
    	  response.addCookie(cookie);
      }
    }
    
    String location = "ex08_cookie_list.jsp";
    response.sendRedirect(location);
%>