<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>reWritePro.jsp</h1>
   
   <%
     //int num = (int) request.getAttribute("num");(x)
     //int num = (int) session.getAttribute("num");
     
     // 한글처리
     request.setCharacterEncoding("UTF-8");
     // 전달해준 정보를 저장(액션태그-자바빈)    
     // 답글정보 확인
     %>
     <jsp:useBean id="reBB"  class="com.itwillbs.board.BoardBean"/>
     <jsp:setProperty property="*" name="reBB"/>
     
     <%=reBB %>
     <%
     // IP주소 추가
     reBB.setIp(request.getRemoteAddr());
     
     // DAO 객체
     BoardDAO dao = new BoardDAO();
     
     // 답글쓰기 동작
     dao.reInsertBoard(reBB); 
     
     // 페이지 이동(boardList)
     response.sendRedirect("boardList.jsp");
   %>

</body>
</html>