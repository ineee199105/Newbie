<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   // index.jsp
   // 프로젝트의 시작지점
   // * MVC 프로젝트에서 실행가능한 유일한 jsp페이지
   //   (주소줄에 jsp 주소가 노출된경우 잘못된 구조)
   
   //response.sendRedirect("main/main.jsp");
//    response.sendRedirect("./itwill.bo");
   //response.sendRedirect("./BoardWrite.bo");
  // response.sendRedirect("./BoardList.bo");
   //response.sendRedirect("./GoodsList.ag");
   
   // 테스트용 ID정보 생성
   //session.setAttribute("id","admin");
   session.setAttribute("id","itwill");
   
//    response.sendRedirect("./GoodsList.go");
   response.sendRedirect("./BasketList.ba");


%>    
