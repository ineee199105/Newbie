<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   	<h1>operatorPro.jsp</h1>
   
   전달받은 숫자  :   x = ${param.num1 }, y = ${param.num2 }<br>
   
   <h2> el표현식을 사용하는 경우 자동 형변환 가능 </h2>
   x + y =  ${ param.num1 + param.num2 } <br>
   
   x/y값 이 둘다 양수 입니까?(t/f) ${ (param.num1>0) && (param.num2>0) } <br>
   
   
   전달받은 x,y값이 동일합니까? ("예" / "아니오")
      ${ param.num1 == param.num2? "예":"아니오" } <br>
    
   
   안녕하세요 ${ empty param.id? "guest": param.id }님!
   <!-- 안녕하세요 guest님! -->
   
   
   
   
   
   
   
   
</body>
</html>