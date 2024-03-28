<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/setting.css">
<title>main page</title>
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
   <div class="main">
	  <% String title = request.getParameter("title"); %>
	  <jsp:include page="scoringProject_2.jsp">
	     <jsp:param name="title" value="<%= title %>"/>
	  </jsp:include>
   </div>
   <%-- FOOTER --%>
   <div class="footer">
      <%@ include file="footer.jsp" %>
   </div>
</div>
</body>
</html>