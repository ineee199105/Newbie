<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = (String)session.getAttribute("id");

	if (id == null) {
	%>
		<a href = "loginForm.html">로그인</a>
	<%
	}
	else {
	%>
		<a href = "/Login/logout">로그아웃</a><br>
		<a href = "../index.jsp">게시판 이동</a>
	<%
	}
	%>
</body>
</html>