<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
    <h1>ReadAll.jsp</h1>
    <h2> DB에 저장해놓은 계정정보 하나를 가져와서 출력 </h2>
    
    <%
      String DRIVER = "com.mysql.cj.jdbc.Driver";
      String DBURL = "jdbc:mysql://localhost:3306/jspdb";
      String DBID = "root";
      String DBPW = "1234";
    
      // 1 드라이버 로드
      Class.forName(DRIVER);
      out.print(" 드라이버 로드 성공! <br>");
      // 2 디비 연결
      Connection con =
         DriverManager.getConnection(DBURL, DBID, DBPW);
      
      out.print(" 디비 연결 성공! <br>");
      
      // 3 sql작성 & pstmt 생성
      String sql = "select * from itwill_member";
      PreparedStatement pstmt = con.prepareStatement(sql);
      
      // 4 sql 실행
      //pstmt.executeUpdate(); - insert,update,delete 구문
      //pstmt.executeQuery(); - select 구문
      
      // select문 결과 (레코드셋)을 저장하는 객체
      ResultSet rs = pstmt.executeQuery();
      
      // 5  데이터 처리
      while(rs.next()){ //데이터가 있을때
    	  
    	  // DB정보를 화면에 출력
    	  String id = rs.getString("id");
          String pw = rs.getString("pw");
          String name = rs.getString("name");
          String gender = rs.getString("gender");
          int age = rs.getInt("age");
          String email = rs.getString("email");
          Timestamp reg_date = rs.getTimestamp("reg_date");
          
          out.print(" 아이디 : "+id+"<br>");   	  
          out.print(" 비밀번호 : "+pw+"<br>");   	  
          out.print(" 이름 : "+name+"<br>");   	  
          out.print(" 성별 : "+gender+"<br>");   	  
          out.print(" 나이 : "+age+"<br>");   	  
          out.print(" 이메일 : "+email+"<br>");   	  
          out.print(" 회원가입일 : "+reg_date+"<hr>");   	  
    	  
      }
      
    
    
    %>
    
    
    
    
    
    
    
    
    
    
    

</body>
</html>