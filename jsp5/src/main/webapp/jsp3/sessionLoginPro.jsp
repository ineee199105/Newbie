<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionLoginPro.jsp</h1>
	<%
     String userID = "admin";
     String userPW = "1234";
     
     // 전달해준 id,pw 정보를 받아오기
     String id = request.getParameter("id");
     String pw = request.getParameter("pw");
     
     // 참조형 타입(String)의 데이터 비교는 (==) 객체의 주소값 비교
     // 참조형 타입(String)의 데이터 비교는 (equals()) 객체의 데이터값 비교
     //  A.equals(B)  => 값이 동일할때 True 다를때 false
     
	if(id.equals(userID)){
		//out.println("아이디 같음");
		if(pw.equals(userPW)){
			// 비밀번호 같음
			// 로그인성공 => 메인페이지 이동
			// 로그인을 했다는 증명 => 아이디정보를 세션영역에 저장
			
			session.setAttribute("id", id);
			// sessionMain.jsp 페이지로 이동
			
			response.sendRedirect("sessionMain.jsp");			
		}else{
			// 비밀번호 다름
			out.print(" 비밀번호 오류!! ");
		}
	}else{
		out.println("아이디 다름");
	}
     
     
    
    
    
    %>




</body>
</html>