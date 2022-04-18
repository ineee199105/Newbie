<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>sessionDel.jsp</h1>
  <%
    // 세션영역에 저장된 이메일정보만 삭제
    session.removeAttribute("email");  
    // 원래페이지로 이동
    //response.sendRedirect("sessionTest.jsp");    
  %>
  <script type="text/javascript">
     alert("서버 : email 정보 삭제! ");
     alert("서버 : 클라이언트 페이지로 이동 !!! ");
     location.href='sessionTest.jsp';
  </script>
  
  
  
  
  
  
</body>
</html>