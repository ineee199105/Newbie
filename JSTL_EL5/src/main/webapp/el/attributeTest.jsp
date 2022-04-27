<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>attributeTest.jsp</h1>
   <%
      int cnt = 1000;
   
      pageContext.setAttribute("cnt", 2000);
   %>
   
   스크립틀릿cnt(변수) : <%=cnt %><br>
   cnt(속성) : <%=pageContext.getAttribute("cnt") %><br>
   EL - cnt(속성) : ${ pageScope.cnt }<br>
   
   <hr>
   <h2> 서블릿에서 전달된 데이터 </h2>
   cnt : ${requestScope.cnt }<br>
   
   <h2> el표현식으로 영역객체를 출력할때, 영역을 생략 가능하다</h2>   
   => 영역이 생략된 경우, 모든 영역을 순차적 접근 해당 데이터를 찾은경우
      더이상 영역을 찾는것을 그만함. <br>
      
      pageScope < requestScope < sessionScope < applicationScope  <br>
      
   cnt : ${ cnt }<br>
   cnt : ${ sessionScope.cnt } <br>
   
   
   
   
   
   
   
   
   
</body>
</html>