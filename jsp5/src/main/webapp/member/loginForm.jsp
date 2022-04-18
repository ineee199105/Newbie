<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>loginForm.jsp</h1>

	<h2>로그인</h2>

		<form action="loginPro.jsp" method="post">
		  <table border="1">
		     <tr>
		        <td>아이디 :</td>
		        <td><input type="text" name="id"></td>
		      	<td rowspan="2">
					<input type="submit" value="로그인">
				</td>
		     </tr>
		    <tr>
		        <td>비밀번호 :</td>
		        <td><input type="password" name="pw"></td>
		     </tr>
		  </table>
		</form>
		<hr>
		
		<input type="button" value="회원가입" onclick=" location.href='insertForm.jsp'; ">



</body>
</html>