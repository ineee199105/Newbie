<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   function setPopUp(obj){
	   //alert("실행!");
	   if(obj.checked == true){
		  //alert("선택");
		  // 쿠키에 오늘 팝업창 끄기 옵션을 저장
		  
		  var expDate = new Date(); // 현 시스템 시간정보
		 // expDate.setMonth(expDate.getMonth()+1); //쿠키 유효기간 1달
		  expDate.setDate(expDate.getDate()+1); //유효기간 1일
		  
		  // 쿠키정보로 저장(HTTP)
		  document.cookie = "notShowPopup=true"+";path=/"+";expires="+expDate.toString();
		  alert("쿠키 생성완료!");
		  
		  // 창 종료
		  window.close();		  
	   }
			   
   }
 
 </script>
</head>
<body>
	<h1>popUp.jsp</h1>

	<img src="js.png">
	<br>

	<input type="checkbox" onclick=" setPopUp(this); "> 오늘 더 이상
	팝업창 띄우지 않기

</body>
</html>