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
	<h1>updatePro.jsp</h1>

	<%
		// 한글처리
		request.setCharacterEncoding("UTF-8");

		// 전달되는 정보를 저장 (수정할 정보) - 액션태그
	%>
	 <jsp:useBean id="updateBean" class="com.itwillbs.member.MemberBean" />
	 <jsp:setProperty property="*" name="updateBean"/>
	<%
	    System.out.println("수정할 정보 : "+updateBean);
		// DAO 객체 생성
		MemberDAO dao = new MemberDAO();

		// 정보수정 메서드 동작
		int result = dao.updateMember(updateBean); 
		
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
		}else{ // result == 1 // 수정완료
			%>
			  <script type="text/javascript">
			     alert(" 수정완료! ");
			     location.href="main.jsp";
			  </script>
			<%
		}
	%>



</body>
</html>