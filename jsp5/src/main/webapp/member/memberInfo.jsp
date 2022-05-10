<%@page import="com.itwillbs.member.MemberBean"%>
<%@page import="com.itwillbs.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>memberInfo.jsp</h1>
	<h2>회원정보 조회 페이지</h2>

	<%
      // DB에서 로그인한 사람의 정보를 가져와서 화면에 출력
      
      // 세션객체에 저장된 아이디 정보 활용
      String id = (String) session.getAttribute("id");
   
      if(id == null){
    	  response.sendRedirect("loginForm.jsp");
      }
   
      
      // DAO 객체 생성
      MemberDAO dao = new MemberDAO();
      
      // DAO 안에 회원정보를 가져오는 메서드
      MemberBean mb = dao.getMember(id);
      
      System.out.println(mb);
      // System.out.println(mb.toString());
   
      // 회원정보를 받아서 화면에 출력
      if(mb != null){
   %>
	<hr>
	아이디 :
	<%=mb.getId() %><br> 비밀번호 :
	<%=mb.getPw() %><br> 이름 :
	<%=mb.getName() %><br> 성별 :
	<%=mb.getGender() %><br> 나이 :
	<%=mb.getAge() %><br> 이메일 :
	<%=mb.getEmail() %><br> 회원가입일 :
	<%=mb.getReg_date() %><br>

	<% } %>

	<h2>
		<a href="main.jsp">메인페이지로....</a>
	</h2>



</body>
</html>