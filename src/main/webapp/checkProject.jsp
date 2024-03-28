<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/setting.css">
<title>check project page</title>
</head>
<body>
<div>
   <%-- HEAD --%>
   <div class="head"> 
      <%@ include file="head.jsp" %>
   </div>
   <%-- CATEGORY --%>
   <div class="category">
      <%@ include file="category_student.jsp" %>
   </div>
   <%-- MAIN --%>
   <div class="main">
      <%@ include file="checkProject_2.jsp" %>
   </div>
   <%-- FOOTER --%>
   <div class="footer">
      <%@ include file="footer.jsp" %>
   </div>
</div>
</body>
</html>