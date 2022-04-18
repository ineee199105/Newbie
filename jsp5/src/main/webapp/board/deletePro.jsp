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
   <h1>deletePro.jsp</h1>
   
   <%
      // 한글처리 (파라메터를 저장하기전)
      request.setCharacterEncoding("UTF-8");
      
      // 전달되는 정보 저장
      String pageNum = request.getParameter("pageNum");
      
      int num = Integer.parseInt(request.getParameter("num"));
      String pass = request.getParameter("pass");
   
      // DAO 객체 생성
      BoardDAO dao = new BoardDAO();
      
      int result = dao.deleteBoard(num,pass);
      
   // 수정 정보에 따른 페이지 이동(JS)
      // 수정완료 1 : 게시판 페이지로 이동
      // 수정완료 0 : 실제 수정X 페이지 뒤로가기
      // 수정완료 -1 : 실제 수정X 페이지 뒤로가기
      if(result == 1){
    	  %>
    	    <script type="text/javascript">
    	       alert('게시글 삭제완료!');
    	       location.href='boardList.jsp?pageNum=<%=pageNum%>';
    	    </script>
    	  <%
      }else if(result == 0){
    	  %>
    	    <script type="text/javascript">
    	        alert("글 비밀번호 오류!(삭제x)");
    	        history.back();
    	    </script>    	  
    	  <%    	  
      }else{ //result == -1
    	  %>
	  	    <script type="text/javascript">
	  	        alert("글 없음 오류!(삭제x)");
	  	        history.back();
	  	    </script>    	  
	  	  <% 
      }
   
   
   %>
   
   
</body>
</html>