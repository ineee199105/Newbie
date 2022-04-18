<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Statement"%>
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
   <h1>CreatePro.jsp</h1>
   <%
     // 한글처리
     request.setCharacterEncoding("UTF-8");
   
     // 입력한 데이터(파라메터)를 모두 저장
     // id,pw,name,age,gender,email
     String id = request.getParameter("id");
     String pw = request.getParameter("pw");
     String name = request.getParameter("name");
     int age = Integer.parseInt( request.getParameter("age") );
     String gender = request.getParameter("gender");
     String email = request.getParameter("email");
     
     Timestamp reg_date = new Timestamp(System.currentTimeMillis());
    	
     // DB연결해서 정보 저장
     // 0 드라이버 설치
     
     // 1 드라이버 로드
     Class.forName("com.mysql.cj.jdbc.Driver");
     System.out.println(" 드라이버 로드 성공! ");
     
     // 2 디비연결
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234"); 
     System.out.println("디비 연결 성공");
     System.out.println(con);
     
     // 3 sql 쿼리생성(insert) & stmt객체 생성 
     //String sql = "insert into itwill_member(id,pw,name,gender,age,email,reg_date) values('"+id+"','"+pw+"','"+name+"','"+gender+"',"+age+",'"+email+"','2022-03-24')";
     String sql = "insert into itwill_member(id,pw,name,gender,age,email,reg_date) values(?,?,?,?,?,?,?)";
     
     // SQL쿼리를 실행하는 객체
     //Statement stmt = con.createStatement();
     PreparedStatement pstmt = con.prepareStatement(sql);
     
     // pstmt.setXXXXXX( ?의 위치(인덱스) , 값 );
     // 입력하는 ?의 데이터 타입에 따라서 메서드가 변경
     
     // ??? 처리
     pstmt.setString(1, id);
     pstmt.setString(2, pw);
     pstmt.setString(3, name);
     pstmt.setString(4, gender);
     pstmt.setInt(5, age);
     pstmt.setString(6, email);
     pstmt.setTimestamp(7, reg_date);
     
     
     // 4 sql 쿼리 실행
//      stmt.executeUpdate(sql);
     pstmt.executeUpdate();
     
     out.print("정보 저장완료!");     
     
   
   %>
   

</body>
</html>