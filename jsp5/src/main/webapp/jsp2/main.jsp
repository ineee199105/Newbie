<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="color.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=col2%>">
	<h1>main.jsp (템플릿 페이지)</h1>
	<table border="1" width="600" height="600">
		<tr>
			<!-- top -->
			<td colspan="2" height="100">
				<!-- 액션태그: 태그형태로 구성, 자바코드처럼 동작 가능  --> <jsp:include page="top.jsp">
					<jsp:param value="ITWILL" name="id" />
				</jsp:include>
			</td>
		</tr>
		<tr>
			<td width="100"><jsp:include page="left.jsp"></jsp:include></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="2" height="100"><jsp:include page="bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>

</body>
</html>