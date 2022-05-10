<%@page import="com.itwillbs.board.BoardBean"%>
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
	<h1>updateForm.jsp</h1>
	<h2>글수정 페이지</h2>
	<%
     // 전달된 데이터 저장 (num,pageNum)
     int num = Integer.parseInt(request.getParameter("num"));
     String pageNum = request.getParameter("pageNum");
     
     // DAO 객체 - 글정보를 가져오는 메서드 
     BoardDAO dao = new BoardDAO();
     
     BoardBean bb = dao.getBoard(num);     
   
   %>



	<fieldset>
		<!-- DB 안에 저장되는 데이터는 input태그,주소에 파라메터 형태 -->
		<form action="updatePro.jsp?pageNum=<%=pageNum %>" method="post">
			<input type="hidden" name="num" value="<%=num%>">
			<%-- <input type="hidden" name="pageNum" value="<%=pageNum%>"> --%>

			글쓴이 : <input type="text" name="name" value="<%=bb.getName()%>">
			<br> 비밀번호 : <input type="password" name="pass"><br>
			제목 : <input type="text" name="subject" value="<%=bb.getSubject() %>"><br>
			내용 :
			<textarea rows="10" cols="20" name="content"><%=bb.getContent() %></textarea>
			<hr>

			<input type="submit" value="글 수정">
		</form>
	</fieldset>




</body>
</html>