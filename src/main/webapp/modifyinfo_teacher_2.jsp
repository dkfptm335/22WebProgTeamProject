<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%
   request.setCharacterEncoding("utf-8");
   String id = (String) session.getAttribute("id");
   session.setAttribute("id", id);
   String npw = request.getParameter("npw");
   String nnum = request.getParameter("nnum");
   
   TeacherDAO tdao = new TeacherDAO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/setting.css">
<title>teacher page</title>
</head>
<body>
<div>
   <%-- HEAD --%>
   <div class="head"> 
      <%@ include file="head.jsp" %>
   </div>
   <%-- CATEGORY --%>
   <div class="category">
      <%@ include file="category_teacher.jsp" %>
   </div>
   <%-- MAIN --%>
   <div class="main" style="font-family:yg-jalnan;font-size:20px">
   <%
      if(tdao.update(id, npw, nnum))
         out.print("<h1>회원정보 수정이 완료되었습니다.</h1>");
      else
         out.print("<h1>회원정보 수정 처리 중 오류가 발생하였습니다.</h1>");
   %>
   </div>
   <%-- FOOTER --%>
   <div class="footer">
      <%@ include file="footer.jsp" %>
   </div>
</div>
</body>
</html>