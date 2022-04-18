<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>sessionMain.jsp</h1>
  
  <!-- 로그인시에만 메인페이지를 확인,
        로그인을 안한경우 사용자를 페이지 이동(로그인페이지로) -->
  <%
     // 로그인성공 => 세션객체 생성
     String id = (String) session.getAttribute("id");
     
     if(id == null){
    	 // 로그인 X
    	 response.sendRedirect("sessionLoginForm.jsp");    	 
     }
  
  %>      
  
  
  <h2><%=session.getAttribute("id") %>님 환영합니다!</h2>
  
  <input type="button" value="로그아웃!" onclick=" location.href='sessionLogout.jsp'; ">
  
  
  
  

</body>
</html>