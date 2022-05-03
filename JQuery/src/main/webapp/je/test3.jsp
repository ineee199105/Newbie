<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	// js  아이디,비밀번호 미입력시 페이지이동 금지
 
	function check(){
		//alert("@@@");
		if(document.fr.id.value == ""){
			alert(" 아이디를 입력하세요. ");
			document.fr.id.focus();
			return false;
		}
		
		if(document.fr.pw.value.length <= 0){
			alert(" 비밀번호를 입력하세요. ");
			document.fr.pw.focus();
			return false;
		}
	}


   $(document).ready(function(){
	   $('form').submit(function(){
		   //alert("aaaaa");
		   
		   if( $('#id').val() =="" ){
			   alert("아이디를 입력하세요");
			   $("#id").focus();
			   return false;
		   }
		   if( $('#pw').val().length <=0){
			   alert("비밀번호를 입력하세요@@@");
			   $('#pw').focus();
			   return false;
		   }
		   
	   });
	   
	   
	   
   });
</script>

</head>
<body>
   <h1>WebContent/je/test3.jsp</h1>
   
   <form action="itwill.jsp" name="fr" onsubmit="return check();">
      아이디 : <input type="text" name="id"  id="id"><br>
      비밀번호 : <input type="password" name="pw" id="pw"><br>
      <input type="submit" value="로그인">   
   </form>

</body>
</html>