<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="beantest" class="test.BeanTest" scope="page"/>
<jsp:setProperty name="beantest" property="name" value="BeanTest!"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBean Test</title>
</head>
<body>
<b>자바빈 사용 예제</b>
<h3><%=beantest.getName() %></h3> <!-- beantest 객체에 있는 name 값을 출력한다 -->
</body>
</html>