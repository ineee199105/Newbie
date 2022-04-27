<%@page import="com.itwillbs.bean.MemberBean"%>
<%@page import="java.util.ArrayList"%>
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
    <h1>set2.jsp</h1>
    <%
       System.out.println("set2.jsp 페이지 실행");
    
       // request 영역에 저장된 속성 저장
       String name = (String)request.getAttribute("name");
       String age = (String) request.getAttribute("age");
//        int age = Integer.parseInt((String) request.getAttribute("age"));
       String tel = (String) request.getAttribute("tel");
    %>
    이름 : <%=name %> <br>
    나이 : <%=age %> <br>
    전화번호 : <%=tel %> <br>
    
    <hr><hr>
    <h2> El 표현식을 사용하여 출력 </h2>
    이름 : ${requestScope.name } <br>
    나이 : ${age} <br>
    나이 : ${age +1} <br>
    전화번호 : ${tel}<br>
    
    <h3> EL표현식은 영역객체 (page-request-session-application) 접근이 가능</h3>
    
    1 : ${requestScope.name } <br>
    2 : ${name }<br>
    3 : ${sessionScope.name } <br>
    
    <h3> 다른영역에 동일한 이름의 속성은 사용 X </h3>
    
    <!-- 영역객체에 저장된 데이터를 삭제
         request 영역에 있는 데이터삭제 (name)
     -->
    <c:remove var="name" scope="request" /> 
     
    
    1 : ${requestScope.name } <br>
    2 : ${name }<br>
    3 : ${sessionScope.name } <br>
    
    <hr>
    <h2> Servlet에서 전달해준 정보를 저장 </h2>
    
    <%
       String test = (String)request.getAttribute("test");
    %>
    JSP 표현식 : <%=test %> <br>
    
    EL 표현식(영역표시) : ${requestScope.test }<br>
    EL 표현식(영역생략) : ${test }<br>
    
    <hr>
    <h2> 서블릿에서 가져온 객체 정보 </h2>
    
    ${requestScope.MemberBean } <br>
    ${MemberBean.id } <br>
    ${MemberBean.pw } <br>
    ${MemberBean.name } <br>
    ${MemberBean.gender } <br>
    ${MemberBean.addr } <br>
    
    <hr>
    <h2> 서블릿에서 전달된 List 정보 </h2>
    <%
      // JSP
      ArrayList memberList = (ArrayList)request.getAttribute("memberList");
      
     for(int i=0;i<memberList.size();i++){
    	   MemberBean mb = (MemberBean)memberList.get(i);
    	 
    	   out.print("이름 : "+mb.getName()+"<br>");
    	   out.print("아이디 : "+mb.getId()+"<br>");
    	   out.print("비밀번호 : "+mb.getPw()+"<br>");
    	   out.print("성별 : "+mb.getGender()+"<br>");
    	   out.print("주소 : "+mb.getAddr()+"<br>");
     }
    
    %>
    <hr>
    ${ requestScope.memberList } <br>
    <h2> EL표현식은 JSP 코드와 같이 사용 X (반복문 X)</h2>
    
    ${ requestScope.memberList[0].id }<br>
    ${ requestScope.memberList[0].pw }<br>
    ${ requestScope.memberList[0].name }<br>
    ${ requestScope.memberList[0].gender }<br>
    ${ memberList[0].addr }<br>
    
    <c:set var="list" value="${requestScope.memberList[0] }" />
    
    ${list.id }<br>
    ${list.pw }<br>
    ${list.name }<br>
    ${list.gender }<br>
    ${list.addr }<br>
    
    
    

</body>
</html>