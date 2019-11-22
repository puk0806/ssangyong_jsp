<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale = 1">
<title>2019. 11. 22. 오전 10:08:07</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- 문제 2)
    ㄱ.  test02.jsp
    좋아하는 동물:        
       <input type="checkbox" name="pet" value="dog">개
       <input type="checkbox" name="pet" value="pig">돼지
       <input type="checkbox" name="pet" value="cat">고양이
   <input type="button" value="전송">
  
     jquery로 서브밋.
    ㄴ. "/days04/test02" URL로  GET방식으로 요청해서 서블릿 호출
    ㄷ. 동물을 하나라도 체크하지 않았을 경우에는 test02.jsp로 리다이렉트시키서
      "동물을 선택하세요" 라고 경고창 또는 메시지 출력하고 
           동물을 체크한 경우에는 test02_ok.jsp로 포워딩시켜서
      EL을 사용해서 아래와 같이 출력하기.
      
      > 좋아하는 동물 : 개, 돼지
      
      <input type="checkbox" checked>개
      <input type="checkbox" checked>돼지
      <input type="checkbox">고양이 -->


 좋아하는 동물:<br>  
       <input type="checkbox" name="pet" value="dog">개<br>
       <input type="checkbox" name="pet" value="pig">돼지<br>
       <input type="checkbox" name="pet" value="cat">고양이<br>
   <input type="button" value="전송">
  
<%
   String contextPath = request.getContextPath();
%>


<script>
$(function(){
   /*
   // form 태그 생성 -> body태그의 자식으로 추가
   //             append()-마지막자식으로 들어가짐, appendTo(),prepend()-첫번째 자식으로 들어가짐,prependTo()
   //$("body").append("<form id = 'form1'></form>");
   
   var bodyHtml = $("body").html();
   $("body").empty();//body태그의 자식 제거
   //$("body").prepend("<form id = 'form1'></form>");
   $("<form id = 'form1'></form>">.prependTo("body").html(bodyHtml)
         .attr({
            "method":"post" , "action":"test02_ok.jsp"
         });
         //.attr("method","post").attr("action","test02_ok.jsp");
   
   */
   
   //jq로 서브밋 시키기
   $(":button").on("click", function(){
      /*클라이언트에서 처리하는 방법-> 이코딩을 서버에서 체크해서 리다이렉트
      //alert($(":checked").length);
      if(!$(":checked").length){   //0 (==false)에다가 ! => true
         alert("동물체크하세요!");
         return false;
      }
      */
      
      
      //alert("test");
      var  path = "<%=contextPath%>/days04/test02"
      //?pet=dog&pet=pig
      //체크된 체크박스($(:"checked"))에 value 속성값을 모두 얻어와야함
      var queryString = "?";
      $(":checked").each(function(){
         var val =  $(this).val();
         queryString+="pet="+val+"&";
      });
      // queryString의 마지막 "&"제거
      queryString =  queryString.substr(0, queryString.length-1);
      path += queryString;
      //alert(path);
      
      
      location.href=path;//jq로 서브밋또는 페이지이동(get방식)
      
   })
});
</script>
</body>
</html>