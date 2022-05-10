<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
      // 쿠키정보를 체크해서 lang 쿠키정보가 있을때
      // 정보에 따른 결과 출력
      // korea - "안녕하세요. 쿠키연습!"
      // english - "Hello. Cookie Test!"   
      
      // 쿠키정보를 가져오기
      Cookie[] cookies = request.getCookies();
      String cookieLang = "korea";
   
      //쿠키정보 비교
      if(cookies != null){
    	  for(int i=0;i<cookies.length;i++){
    		  
    		  if(cookies[i].getName().equals("lang")){
    			  cookieLang = cookies[i].getValue();    			  
    		  }   		  
    	  }
      }
      if(cookieLang.equals("korea")){
    	  out.print("안녕하세요. 쿠키연습! <br>");
      }else{
    	  %>
	Hello. Cookie Test!
	<br>
	<%
      }
      
      
   %>


	<h1>cookieForm.jsp</h1>
	<form action="cookiePro.jsp" method="post">
		<input type="radio" name="language" value="korea"
			<%if(cookieLang.equals("korea")){ %> checked="checked" <%} %>>
		한국어 <input type="radio" name="language" value="english"
			<%if(cookieLang.equals("english")){ %> checked="checked" <%} %>>
		영어 <br>
		<br>
		<br> <input type="submit" value="언어 설정">
	</form>



</body>
</html>