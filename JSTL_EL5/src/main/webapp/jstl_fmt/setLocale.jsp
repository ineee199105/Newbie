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
   <h1>/jstl_fmt/setLocale.jsp</h1>
   
   <c:set var="today" value="<%=new Date() %>"/>
   
   오늘 : ${today }<br>
   
   <fmt:setLocale value="ko_kr"/>
   오늘 : ${today }<br>
   날짜 : <fmt:formatDate value="${today }" dateStyle="full"/><br>
   금액 : <fmt:formatNumber value="100000000000" type="currency"/>
   
   <hr>
   <fmt:setLocale value="en_us"/>
   오늘 : ${today }<br>
   날짜 : <fmt:formatDate value="${today }" dateStyle="full"/> <br>
   금액 : <fmt:formatNumber value="100000000000" type="currency"/>
   
   <hr>
   <fmt:setLocale value="ja_jp"/>
   오늘 : ${today }<br>
   날짜 : <fmt:formatDate value="${today }" dateStyle="full"/> <br>
   금액 : <fmt:formatNumber value="100000000000" type="currency"/>
   
   
</body>
</html>