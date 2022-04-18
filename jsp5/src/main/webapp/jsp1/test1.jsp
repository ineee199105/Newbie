<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <script type="text/javascript">
       for(var i=0;i<5;i++){
    	   document.write(" 자바스크립트! <br>");
       }
   
   </script>
</head>
<body>
   <h1> JSP 첫시간! </h1>
   JSP => HTML + Java <br>
   
	<%
	  // JAVA문법
	  // 주석문
	  /* 
	  주
	  석
	  문
	  */ 
	
	%>  
	
	<!-- HTML 주석문 -->
	
	<%-- JSP 주석문 --%>
	
	
	<%
	   // 문자열 배열을 생성후 출력
	   // "JAVA","JSP","HTML","DB"
	   String[] strArr ={"JAVA","JSP","HTML","DB"};
	
	   for(int i=0;i<strArr.length;i++){
		   System.out.println(strArr[i]);
	   }
	   
	   for(int i=0;i<strArr.length;i++){
		   out.println(strArr[i]+"<br>");
	   }
	   
	   
	   for(int i=0;i<strArr.length;i++){
   %>
		<h2> html반복하기 <%=strArr[i] %></h2>   
   <%		   
	   }
   %>
   
   <hr>
   
   <table border="1">
     <tr>
        <td>과목</td>
        <td>과목</td>
     </tr>
     
     <%
      int cnt = 0;
      for(int i=0;i<2;i++){
   	  %>
         <tr>
 			<%
 			   for(int j=0;j<2;j++){
 				   %>
 				     <td><%=strArr[cnt] %></td>
 				   <%
 				   cnt++;
 			   } 			
 			%>         
         </tr>	  
   	  <%
      }
     %>
     
   
   </table>
   
	
	
	
	
	
	
	
	
	
	
	
	
	 
   
   
</body>
</html>