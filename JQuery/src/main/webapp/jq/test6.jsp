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
	  // append() , prepend()
	  
	  $('body').append("<h2>안녕하세요 append</h2>");
	  $('body').prepend("<h2>안녕하세요 prepend</h2>");
	  
	  $('div').append(function(idx,oldStr){
		  //alert(idx+"/"+oldStr);
		  return " : "+(idx+1)*1000+"원";
	  });
	  
	  
	  // 2차원배열 => JSON
	  // [] 배열, {} 객체
	  var arr = [ 
		  { name : "학생1", addr : "부산" }, 
		  { name : "학생2", addr : "서울" },
		  { name : "학생3", addr : "제주" } 
	  ];
	  
	  console.log(arr);
	  
	  $('div').append(function(i){
		  
		  //alert(arr[i]);
		  console.log(arr[i]);
		  
		  return "("+arr[i].name+","+arr[i].addr+")";
		  
// 		  var item = arr[i];
// 		  return "("+item.name+","+item.addr+")";	  
	  });
	  
	  
// 	  $('table').append(function(i){
// 		  return "<tr> <td>"+arr[i].name +"</td><td>"+ arr[i].addr+"</td></tr>";
// 	  });
	  
	  
	  //  each()구문
	  // $(요소).each(function(){});
	  // $.each(요소,function(){});
	  $(arr).each(function(i,e){
		  //alert(1);
		  console.log(i+"// "+e);
		  console.log(e);
		  $('table').append(function(){
			  return "<tr> <td>"+e.name +"</td><td>"+ e.addr+"</td></tr>";
		  });
	  });
	  
	  $.each(arr,function(i,e){
		  //alert(1);
		  console.log(e);
		  $('table').append(function(){
			  return "<tr> <td>"+e.name +"</td><td>"+ e.addr+"</td></tr>";
		  });
	  });
	  
	  
	  
	  
	  
  });

</script>

</head>
<body>
   <h1>test6.jsp</h1>
   <h2>HELLO~</h2>
   
   <hr>
   <div>용돈</div>  <!-- 용돈 : 1000원 -->
   <div>용돈</div>  <!-- 용돈 : 2000원 -->
   <div>용돈</div>  <!-- 용돈 : 3000원 --> 
   
   <hr>
   <table border="1">
      <tr>
         <td>이름</td>
         <td>지역</td>
      </tr>
   </table>
   
   
   
   
   
</body>
</html>