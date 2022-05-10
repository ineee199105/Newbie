<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scopeAction.jsp</h1>

	<%
    // 전달되는 파라메터정보를 저장
    String id = request.getParameter("id");
    
  %>
	<h2>
		아이디 :
		<%=id %>
	</h2>
	<h2>
		비밀번호 :
		<%=request.getParameter("pw") %></h2>
	<hr>

	pageContext 객체의 값 :
	<%=pageContext.getAttribute("p") %>
	<br> request 객체의 값 :
	<%=request.getAttribute("r") %>
	<br> session 객체의 값 :
	<%=session.getAttribute("s") %><br> application 객체의 값 :
	<%=application.getAttribute("a") %><br>





</body>
</html>