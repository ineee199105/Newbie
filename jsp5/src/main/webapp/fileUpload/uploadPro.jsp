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
	  //String uploadPath = "D:\\zzz";
	  //String uploadPath = "C:\\Users\\ITWILL";
	  // => 상용서비스에서의 직접경로 업로드 불가능
      // => 가상 경로 upload	
      
	  String uploadPath = request.getRealPath("/upload"); 	  
	
	  // 업로드파일의 크기 (10MB)
	  int size = 10 * 1024 * 1024;
	  
	  // 파일 업로드
	  
	  MultipartRequest multi = new MultipartRequest(
	        		 request,
	        		 uploadPath,
	        		 size,
	        		 "UTF-8",
	        		 new DefaultFileRenamePolicy()
	        		 );
	  
	  System.out.println(" 파일 업로드 완료! ");
	  
	
	  // 전달해준 파라메터값 저장
	  // 전달할때 form 형태가 변경되었기 때문에 
	  // 받을때도 변경된 형태를 처리해서 저장
	  
// 	  String name = request.getParameter("name");
// 	  String msg =  request.getParameter("msg");
  	  String name = multi.getParameter("name");
  	  String msg = multi.getParameter("msg");
//   	  String fileName = multi.getParameter("file");
  	  String fileName = multi.getFilesystemName("file");
  	  String oFileName = multi.getOriginalFileName("file");
	
	%>
	
    이름 : <%=name %><br>
    메세지 : <%=msg %><br>
    서버에 업로드 되는 파일명(fileName) : <%=fileName %><br>
    실제 업로드 된 원본 파일명(oFileName) : <%=oFileName %><br>
    
    <hr><hr>
    
    <!-- 사용하는 브러우저에 파서가 포함되어 있는경우 
         화면에 바로 파싱되어 출력됨 /  해당 파서가 없는경우 다운로드 형태로 처리          
     -->
    <a href="../upload/<%=fileName%>">파일다운로드(방법1)</a>
    
    <a href="fileDown.jsp?fileName=<%=fileName%>"> 다운로드 페이지 이동(방법2) </a>
    
    
    
    
	
	
	

</body>
</html>