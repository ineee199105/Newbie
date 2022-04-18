<%@page import="com.itwillbs.member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>insertPro.jsp</h1>
   <%
     // 한글처리
     request.setCharacterEncoding("UTF-8");
     // 전달받은 정보( 회원가입 정보 ) - 자바빈객체 액션태그사용
     // 화면에 출력   
   %>
   
   <!-- 객체 생성 -->
   <jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
   <jsp:setProperty property="*" name="mb"/>
   
   아이디 : <jsp:getProperty property="id" name="mb"/> <br> 
   비밀번호 : <%=mb.getPw() %> <br>
   이름 : <%=mb.getName() %><br>
   성별 : <%=mb.getGender() %> <br>
   나이 : <%=mb.getAge() %> <br>
   이메일 : <jsp:getProperty property="email" name="mb"/><br>
   
   <%
//     Timestamp reg_date = new Timestamp(System.currentTimeMillis());
//     mb.setReg_date(reg_date);
    mb.setReg_date(new Timestamp(System.currentTimeMillis()) );
   %>
   
   회원가입일 : <jsp:getProperty property="reg_date" name="mb"/><br>
   
   <%
     // DB처리 => DAO 객체 생성
     MemberDAO dao = new MemberDAO();
     
     // 회원가입을 처리하는 동작 구현 => 메서드 생성
     dao.insertMember(mb);	    
   
   %>
   
   <script type="text/javascript">
     alert("회원가입 완료!");
     location.href="loginForm.jsp";   
   </script>
   
   
   
   
   
   
   
   
   
   
   
   

</body>
</html>