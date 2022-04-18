<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <script type="text/javascript">
     // 페이지가 실행될때 팝업창을 실행
     window.onload = pageLoad();
     
     function pageLoad(){
    	 //alert("실행!");
    	 // 팝업을 실행O/X
    	 var notShowPopUpData = getCookieValue();
    	 
    	 // 팝업옵션이 보여질때
    	 if(notShowPopUpData != "true"){
    	    window.open("popUp.jsp","","width=400,height=500");
    	 }
     }
     
     
     function getCookieValue(){
    	 // 쿠키정보를 사용해서 팝업창을 실행여부 결정
    	 var result = "false";
    	 
    	 if(document.cookie != ""){ //쿠키 객체 정보가 있을때
    		 // alert(document.cookie);
    	     // 쿠키정보를 ; 기준으로 나눠서 배열의 형태로 저장
    	 	 var cookie = document.cookie.split(";");
    	 	 //alert("#####"+cookie);
    	 	 
    	 	 for(var i=0;i<cookie.length;i++){
    	 		 //  notShowPopup=true
    	 		 var element = cookie[i].split("=");
    	 		 //  element = ["notShowPopup","true"]
    	 		 //  쿠키명
    	 		 var value = element[0];
    	 		 
    	 		 // 쿠키명에 불필요한 공백제거
    	 		 value = value.replace(/^\s*/,'');
    	 		 
    	 		 if(value == "notShowPopup"){
    	 			 result = element[1];
    	 		 }   	 		 
    	 		 
    	 	 }//for
    		 
    	 }// if
    	 
		return result;    	 
    	 
     }// func
  
  
  
  </script>
</head>
<body>
   <h1>popUpTest.jsp</h1>
   
   
   
   
</body>
</html>