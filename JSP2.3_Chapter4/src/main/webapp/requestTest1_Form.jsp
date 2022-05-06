<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request Test</title>
<style>
h1 , #commandCell{
	text-align: center;
}

table {
	margin: auto;
	width: 400px;
	border: 1px solid red;
}
</style>
</head>
<body>
	<h1>Request 예제입니다.</h1>
	<form action="requestTest1.jsp" method="post">
		<table>
		<tr> 
			<td><label for = "name">이름</label></td>
			<td><input type="text" name="name" id= "name"></td>
		</tr> 
		<tr>
			<td><label for = "gender">성별</label></td>
			<td>남<input type ="radio" name ="gender" value= "male" id= "gender">
		</table>
	</form>
</body>
</html>