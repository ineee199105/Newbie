<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*    h2{ */
/*      background: yellow; */
/*    } */

	.high_0 {background: yellow;}
	.high_1 {background: red;}
	.high_2 {background: blue;}
	.high_3 {background: aqua;}
	.high_4 {background: purple;}


</style>


<script src = "../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
// 		 $('h2').css('background','yellow');
// 		 var arr = ['red','blue','green','orange','pink'];
// 		 $('h2').css('background',function(i){
// 			 return arr[i];
// 		 });
		$('h2').each(function(idx){
			console.log("인덱스 : "+idx);
			//$('h2').addClass("high_"+idx);
			$(this).addClass("high_"+idx);
	    });
		
		// addClass();
		// * this 레퍼런스 : 사용자가 페이지에 방문해서 등록된 이벤트를
		// 발생할때 마다 해당 이벤트가 발생한 요소를 가리킴
		
		


	});
</script>
</head>
<body>
   <h1>test8.jsp</h1>
   
<!--    <h2 class="high_0">head-0</h2>
   <h2 class="high_1">head-1</h2>
   <h2 class="high_2">head-2</h2>
   <h2 class="high_3">head-3</h2>
   <h2 class="high_4">head-4</h2> -->
   
   <h2>head-0</h2>
   <h2>head-1</h2>
   <h2>head-2</h2>
   <h2>head-3</h2>
   <h2>head-4</h2>
   
   


</body>
</html>