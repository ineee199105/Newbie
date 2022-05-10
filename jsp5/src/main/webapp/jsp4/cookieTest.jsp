<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
      [서버]
      1) 쿠키 객체 생성 (쿠키명,값)
      2) 쿠키에 필요한 설정 => 유효시간,설정,도메인,path,보안....
      3) 클라이언트에게 정보 전달(쿠키)
      
      [클라이언트]
      1) 웹 브라우저를 사용하여 페이지 요청
      2) 페이지정보(응답정보) + 쿠키 정보(이름,값 쌍으로 만들어진 배열형태) 받아옴
      3) 쿠키 배열을 통해서 이름정보를 사용해서 값을 활용
   
   크롬 쿠키가 저장되는 주소
   C:\\Users\\ITWILL\\AppData\\Local\\Google\\Chrome
     \\User Data\\Default\\Cache\\Cache_Data
    -->

	<h1>cookieTest.jsp</h1>

	<h2>클라이언트</h2>
	<%
     // 쿠키정보를 가져온다.
     Cookie[] cookies = request.getCookies();
   
     String cName = "";
     String cValue = "";
     
     // 쿠키이름을 사용하여 쿠키값 접근
     if( cookies != null){
	     for(int i=0;i<cookies.length;i++){
	    	 // 쿠키 이름이 "name" 찾기
	    	System.out.println(i+" - "+ cookies[i].getName());
			if(cookies[i].getName().equals("name")){
				 System.out.println(" 쿠키값 : "+ cookies[i].getValue());
				 cName = cookies[i].getName();
				 cValue = cookies[i].getValue();
			}
	    	 
	     }
     }
   
   %>

	<hr>

	<h2>
		쿠키명 :
		<%=cName %>
	</h2>
	<h2>
		쿠키값 :
		<%=cValue %></h2>

	<input type="button" value="쿠키값 생성"
		onclick=" location.href='cookieSet.jsp'; ">

	<input type="button" value="쿠키값 삭제"
		onclick=" location.href='cookieDel.jsp'; ">







</body>
</html>