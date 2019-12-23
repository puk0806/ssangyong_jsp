<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale = 1">
<title>2019. 12. 23. 오전 9:16:57</title>
<link rel="stylesheet" type="text/css" href="/jspPro/codebase/fonts/font_roboto/roboto.css"/>
<link rel="stylesheet" type="text/css" href="/jspPro/codebase/dhtmlx.css"/>
<script src="/jspPro/codebase/dhtmlx.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
.container {
	position: relative;
	width: 450px;
	height: 350px;
	border: dotted 1px #555;
	padding: 10px;
	margin-top: 10px;
}

.loader {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(255, 255, 255, 0) url('ajax-loader.gif') no-repeat 50%
		50%;
}
</style>

</head>
<body>

<!--  
1. https://dhtmlx.com/docs/products/dhtmlxChart/  
2. http://www.ajaxload.info/
-->

<a href="#" class="load">JQuery+Ajax+Chart+JSON</a>
<div id="chartbox" class="container" style="width:600px;height:250px;border:1px solid #c0c0c0;"></div>




<script>
$(function(){
   
	var res = {
		loader:$('<div/>',{"class":"loader"}),
		container:$(".container")
   };
   
   var myLineChart;
   myLineChart =  new dhtmlXChart({
      view:"bar",
      container:"chartbox",
      value:"#sal#",
      label:"#sal#",
      item:{
         borderColor: "#1293f8",
         color: "#ffffff"
      },
      line:{
         color:"#1293f8",
         width:3
      },
      xAxis:{
         template:"'#ename#"
      },
      offset:0,
      yAxis:{
         start:0,
         end:10000,
         step:1000,
         template:function(obj){
            return (obj%20?"":obj)
         }
      }
   });
   $("a.load").on("click",function(){
      $.ajax({
         url:"ex02_chart_json.jsp"
         , dataType:"json"
         , type:"get"
         , cache:false
         //send ajax 처리 시키기전...동글동글뺑글뺑글
         , beforeSend:function(xhr){
        	 res.container.empty().append(res.loader);
         }
         , success:function(data){
        	 res.container.find(res.loader).remove();
            //emp배열가져옴
            myLineChart.parse(data.emp,"json");
         }
      });
   });
   
});
</script>
</body>
</html>