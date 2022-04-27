<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>fmtDate.jsp</h1>
   
   <c:set value="<%=new Date() %>" var="today"/>
   
   기본값 : ${today }<hr>
   
   <h2> 년.월.일 </h2>
   <fmt:formatDate value="${today }"/>
   
   <h2> 시분초</h2>
   <fmt:formatDate value="${today }" type="time"/>
   <hr>
   
   <fmt:formatDate value="${today }" type="both"/>
   
   <hr>
   <h2> 날짜 정보 </h2>
   <fmt:formatDate value="${today }" type="date" dateStyle="full"/><br>
   <fmt:formatDate value="${today }" type="date" dateStyle="long"/><br>
   <fmt:formatDate value="${today }" type="date" dateStyle="medium"/><br>
   <fmt:formatDate value="${today }" type="date" dateStyle="short"/><br>
   
   <h2> 시간 정보 </h2>
   <fmt:formatDate value="${today }" type="time" timeStyle="full"/><br>
   <fmt:formatDate value="${today }" type="time" timeStyle="long"/><br>
   <fmt:formatDate value="${today }" type="time" timeStyle="medium"/><br>
   <fmt:formatDate value="${today }" type="time" timeStyle="short"/><br>
   
   
   <h2>
     2022년 4월 14일 (목) 오후 12시 37분 00초    
   </h2>
   
   <fmt:formatDate value="${today }" type="both" dateStyle="long" timeStyle="long"/>
   
   <h2>
     2021/4/14 (목)
   </h2>
   <fmt:formatDate value="${today }" pattern="yyyy/MM/dd (E)" />
   
   <h2>
     (오후) 12:44:00 
   </h2>
   <fmt:formatDate value="${today }" pattern=" (a) hh:mm:ss"/>
   
   
   

</body>
</html>