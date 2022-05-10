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
	<h1>UpdatePro.jsp</h1>
	<!-- 입력된 정보를 화면에 출력(id/pw , 수정할정보 name,age,gender) -->
	<%
     // 한글처리
     request.setCharacterEncoding("UTF-8");
  
     String id = request.getParameter("id");
     String pw = request.getParameter("pw");
     String uName = request.getParameter("uName");
	 int	uAge = Integer.parseInt(request.getParameter("uAge"));
	 String uGender = request.getParameter("uGender");
  %>
	<h3>
		아이디 :
		<%=id %>
	</h3>
	<h3>
		비밀번호 :
		<%=pw %>
	</h3>
	<h3>
		수정할 이름 :
		<%=uName %>
	</h3>
	<h3>
		수정할 나이 :
		<%=uAge %></h3>
	<h3>
		수정할 성별 :
		<%=uGender %>
	</h3>

	<hr>

	<h2>DB연결후 정보 수정</h2>
	<%
	   String DRIVER = "com.mysql.cj.jdbc.Driver";
	   String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	   String DBID = "root";
	   String DBPW = "1234";  
    
      // 1 드라이버 로드
      Class.forName(DRIVER);
      out.print("드라이버 로드 성공!<br>");
      
      // 2 디비 연결
      Connection con =
        DriverManager.getConnection(DBURL, DBID, DBPW);
      
      out.print("디비연결 성공!<br>");
      // 3 sql 작성(update) & pstmt 객체 
      // 이름과 비밀번호가 동일할때 이름,나이,성별을 변경하겠다
      String sql = "update itwill_member set name=?, age=?,gender=? where id=? and pw=?";
      PreparedStatement pstmt = con.prepareStatement(sql);
      
      // ???
      pstmt.setString(1, uName);
      pstmt.setInt(2,uAge);
      pstmt.setString(3, uGender);
      pstmt.setString(4, id);
      pstmt.setString(5, pw);
      
      // 4 sql 실행    
      pstmt.executeUpdate();
      
      out.print("정보 수정완료! <br> ");
    
    %>



</body>
</html>