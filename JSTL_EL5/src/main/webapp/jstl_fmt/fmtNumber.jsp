<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>/jstl_fmt/fmtNumber.jsp</h1>
   
   1000000000<br>
   
   <hr>
   <h2> formatNumber 사용 기본 숫자 [,] 구분 </h2>
   <fmt:formatNumber value="1000000000" /> <br>
   <fmt:formatNumber value="1000000000" groupingUsed="false"/> <br>
   
   <h2> 소수점 데이터 표현 </h2>
   <h3> 3.1234654  소수점 2자리까지만 출력 (# -데이터, .-소수점 )</h3>
   
   <fmt:formatNumber value="3.1234654" pattern="#.#####"></fmt:formatNumber>
   
   <h3> 10.5 소수점 2자리까지 출력 10.50 (비어있는 데이터는 0으로 표시)</h3>
   <fmt:formatNumber value="10.5" pattern="##.00000"/>
   
   <hr>
   
   <fmt:formatNumber value="${7/9 }" type="percent"/>
   
   <hr>
   <fmt:formatNumber value="10000000" type="currency"/> <br>
   <fmt:formatNumber value="10000000" type="currency" currencySymbol="@"/> <br>
   
   
   
   
   
   
   
   
   
   
   
   

</body>
</html>