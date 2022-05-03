<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
   $(document).ready(function(){
	   
	   $('#btn').click(function(){
		   alert('클릭@@@@');
	   });
	   
	   $('h2').css('backgroundColor','yellow');
	   
	   // h2 클릭할때마다 + 기호를 추가
	   $('h2').click(function(){
		   // alert('h2 클릭!@');
		   //$('h2').append("+");
		   $(this).html(function(i,o){
			   return o + "+";
		   });
		});
	   
	   
	   $('h2').bind('click,keyup',function(){
		      
	   });	
	   
	   $('img').attr('border','5');
// 	   $('img').mouseover(function(){
// 		   //alert('@@@@');
// 		   $('img').attr('src','../jq/2.jpg');
// 	   });
	   
// 	   $('img').mouseout(function(){
// 		   $('img').attr('src','../jq/1.jpg');
// 	   });
	   
	   
	   $('img').mouseover(function(){
		   $('img').attr('src','../jq/2.jpg');
	   }).mouseout(function(){
		   $(this).attr('src','../jq/1.jpg');
 	   });
	   
	   
	   $('#img3').mouseout(function(){
		  $(this).attr('src','../jq/3.jpg');
	   });
	   
	   
	   
	   
   });
</script>

</head>
<body>
  <h1>WebContent/je/test1.jsp</h1>
  
  <input type="button" value="버튼1" onclick=" alert('클릭!'); ">
  
  <input type="button" value="버튼2" id="btn">
  <hr>
  
  <h2>head-0</h2>
  <h2>head-1</h2>
  <h2>head-2</h2>
  
  <hr>
  
  <h2> 마우스이벤트 </h2>
  
  <img src="../jq/1.jpg">1->2 <br>

  <img id="img3" src="../jq/3.jpg">3->2 <br>
  
  
  
  
  
  
</body>
</html>