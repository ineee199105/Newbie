<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieSet.jsp</h1>

	<h2>서버</h2>
	<%
    	System.out.println(" 서버 : 사용자 요청 처리완료! ");
    	/*
    	[서버]
    	1) 쿠키 객체 생성 (쿠키명,값)
    	2) 쿠키에 필요한 설정 => 유효시간,설정,도메인,path,보안....
    	3) 클라이언트에게 정보 전달(쿠키)
    	*/
    	
    	// 서블릿 API 사용
    	// 클라이언트에게 전달할 쿠키정보 생성
    	Cookie cookie = new Cookie("name","CookieValue");
    	// 메모리에 올라감 => HDD에는 저장 X
    			
    	// 쿠키 설정
    	cookie.setMaxAge(600); // 10분 => 10 * 60초
    	
    	// 클라이언트로 정보 전달
		response.addCookie(cookie);    	
    	
    %>
	<script type="text/javascript">
        alert(" 서버 : 쿠키값 생성완료! ");
        alert(" 서버 : 클라이언트에게 쿠키정보 전달! ");
		
        location.href='cookieTest.jsp';
    </script>






</body>
</html>