<%@page import="com.itwillbs.member.MemberBean"%>
<%@page import="com.itwillbs.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
     function check(){
    	 //if(document.fr.pw.value == ""){
    	 if(document.fr.pw.value.length < 1){
    		 alert(" 수정하려면 비밀번호를 입력하세요! ");
    		 document.fr.pw.focus();
    		 return false;
    	 }
    	 
     }
  </script>

</head>
<body>
	<h1>updateForm.jsp</h1>
	<h2>회원정보 수정 페이지</h2>

	<%
     // 기존에 저장되어있는 회원정보를 출력
     String id =(String) session.getAttribute("id");
   
     if(id == null){
    	 response.sendRedirect("loginForm.jsp");
     }
     
     // DB에서 회원정보 가져오기
     MemberDAO dao = new MemberDAO();
     
     // 회원정보를 가져오기 동작
     MemberBean mb = dao.getMember(id);
     
    if(mb != null){
   %>
	<fieldset>
		<form action="updatePro.jsp" method="post" name="fr"
			onsubmit="return check();">
			아이디 : <input type="text" name="id" value="<%=mb.getId()%>" readonly><br>
			비밀번호 : <input type="password" name="pw"><br> 이름 : <input
				type="text" name="name" value="<%=mb.getName()%>"><br>
			나이 : <input type="text" name="age" value="<%=mb.getAge()%>"><br>
			성별 : <input type="radio" name="gender" value="남"
				<%if(mb.getGender().equals("남")){ %> checked="checked" <%} %>>남
			<input type="radio" name="gender" value="여"
				<%if(mb.getGender().equals("여")){ %> checked="checked" <%} %>>여<br>
			이메일 : <input type="text" name="email" value="<%=mb.getEmail()%>"
				readonly><br>
			<br> <input type="submit" value="회원수정">
		</form>
	</fieldset>
	<%} %>




</body>
</html>