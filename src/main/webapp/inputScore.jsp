<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.ProjectStudentDAO" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%
   request.setCharacterEncoding("utf-8");
   String[] idx = request.getParameterValues("idx");
   String[] score = request.getParameterValues("score");
   String[] feedback = request.getParameterValues("feedback");
   String title = request.getParameter("title");
      
   ProjectStudentDAO psdao = new ProjectStudentDAO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/setting.css">
<title>congratulations!</title>
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
   <div class="main" style=font-family:yg-jalnan align=center>
   <%
      psdao.refresh();
      if(psdao.insert_score(idx, score, feedback)){
         out.print("<h1>프로젝트 채점이 완료되었습니다.<br>");
         out.print("<a href=\"membermaint.jsp\"><input type=button value=돌아가기 style=\"width:150px;font-size:15px;\"></a></h1>");
      }
      else{
         out.print("<h1>제출 중 오류가 발생하였습니다.</h1>");
      }
   %>
   </div>
   <%-- FOOTER --%>
   <div class="footer">
      <%@ include file="footer.jsp" %>
   </div>
</div>
</body>
</html>