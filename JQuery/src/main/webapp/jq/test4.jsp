<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
	  
	  // attr('속성','값');
	  // 1번그림의 이름을 출력
	  var src1 = $('#img1').attr('src');
	  
	  alert(src1);
	  
	  // img태그, 'border' 속성값을 5지정
	  $('img').attr('border','5');
	  
	  // 이미지 가로길이를 150으로 변경
	  $('img').attr('width',150);
	  
	  // img태그, 'border' 속성을 각각 5/10/15 
	  
	  $('img').attr('border',function(idx){
		  return (idx+1)*5;
	  });
	  
	  
	  // img 'border' - 5, 
	  //      'width' - 이미지간의 크기차이가 각 50씩 50/100/150
	  //      'height' - 100 / 200 / 300
	  $('img').attr({
		  border : 5,
		  width : function(idx){
			  return (idx+1)*50;
		  },
		  'height' : function(idx){
			  return (idx+1)*100;
		  }		  
	  });
	  
	  
	  
  });
</script>


</head>
<body>
	<h2>WebContent/jq/test4.jsp</h2>
	
	<img id="img1" src="1.jpg">
	<img src="2.jpg" >
	<img src="3.jpg">
	
	   

</body>
</html>