<%@page import="com.itwillbs.bean.JavaBean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>beanPro2.jsp</h1>
    <%
		String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        int num = Integer.parseInt(request.getParameter("num"));
    %>
      아이디 : <%=id%> 비밀번호 : <%=pw %> 숫자 : <%=num %>
      <hr>
     <h2> 자바빈 객체 (java) </h2>
    <%
        // 자바빈객체 생성
        JavaBean2 bean = new JavaBean2();
    
    	bean.setId(request.getParameter("id"));
    	bean.setPw(request.getParameter("pw"));
    	bean.setNum(Integer.parseInt(request.getParameter("num")));
    	
    	out.print(" 아이디 (java) : "+bean.getId()+"<br>");
    %>
       비밀번호 (java) : <%=bean.getPw() %> <br>
       숫자 (java) : <%=bean.getNum() %> <br> 
      <hr>
      
      <h2> 자바빈 객체 (액션태그)</h2>
      
      <!-- 객체 생성 -->
      
      <jsp:useBean id="bean2" class="com.itwillbs.bean.JavaBean2"/>
      
      <!-- 전달정보 저장 -->
<%--       <jsp:setProperty property="id" name="bean2" param="id"/>
      <jsp:setProperty property="pw" name="bean2" param="pw"/>
      <jsp:setProperty property="num" name="bean2" param="num"/> --%>
      
      <%-- <jsp:setProperty property="*" name="bean2" param="*"/> --%>
      <!--  param속성, property속성 이름이 동일한경우 
            param속성을 생략가능
       -->
      <jsp:setProperty property="*" name="bean2" />
      
      
      <!-- 정보 사용(출력) -->
      아이디(액션태그) : <jsp:getProperty property="id" name="bean2"/> <br>
      비밀번호(액션태그) : <jsp:getProperty property="pw" name="bean2"/> <br>
      숫자(액션태그) : <jsp:getProperty property="num" name="bean2"/> <br>
      
      
      
      
      
      
      
      
      
      
    
    
</body>
</html>