<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSTL의 core라이브러리 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>out.jsp</h1>
   
   안녕하세요.<br>
   
   <%
    out.println("안녕하세요!");
    System.out.println("안녕하세요@@");
   %>
   
   <!-- JSTL -->
   <c:out value="안녕하세요##"></c:out><br>
   <c:out value="${ '안녕하세요##'}"></c:out><br>
   12345
   <hr>
   <c:out value="100 + 200"></c:out><br>
   jsp표현식 : <c:out value="<%=100 + 200 %>"></c:out><br>
   el표현식 :  <c:out value="${100 + 200}"></c:out><br>
   
   
   <hr>
   jstl에서 EL표현식으로 데이터를 출력할때 값이 null일때 공백문자로 출력<br>
   
   @<c:out value="${memberBean.name }"/>@ <br>
   <%-- <c:out value="<%=memberBean.name %>"/> --%>
   @<c:out value="${memberBean.name }" default="Null값 대신 출력됨"/>@ <br>
   

   <hr>
   
   <abc>는 abc태그입니다.<br>
   
   &lt;abc>는 abc태그입니다.<br>
   
   <c:out value=" <abc>는 abc태그입니다."/> <br>
   


</body>
</html>