<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<script src="../js/jquery-3.6.0.min.js"></script>
<!-- 추가 라이브러리 (innerfade) -->
<script src="../js/jquery.innerfade.js"></script>
<!-- 추가 라이브러리 (slick) -->
<script src="../js/slick.js"></script>


<script type="text/javascript">
   $(function(){
	   
	   $('h1').click(function(){
		   // 효과 - show() / hide() / toggle()
		   //        slideDown() / slideUp() / slideToggle()
		   //        fadeIn() / fadeOut() / fadeToggle()
		   
		   //$(요소).toggle("속도",콜백함수);
		   // 콜백함수 : 적용하려는 효과가 모두 실행된 후에 동작하는 함수
		   
		   
		   $('div').fadeToggle("slow",function(){
			   alert("토글 끝!");
		   });
		   
	   });
	   
	   
	   $('#news').innerfade();
	   
	   $('.itwill').slick({
		   infinite: true,
		   slidesToShow: 3,
		   slidesToScroll: 3
	   });
	   
	   
	   
   });
   
</script>
</head>
<body>
   <h1>열기/닫기</h1>
   	<div>
   	  <h1>제목</h1>
   	  <p>내용</p>
   	</div>
   	
   <h1>열기/닫기</h1>
   	<div>
   	  <h1>제목</h1>
   	  <p>내용</p>
   	</div>
   	
   	<hr>
   	
<!--    	<ul id="news">  -->
<!--        <li> -->
<!--        		<img src="../jq/1.jpg"> -->
<!--        </li> -->
<!--        <li> -->
<!--        		<h3>부산</h3> -->
<!--        </li> -->
<!--        <li> -->
<!--        		<h3>아이티윌</h3> -->
<!--        </li> -->
<!--     </ul> -->

    <hr><hr><hr><hr><hr><hr><hr><hr><hr><hr>
    

	<div class="itwill">
		<div>your content</div>
		<div>your content</div>
		<div>your content</div>
	</div>






</body>
</html>