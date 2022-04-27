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
    <h1>set1.jsp</h1>
    <!-- 자바코드, 정수변수2개 의 합을 화면에 출력 -->
    <% 
       System.out.println("set1.jsp 페이지 실행");
       // service() - 지역변수 => set1.jsp페이지 에서만 사용가능
       int num1 = 100;
       int num2 = 200;
       int sum = num1 + num2;    
    %>
    
    합 : <%=sum %> <br>
    <hr>
    <%--
      <c:set var="변수이름"  value="값" scope="영역"/>
       변수 X, 속성을 생성 (Attribute), scope 속성은 생략 - page영역 접근
       
       pageContext.setAttribute("이름","값"); 
     --%>
    
    
    <c:set var="num3" value="100" />
    <c:set var="num4" value="200"/>
    <%-- <c:set var="sum2" value="num3+num4"/> --%>
    <c:set var="sum2" value="${num3+num4}"/>
    
    합(JSTL) : <c:out value="${sum2}"/> <br>
    
    HTML : ${num3 } + ${num4 } = ${sum2 } <br>
    
    ${num1 } + ${num2 } = ${sum } <br>
    <%=num1 %> + <%=num2 %> = <%=sum %> <br>
    <%-- <%=num3 %> --%>
    
    <hr>
    <h2> request 영역에 정보를 저장 </h2>
    
    <%
      request.setAttribute("name", "ITWILL");  
      session.setAttribute("name", "BUSAN");
    %>
    <c:set var="age" value="20" scope="request"/>
    <c:set var="tel" value="010-1234-4567" scope="request"/>
    
    
    <!-- 페이지 이동 -->
    <h2> 액션태그를 사용한 forward 이동 </h2>
    <!-- 
        페이지 이동시 주소의 변경 X,
        request 영역정보를 전달가능하다    
     -->
    <jsp:forward page="set2.jsp"></jsp:forward>
    
    
    
    
    
    
    
    
    
    
    

</body>
</html>