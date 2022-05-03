<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%
     System.out.println(request.getParameter("name"));
  
  %>

  전달된 이름 : <%=request.getParameter("name") %>  !!<br>
  나이 : <%=request.getParameter("age") %>
  