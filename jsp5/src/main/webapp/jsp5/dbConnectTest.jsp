<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>dbConnectTest.jsp</h1>
   
   <%
     // 0 - mysql드라이버 설치 (JDBC드라이버 설치)
     // WebContent/WEB-INF/lib/mysql-connector-java-8.0.28.jar
     
     // 1 단계 : 설치된 드라이버를 사용하여 정보 로드
     Class.forName("com.mysql.cj.jdbc.Driver");
     
     System.out.println(" 드라이버 로드 성공! ");
     
     // 2 단계 : 드라이버를 사용하여 Mysql에 접속
     //DriverManager.getConnection("디비주소", "아이디", "비밀번호");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
     //jdbc:mysql://localhost:3306/jspdb
     //[프로토콜]:// [DB주소]:[포트번호] / [디비명]
     
     System.out.println(" 디비연결 성공! ");
     System.out.println("연결정보 : "+ con);
     
     
     
   
   
   %>
   
   
   
   
   
   
</body>
</html>