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
   <h1>updatePro.jsp</h1>
   <%
     // 한글처리 
     request.setCharacterEncoding("UTF-8");
     // 전달되는 데이터 저장(액션태그)
   %>
   
   <jsp:useBean id="ubb" class="com.itwillbs.board.BoardBean" />
   <jsp:setProperty property="*" name="ubb"/>
   
   <%
      System.out.println(" 수정할 정보 : "+ubb);
      System.out.println(" pageNum : "+request.getParameter("pageNum"));
      
      // DAO 객체를 실행할때 - DAO 객체 생성
      BoardDAO dao = new BoardDAO();
      // 정보수정 동작()(updateBoard()) - 수정 결과 리턴 (-1, 0 , 1)
      int result = dao.updateBoard(ubb);      
      
      // 수정 정보에 따른 페이지 이동(JS)
      // 수정완료 1 : 게시판 페이지로 이동
      // 수정완료 0 : 실제 수정X 페이지 뒤로가기
      // 수정완료 -1 : 실제 수정X 페이지 뒤로가기
      if(result == 1){
    	  %>
    	    <script type="text/javascript">
    	       alert('게시글 수정완료!');
    	       location.href='boardList.jsp?pageNum=<%=request.getParameter("pageNum")%>';
    	    </script>
    	  <%
      }else if(result == 0){
    	  %>
    	    <script type="text/javascript">
    	        alert("글 비밀번호 오류!(수정x)");
    	        history.back();
    	    </script>    	  
    	  <%    	  
      }else{ //result == -1
    	  %>
	  	    <script type="text/javascript">
	  	        alert("글 없음 오류!(수정x)");
	  	        history.back();
	  	    </script>    	  
	  	  <% 
      }
      
   
   %>
    
   
   
   
   
   
</body>
</html>