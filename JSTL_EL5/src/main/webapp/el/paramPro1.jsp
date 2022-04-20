<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>paramPro1.jsp</h1>
   <%
      // 한글처리
      request.setCharacterEncoding("UTF-8");
      String name = request.getParameter("name");
      
      out.print("이름(jsp-out.print) : "+name+"<br>");
   %>
   이름(jsp-표현식) : <%=name%> <br>
   이름(el - 표현식) : ${ name } <br>
   이름(el - 표현식) : ${ param.name } <br>
   <hr>
   <%
      int age = Integer.parseInt(request.getParameter("age"));
   %>
   나이(jsp-형변환) : <%=age + 100 %> <br> 
   나이(jsp표현식 ) : <%=request.getParameter("age") + 100 %><br>
   나이(el) : ${ param.age +100 } <br>
    => 전달되는 타입의 형태로 형변환
    
    <hr>
    
    <%
       //request.getParameter("hobby");
    	String[] hobbys = request.getParameterValues("hobby");
    	
    	if(hobbys != null){
	    	for(int i=0;i<hobbys.length;i++){
	    		%>
	    			취미<%=i+1 %> : <%=hobbys[i] %><br>
	    		<%
	    	}
    	}
    	
    %>
<%--      취미1 : <%=hobbys[0] %><br>
     취미2 : <%=hobbys[1] %><br>
     취미3 : <%=hobbys[2] %><br>
     취미4 : <%=hobbys[3] %><br> --%>
  
    <hr>
    <h2>el 표현식 사용 취미 출력</h2>
     
    취미1: ${ paramValues.hobby[0] } <br>
    취미2: ${ paramValues.hobby[1] } <br>
    취미3: ${ paramValues.hobby[2] } <br>
    취미4: ${ paramValues.hobby[3] } <br>
    <hr>
    <h2> el 표현식은 반복문 사용이 불가능! </h2>
      => JSTL-foreach문은 사용 가능 <br>
    <%-- <%
     for(int i=0;i<hobbys.length;i++){
    	%>
    	 취미1: ${ paramValues.hobby[] } <br>
    	<% 
     }    
    %> --%>
    <h2> JSTL + EL 표현식 </h2>
    <c:forEach var="hob" items="${paramValues.hobby }">
         ${ hob }         
    </c:forEach>
   
   
   
   
   
</body>
</html>