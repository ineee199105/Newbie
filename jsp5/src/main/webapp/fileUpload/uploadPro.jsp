<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>uploadPro.jsp</h1>
	<%
	  // 업로드 폴더
	  String uploadPath = "D:\\zzz";
	
	  // 업로드파일의 크기 (10MB)
	  int size = 10 * 1024 * 1024;
	  
	  // 파일 업로드
	  
	  MultipartRequest multi 
	         = new MultipartRequest(
	        		 request,
	        		 uploadPath,
	        		 size,
	        		 "UTF-8",
	        		 new DefaultFileRenamePolicy()
	        		 );
	  
	  System.out.println(" 파일 업로드 완료! ");
	  
	
	
	
	
	%>
	
	
	
	
	

</body>
</html>