<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testPro2.jsp</h1>
	<%
      //전달한 정보 저장후 출력 (이름,성별,취미,강의장)
      
      String name = request.getParameter("name");
      String gender = request.getParameter("gender");
//       String hobby1 = request.getParameter("hobby");
//       String hobby2 = request.getParameter("hobby");
      String classRoom = request.getParameter("classRoom");
   
      
      // https://docs.oracle.com/javaee/7/api/javax/servlet/jsp/package-summary.html
      
      String[] hobbys = request.getParameterValues("hobby");
   %>

	<h2>
		이름 :
		<%=name %></h2>
	<h2>
		성별 :
		<%=gender %></h2>
	<%--  <h2> 취미 : <%=hobbys[0] %></h2>
   <h2> 취미 : <%=hobbys[1] %></h2> --%>

	<% 
     if(hobbys != null){
      for(int i=0;i<hobbys.length;i++){
  	  %>
	<h2>
		취미 :
		<%=hobbys[i] %></h2>
	<%
      }   
     }
   %>

	<h2>
		강의장 :
		<%=classRoom %></h2>








</body>
</html>