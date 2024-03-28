<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%
   request.setCharacterEncoding("utf-8");
   String classname = request.getParameter("classname");
   String classdetail = request.getParameter("classdetail");
   
   ClassDAO cdao = new ClassDAO();
   TeacherDAO tdao = new TeacherDAO();
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
      String id = (String) session.getAttribute("id");
      session.setAttribute("id", id);
      
      cdao.refresh();
      ArrayList<TeacherObj> teachers = (new TeacherDAO()).getInfo(id);
      for(TeacherObj teacher : teachers){
    	  String name = teacher.getName();
          if(cdao.insert(classname, classdetail, id, name)){
              out.print("<h1>수업 등록이 완료되었습니다.<br>");
              out.print("<a href=\"membermaint.jsp\"><input type=button value=돌아가기 style=\"width:150px;font-size:15px;\"></a></h1>");
          }
          else{
              out.print("<h1>수업 등록 중 오류가 발생하였습니다.</h1>");
          }
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