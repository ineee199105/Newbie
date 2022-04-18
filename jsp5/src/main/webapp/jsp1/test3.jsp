<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>test3.jsp</h1>
   
   <h2> JSP 내장객체(p177~208) </h2>
   
   <h3> javax.servlet 패키지 (8개) </h3>
      request : 클라이언트의 Http 요청정보를 저장하는 객체<br>
      response : Http 요청에 대한 응답정보를 저장하는 객체<br>
      session : 클라이언트 세션정보를 저장하는 객체<br>
      pageContext : 페이지를 실행할때 필요한 컨텍스트(내프로젝트) 정보를 저장한 객체<br>
      out : 응답 페이지를 전송하기위한 출력 스트림 객체<br>
      application : 애플리케이션 컨텍스트정보를 저장한 객체<br>
      config : 페이지 서블릿 설정정보 저장 객체<br>
      page : 페이지 서블릿 객체 <br>
   
   <h3> java.lang 패키지 (1개) </h3>
      exception : 예외 처리객체 <br>
   <hr>
   
   <h3>request 객체</h3>
   <%
     //JAVA : String str = new String();
     //JS : var obj = new Object();
   %>
   
   서버 도메인명 : <%=request.getServerName() %><br>
   서버 포트명 : <%=request.getServerPort() %><br>
   
   URL : <%=request.getRequestURL() %><br>
   URI : <%=request.getRequestURI() %><br>
   
   클라이언트 호스트명 : <%=request.getRemoteHost() %><br>
   클라이언트 IP : <%=request.getRemoteAddr() %><br>
   
   프로토콜 : <%=request.getProtocol() %><br>
   페이지 요청방식(전송) : <%=request.getMethod() %><br>
   
   프로젝트경로 (컨텍스트경로) : <%=request.getContextPath() %><br>
   물리적 경로 : <%=request.getRealPath("/") %><br>
   
   Http 해더 정보 (user-agent) : <%=request.getHeader("user-agent") %><br>
   
   <hr>
   <%
      //response.setHeader("해더정보", 값);
      //response.addCookie("쿠키값");
      //response.sendRedirect("http://www.naver.com");
      //response.setContentType("text/html");
      
      //response.addHeader("Refresh", "3;url=http://www.naver.com");
   
	   
   %>
   세션 ID : <%=session.getId() %><br>
   세션정보 생성시간 : <%=session.getCreationTime() %><br>
   세션정보 최종접속시간 : <%=session.getLastAccessedTime() %><br>
   
   세션정보 유지시간(1800초,30분) : <%=session.getMaxInactiveInterval() %><br>
   
   <%
    // 세션정보 유지시간 변경
     session.setMaxInactiveInterval(3600);
   
     // out
     out.print("12312313");
     out.print("12312313");
     out.print("12312313");
     out.print("12312313");
   %>
   출력 버퍼 사이즈 : <%=out.getBufferSize() %><br>
   남은 버퍼 사이즈 : <%=out.getRemaining() %><br>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
</body>
</html>