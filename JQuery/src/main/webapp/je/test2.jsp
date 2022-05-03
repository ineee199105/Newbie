<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
   $(function(){
	   // textarea 키보드 입력 이벤트 발생시
	   $('textarea').keyup(function(){
		   //alert('입력');
		   var result = 200-$('textarea').val().length;
		   
		   // 기준(200)-입력값  화면출력
		   $('#len').html(result);
		   
		   // 입력된 글자수가 200자 이상  빨간색 출력
		   //                  "    이하  검정색 출력
		   
		   if(result < 0){
	   			$('#len').css('color','red');		   
		   }else{
	   			$('#len').css('color','black');			   
		   }
	   });
	   
	   
   });
</script>

</head>
<body>
   <h1>WebContent/je/test2.jsp</h1>
   
   <h2> 글자수 : 200자 제한</h2>
   <h2 id="len"> 200 </h2>
   <textarea rows="5" cols="70"></textarea>
   
   
   
   

</body>
</html>