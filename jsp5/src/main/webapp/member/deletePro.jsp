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
   <h1>deletePro.jsp</h1>
   
   <%
      // 한글처리
      request.setCharacterEncoding("UTF-8");
   
      // 전달되는 데이터 저장(pw)
      String pw = request.getParameter("pw");
      // 회원 아이디 정보를 구하기
      String id = (String) session.getAttribute("id");
      
      // DAO 객체 생성
		MemberDAO dao = new MemberDAO();      
      // 회원정보(id,pw)를 사용하여 삭제 동작
      int result = dao.deleteMember(id,pw);
      
      // 삭제 결과에 따른 페이지 이동(-1,0,1)
      if(result == -1){ // 아이디없음
			%>
			  <script type="text/javascript">
			     alert(" 회원정보가 없음! ");
			     history.back();
			  </script>			
			<%
		}else if(result == 0){ // 비밀번호없음
			%>
			  <script type="text/javascript">
			     alert(" 비밀번호 오류! ");
			     history.back();
			  </script>			
			<%			
		}else{ // result == 1 // 삭제완료
		    
		     session.invalidate(); // 삭제한 회원정보 초기화(로그인정보)
			%>
			  <script type="text/javascript">
			     alert(" 삭제완료! ");
			     location.href="main.jsp";
			  </script>
			<%
		}
      
   
   %>
   
   
   
   
   
   
   
   
   
   
</body>
</html>