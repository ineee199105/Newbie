<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="yellow">
	<h1>top.jsp</h1>
	<h2>서울</h2>
	<!-- main.jsp 에서 전달한 파라메터 정보를 화면에 출력 -->
	<%
       request.setCharacterEncoding("UTF-8");
    %>
	아이디 :
	<%=request.getParameter("id") %>
	<br>


</body>
</html>