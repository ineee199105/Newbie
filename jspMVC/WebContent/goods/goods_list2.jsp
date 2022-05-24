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
<h1>등록 상품 목록(사용자용)</h1>
<table id="notice">
	<tr>
		<th class="tno" colspan="4">
		<a href="./GoodsList.go">전체</a>  &nbsp; &nbsp; &nbsp; &nbsp;
		<a href="./GoodsList.go?item=best">인기상품</a>  &nbsp; &nbsp;   &nbsp; &nbsp;
		<a href="./GoodsList.go?item=outwear">외투</a>   &nbsp; &nbsp; &nbsp; &nbsp;
		<a href="./GoodsList.go?item=fulldress">정장</a>   &nbsp; &nbsp; &nbsp; &nbsp;
		<a href="./GoodsList.go?item=Tshirts">티셔츠</a>   &nbsp; &nbsp; &nbsp; &nbsp;
		<a href="./GoodsList.go?item=shirts">와이셔츠</a>  &nbsp; &nbsp;  &nbsp; &nbsp;
		<a href="./GoodsList.go?item=pants">바지</a>    &nbsp; &nbsp; &nbsp; &nbsp;
		<a href="./GoodsList.go?item=shoes">신발</a>
		</th>
    </tr>
    
    
    <c:set var="size" value="${goodsList.size() }"/>
    <%-- 크기 : ${size } --%>
    <c:set var="col" value="4"/>
    <c:set var="row" value="${(size/col + (size%col>0? 1:0)) }"/>
    <%-- row : ${row } --%>
    <c:set var="goodsCnt" value="0"/>
    
    <c:set var="list" value="${goodsList }"/>
    
    
	    <c:forEach begin="1" end="${row }" step="1">
	       <tr>
	           <c:forEach begin="1" end="${col }" step="1">
	            <c:if test="${size > goodsCnt}">
	              <td>
	                   <img src="./shopUpload/${list[goodsCnt].image.split(',')[0]}"
						         width="160" height="160"><br>
						     
						     <a href="./GoodsDetail.go?num=${list[goodsCnt].num }">${list[goodsCnt].name }</a><br>
						     ${list[goodsCnt].price }원<br>		
	              </td>
                </c:if>
	              <c:set var="goodsCnt" value="${goodsCnt+1 }"/>
	              
	           </c:forEach>         
	       </tr>
	    </c:forEach>
  
    
    
    
    
    
    
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