<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
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
	<h1>fWritePro.jsp</h1>
	<%
		// 파일업로드
		//업로드 파일 위치
		String path = request.getRealPath("/upload");
		// 업로드 용량 5MB
		int maxSize = 5*1024 * 1024; 
		// 파일 업로드 객체 생성
		MultipartRequest multi =
				new MultipartRequest(request,path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		
		System.out.println(" 파일 업로드 완료! ");
		
		// 데이터 저장(DB)
		
		//BoardBean 객체 생성
		BoardBean bb = new BoardBean();
		
		bb.setName(multi.getParameter("name"));
		bb.setPass(multi.getParameter("pass"));
		bb.setSubject(multi.getParameter("subject"));
		bb.setContent(multi.getParameter("content"));
		bb.setFile(multi.getFilesystemName("file")); //업로드된 파일의 이름만 저장
		
		bb.setIp(request.getRemoteAddr());
		
		// DAO 객체 생성
		BoardDAO dao = new BoardDAO();
		// 파일업로드 기능 -> 글쓰기 기능
		dao.insertBoard(bb);	

		// 페이지 이동(list)
		response.sendRedirect("boardList.jsp");
	%>








</body>
</html>