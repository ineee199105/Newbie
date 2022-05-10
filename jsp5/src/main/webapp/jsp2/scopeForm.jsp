<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scopeForm.jsp</h1>
	<%
     // * 데이터를 공유하는 범위(공간) => Scope
     // * 공유되는 데이터 (속성) => Attribute
   
     // 영역			영역객체			속성 유효범위
     // page			pageContext			해당페이지
     // request			request				클라이언트 요청이 처리되는 페이지
     // session			session				세션정보가 유지되는 동안 모든페이지
     // application		application         서버(톰켓)가 실행되는 동안 모든페이지
     
     
     // 영역에 정보를 저장
     // [영역객체].setAttribute("이름",값);
 	   
     // 영역객체에서 정보를 가져와서 사용
     // [영역객체].getAttribute("이름");
   
   %>


	<form action="scopePro.jsp" method="get">
		아이디 : <input type="text" name="id"><br> <input
			type="submit" value="전송">
	</form>










</body>
</html>