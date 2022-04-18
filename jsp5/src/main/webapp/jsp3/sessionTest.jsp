<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>sessionTest.jsp</h1>
   
   
   <h2>세션 : 서버와 클라이언트의 상태를 유지 시키기위한 정보 (서버쪽 관리)</h2>
   <h2>세션객체 생성 : session.setAttribute("이름",값)</h2>
   <h2>세션객체 사용 : session.getAttribute("이름")</h2>
   <hr>
   <!-- 세션정보 출력 (정보가 있을때만 출력,없을때 "세션값 없음") -->
	
	<%
	   String id = (String)session.getAttribute("name");
	
	   if(id == null){
			id = "세션값 없음!";
	   }
	%>
	
	<%-- <h3>세션값 : <%=session.getAttribute("name") %></h3> --%>   
	<h3>세션값 : <%=id %></h3>   
	<h3>세션값(email): <%=session.getAttribute("email") %></h3>
   
   <!-- 추가) 세션값 생성 "email"/"itwill@itwill.com" -->
   <input type="button" value="세션값 생성!" onclick="location.href='sessionSet.jsp';">
   
   <input type="button" value="세션값 삭제!" onclick="location.href='sessionDel.jsp';">
   
   <input type="button" value="세션값 초기화!" onclick="location.href='sessionInv.jsp';">
   
   
   
   
   
   
</body>
</html>