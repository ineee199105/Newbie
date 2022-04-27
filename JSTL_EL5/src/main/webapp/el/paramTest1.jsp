<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <h1>paramTest1.jsp</h1>

  	<form action="paramPro1.jsp" method="post">   
       이름 : <input type="text" name="name"> <br>
       나이 : <input type="text" name="age"> <br>
       
       취미 : <input type="checkbox" name="hobby" value="게임"> 게임
   			  <input type="checkbox" name="hobby" value="요리"> 요리
   			  <input type="checkbox" name="hobby" value="운동"> 운동
   			  <input type="checkbox" name="hobby" value="영화"> 영화	
   			  <hr>
    	<input type="submit" value="전송">
    </form>

</body>
</html>
