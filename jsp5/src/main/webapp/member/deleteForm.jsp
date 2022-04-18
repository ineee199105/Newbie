<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>deleteForm.jsp</h1>
   <h2> 회원정보 삭제</h2>
   
   <!-- 
     * 로그인 체크
     * 회원정보 중 비밀번호만 입력받아서 삭제 처리   (deletePro.jsp)
    -->
   <%
     String id = (String) session.getAttribute("id");
     if(id == null){
	   response.sendRedirect("loginForm.jsp");
     }
   %>
   <form action="deletePro.jsp"  method="post">
     비밀번호 : <input type="password" name="pw"><br>
     <input type="submit" value="삭제하기">
   </form>
   
   
   


</body>
</html>