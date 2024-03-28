<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/setting.css">
<title>main page</title>
</head>
<meta http-equiv="refresh" content="2;main.jsp">
<body>
<div>
	<%-- HEAD --%>
	<div class="head"> 
		<%@ include file="head.jsp" %>
	</div>
	<%-- CATEGORY --%>
	<div class="category">
		<%@ include file="category.jsp" %>
	</div>
	<%-- MAIN --%>
	<div class="main" style="font-family:yg-jalnan;">
	<%
		session.invalidate();
		out.print("<h1>로그아웃 하였습니다.</h1>");
	%>
	</div>
	<%-- FOOTER --%>
	<div class="footer">
		<%@ include file="footer.jsp" %>
	</div>
</div>
</body>
</html>