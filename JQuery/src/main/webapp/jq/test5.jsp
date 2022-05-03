<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

   $(function(){
	   // html() - 대상 요소의 첫 데이터 하나만 가져오기
	   // text() - 대상 요소의 모든 데이터를 가져오기
	   
	   var h1 = $('h2').html();
	   alert(h1);  // head-0
	   
	   var h2 = $('h2').text();
	   alert(h2);  // head-0head-1head-2
	   
	   
	   $('h2').html("testMSG");
	   $('h2').text("MSGtest");
	   ////////////////////////////////////////////
	   // 데이터 입력시 html() - 태그인경우 태그를 적용
	   // 데이터 입력시 text() - 문자 그대로를 적용
	   $('h2').html("<h3>안녕하세요 html()실행</h3>");
	   $('h2').text("<h3>안녕하세요 text()실행</h3>");
	   
	   
	   ///////////////////////////////////////////////////////
	   
	   $('div').html(function(idx,oldStr){
		   alert("idx : "+idx+", oldStr : "+oldStr);
		   
		   return (idx+1)+"번 이름 : "+oldStr;
	   });
   });

</script>


</head>
<body>
   <h1>WebContent/jq/test5.jsp</h1>
   
   <h2>이름</h2>
   <h2>나이</h2>
   <h2>성별</h2>
   <hr>
   
   <div>김학생</div> <!-- 1번 이름 : 김학생 -->
   <div>이학생</div> <!-- 2번 이름 : 이학생 -->
   <div>박학생</div> <!-- 3번 이름 : 박학생 -->
   
   
   
   
</body>
</html>