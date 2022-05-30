<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pagefile = request.getParameter("page");
	if (pagefile == null) { pagefile = "SignUpForm"; }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템 로그인페이지</title>
<style>
	table {
		margin : auto;
		width : 960px;
		color : gray;
		border : 1px solid gray;
	}
</style>
</head>
<body>
<table>
	<tr>
		<td height="43" colspan=3 align=left>
			<jsp:include page="top.jsp"/>
		</td>
	</tr>
	<tr>
		<td width="15%" colspan=2 align=right valign=top><br>

		</td>
		<td  align=center>
			<jsp:include page='<%=pagefile+".jsp" %>'/>
		</td>
	</tr>
</table>
</body>
</html>