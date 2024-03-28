<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
   request.setCharacterEncoding("utf-8");
   String id = (String) session.getAttribute("id");
   session.setAttribute("id", id);
   
   TeacherDAO tdao = new TeacherDAO();
   
   ArrayList<TeacherObj> teachers = (new TeacherDAO()).getInfo(id);
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
	   <table align=center>
		<tr align=center style="font-family:yg-jalnan">
			<td><h1>프로젝트 기반 지식 공유 학습</h1></td>
		</tr>
		<tr>
			<td><img src="mainlogo.jpg" alt="MAIN LOGO"></td>
		</tr>
		<tr align=center style="font-family:yg-jalnan">
			<td><h3>
				<%
					for(TeacherObj teacher : teachers)
					{
		        		out.print("(" + teacher.getID() + ") " + teacher.getName()+"[교수]님 로그인 하셨습니다.");
		        	}
				%>
			</h3></td>
		</tr>
		</table>
   </div>
   <%-- FOOTER --%>
   <div class="footer">
      <%@ include file="footer.jsp" %>
   </div>
</div>
</body>
</html>