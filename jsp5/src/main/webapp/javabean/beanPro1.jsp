<%@page import="com.itwillbs.bean.JavaBean1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>beanPro1.jsp</h1>
	<%
		String id = request.getParameter("id");		
	%>
	아이디 :
	<%=id %><br>
	<hr>
	<h2>자바빈객체 사용(Java)</h2>
	<%
	
	   // 자바빈객체 생성
	   JavaBean1 bean = new JavaBean1();
	
	   // 객체에 id 정보 저장
	   bean.setId(request.getParameter("id"));
	
	%>
	아이디(java) :
	<%=bean.getId() %><br>
	<hr>
	<h2>자바빈객체 (액션태그 jsp:~)</h2>

	<!-- 자바빈 객체 생성 -->
	<%--
	<jsp:useBean id="객체명" class="클래스위치"></jsp:useBean>
	<jsp:useBean id="객체명" class="클래스위치"/>
	 --%>
	<jsp:useBean id="bean1" class="com.itwillbs.bean.JavaBean1"></jsp:useBean>
	<!-- 객체에 id정보 저장 -->
	<%-- <jsp:setProperty property="속성명" name="객체명" param="파라메터명"/> --%>
	<jsp:setProperty property="id" name="bean1" param="id" />
	<!-- 객체 정보를 출력 -->
	아이디 (액션태그) :
	<jsp:getProperty property="id" name="bean1" />







</body>
</html>