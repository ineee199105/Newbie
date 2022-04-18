<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>UpdateForm.jsp</h1>
   <h2> 정보를 입력해서 DB에서 수정 </h2>
   
   <fieldset>
     <form action="UpdatePro.jsp" method="post">
        아이디 : <input type="text" name="id" placeholder="아이디를 입력하세요."><br>
        비밀번호 : <input type="password" name="pw" placeholder="비밀번호를 입력하세요."><br>
        <hr>
        <h3> 수정할 정보 </h3>
        이름 : <input type="text" name="uName"><br>
        나이 : <input type="text" name="uAge"><br>
        성별 : <input type="radio" name="uGender" value="남">남
                <input type="radio" name="uGender" value="여">여<br>
        
        <input type="submit" value="정보수정하기">     
     </form>  
   </fieldset>
   
   
   
   
</body>
</html>