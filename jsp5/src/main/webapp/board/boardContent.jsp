<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>boardContent.jsp</h1>
   
   <h2> 글 본문 </h2>
   
   <%
     // * DB에 사용되는 데이터는 테이블의 타입으로 형변환을 해야함 (DAO 실행전)
     
     // 전달되는 데이터가 있을경우 저장 (num,pageNum)
     int num = Integer.parseInt(request.getParameter("num"));
     String pageNum = request.getParameter("pageNum");
   
     // BoardDAO 객체 생성
     BoardDAO dao = new BoardDAO();
     
     // 조회수 1증가 
     dao.updateReadCount(num); 
     
     // 글 1개의 정보를 가져오는 동작()
     BoardBean bb = dao.getBoard(num);
   %>
   
   <table border="1">
     <tr>
        <td>글번호</td>
        <td><%=bb.getNum() %></td>
        <td>조회수</td>
        <td><%=bb.getReadcount() %></td>
     </tr>
     <tr>
        <td>작성자</td>
        <td><%=bb.getName() %></td>
        <td>작성일</td>
        <td><%=bb.getDate() %></td>
     </tr>
     <tr>
        <td>글 제목</td>
        <td colspan="3"><%=bb.getSubject() %></td>
     </tr>
     
     <%if(bb.getFile() != null){ %>
     <tr>
        <td>첨부파일</td>
        <td colspan="3">
        	<a href="../upload/<%=bb.getFile() %>"><%=bb.getFile() %></a><br>
        	<a href="../fileUpload/fileDown.jsp?fileName=<%=bb.getFile() %>"><%=bb.getFile() %></a><br>
        </td>
     </tr>
     <%} %>
     <tr>
        <td>글 내용</td>
        <td colspan="3"><%=bb.getContent() %></td>
     </tr>
     <tr>
        <td colspan="4">
           <input type="button" value="수정" 
			   onclick=" location.href='updateForm.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>'; "
			>
           <input type="button" value="삭제" 
               onclick=" location.href='deleteForm.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>';"
           >
           <input type="button" value="답글" 
                onclick=" location.href='reWriteForm.jsp?re_ref=<%=bb.getRe_ref() %>&re_lev=<%=bb.getRe_lev() %>&re_seq=<%=bb.getRe_seq() %>&num=<%=bb.getNum()%>'; "
           >
           <input type="button" value="목록" onclick="location.href='boardList.jsp?pageNum=<%=pageNum%>';">        
        </td>
     </tr>
     
   
   
   </table>
   
   
   
   
   

</body>
</html>