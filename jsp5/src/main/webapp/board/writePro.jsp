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
   <h1>writePro.jsp</h1>
   
   <%
     // 한글처리
     request.setCharacterEncoding("UTF-8");
     // 자바빈 객체 => BoardBean/BoardDTO 
     
     // 전달정보를 저장(파라메터-글쓴이,비밀번호,제목,내용)
     // => 액션태그-자바빈
   %>
   <jsp:useBean id="bb" class="com.itwillbs.board.BoardBean"/>
   <jsp:setProperty property="*" name="bb"/>
   <%
      System.out.println(bb);
      //System.out.println(bb.toString());   
      // 글쓴사람의 IP주소를 추가저장
      bb.setIp(request.getRemoteAddr());
      System.out.println(bb);
      
      
      // 글정보를 저장하기 => DB에 접근
  	  // BoardDAO 객체 생성
  	  BoardDAO dao = new BoardDAO();
  	  
  	  // 글쓰기 동작
  	  dao.insertBoard(bb); 
  	  
  	  // 리스트 페이지로 이동
  	  response.sendRedirect("boardList.jsp");
      
   %>
   
   
   
   
</body>
</html>