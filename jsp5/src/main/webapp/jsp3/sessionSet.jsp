<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionSet.jsp</h1>
	<h2>서버페이지</h2>
	<%
     // 세션정보 생성
     session.setAttribute("name", "itwill");
   
     session.setAttribute("email", "itwill@itwill.com");
   
   %>
	<script type="text/javascript">
      alert("서버 : 페이지 처리완료(세션정보O)");
      alert("서버 : 페이지 응답처리!");
      location.href = "sessionTest.jsp";
   </script>




</body>
</html>