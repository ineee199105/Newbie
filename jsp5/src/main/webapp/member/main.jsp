<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>main.jsp</h1>
   <h2> 메인페이지 </h2>
   
   <%
      // 세션영역에 저장된 ID정보(로그인정보)를 가져와서 출력
      String id = (String) session.getAttribute("id");
   
      // 메인페이지는 로그인을 했을때만 접속 가능!
      if( id == null ){
    	  System.out.println("로그인 정보 없음!");
    	  response.sendRedirect("loginForm.jsp");
      }
   
   %>
   
   <h2><%=id %>님 안녕하세요!</h2>
   
   <input type="button" value="로그아웃" onclick=" location.href='logout.jsp';">
   
   
   <hr><hr>
   <h3><a href="memberInfo.jsp">회원정보 조회(select)</a></h3>
   <hr><hr>
   <h3><a href="updateForm.jsp">회원정보 수정(update)</a></h3>
   <hr><hr>
   <h3><a href="deleteForm.jsp">회원정보 삭제(delete)</a></h3>
   
   <hr><hr>
   <h3><a href="../board/writeForm.jsp">게시판 글쓰기</a></h3>
   
   <hr><hr>
   <h3><a href="../board/boardList.jsp">게시판 목록</a></h3>
   
   
   
   <!-- 관리자만 사용가능한 메뉴 -->
   
    <%
     if(id != null){
      if(id.equals("admin")){  
    	  
       //if(id != null && id.equals("admin")) 	  
    %>
	   <hr><hr>
	   <h3><a href="memberList.jsp">회원 전체 목록보기(select)</a></h3>
   <% } 
     }
      %>
   
   
   
   
</body>
</html>