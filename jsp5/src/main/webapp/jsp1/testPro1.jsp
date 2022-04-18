<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>testPro1.jsp</h1>
   
   <%
     // 폼태그에서 POST방식으로 전달할때는 한글이 깨짐(인코딩 오류)
     
     // 한글 처리 
     request.setCharacterEncoding("UTF-8");
     
   
     // 전달해준 파라메터정보를 저장 (이름,나이,전화번호)
     String name = request.getParameter("name");
     int age = Integer.parseInt(request.getParameter("age"));
     String tel = request.getParameter("tel");
   %>
   
   <h2> 이름 : <%=name %> </h2>
   <h2> 나이 : <%=age %> 
     <%
		if(age >=20){
			out.print("(성인입니다)");
		}else{
	%>
			<!-- (미성년자입니다) -->	
			<%="(미성년자입니다)" %>	
	<%
		}
     %>
    </h2>
   <h2> 전화번호 : <%=tel %> </h2>
   
   
   
   
   
   
   
   
   
   



</body>
</html>