<%@page import="com.itwillbs.admin.goods.db.GoodsDTO"%>
<%@page import="com.itwillbs.board.db.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
	<jsp:include page="../inc/top.jsp"/>	
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
  <jsp:include page="../inc/left.jsp"></jsp:include>
<!-- 왼쪽메뉴 -->

<%
	//reqeust 영역에 저장
	//request.setAttribute("goodsList", goodsList);
	List<GoodsDTO> goodsList =(List<GoodsDTO>)request.getAttribute("goodsList");
%>
<!-- 게시판 -->
<article>
<h1>등록 상품 목록(관리자용)</h1>
<table id="notice">
	<tr>
		<th class="ttitle" colspan="2">
		  <a href="./GoodsAdd.ag">상품<br>등록하기</a>
		</th>
    </tr>
	<tr>
		<th class="tno">번호</th>
		<th class="ttitle">사진</th>
	    <th class="ttitle">상품명</th>
	    <th class="ttitle">카테<br>고리</th>
	    <th class="ttitle">가격</th>
	    <th class="ttitle">수량</th>
	    <th class="ttitle">등록일</th>
	    <th class="ttitle">수정<br>삭제</th>
    </tr>
    
    <%for(int i=0;i<goodsList.size();i++){
           GoodsDTO dto = goodsList.get(i);
    %>
	    <tr>
			<td><%=dto.getNum() %></td>
			<td>
				<img src="./shopUpload/<%=dto.getImage().split(",")[0]%>" 
				   width="50" height="50"
				>
			</td>
		    <td><%=dto.getName() %></td>
		    <td><%=dto.getCategory() %></td>
		    <td><%=dto.getPrice() %></td>
		    <td><%=dto.getAmount() %></td>
		    <td><%=dto.getDate()%></td>
		    <td>
		     <a href="./GoodsModify.ag?num=<%=dto.getNum()%>">수정</a>
		     <br>
		     <a href="./GoodsDeleteAction.ag?num=<%=dto.getNum()%>">삭제</a>
		     </td>
	    </tr>
    <%} %>
    
</table>


<div id="table_search">
</div>

<div class="clear"></div>
	
	<div id="page_control"></div>
	
	
	
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>