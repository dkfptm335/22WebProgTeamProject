<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/setting.css">
<title>modify info page</title>
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
   <form action=modifyinfo_teacher_2.jsp method=post>
      <%
         String id = (String) session.getAttribute("id");
         session.setAttribute("id", id);
      
         ArrayList<TeacherObj> teachers = (new TeacherDAO()).getInfo(id);
         String str = "<table align=center border=0 style=line-height:200%"+">";
         str += "<tr><th colspan=5><h1>회원정보 수정</h1></th></tr>";
         for(TeacherObj teacher : teachers){
            str += "<tr>";
            str += "<td>아이디</td>";
            str += "<td>"+teacher.getID()+"</td>";
            str += "<td rowspan=4><h1>→</h1></td>";
            str += "<td>&nbsp;아이디</td>";
            str += "<td>"+teacher.getID()+"</td>";
            str += "</tr>";
            str += "<tr>";
            str += "<td>이름</td>";
            str += "<td>"+teacher.getName()+"</td>";
            str += "<td>&nbsp;이름</td>";
            str += "<td>"+teacher.getName()+"</td>";
            str += "</tr>";
            str += "<tr>";
            str += "<td>비밀번호</td>";
            str += "<td>"+teacher.getPW()+"</td>";
            str += "<td>&nbsp;비밀번호</td>";
            str += "<td><input type=password name=npw required style=\"font-family:yg-jalnan;width:150px;height:30px;font-size:20px;\"></td>";
            str += "</tr>";
            str += "<tr>";
            str += "<td>학번/교번</td>";
            str += "<td>"+teacher.getNum()+"</td>";
            str += "<td>&nbsp;학번/교번</td>";
            str += "<td><input type=text name=nnum required style=\"font-family:yg-jalnan;width:150px;height:30px;font-size:20px;\"></td>";
            str += "</tr>";
            str += "<tr align=center>";
            str += "<td colspan=5><input type=reset value=초기화 style=\"width:150px;font-size:15px;\">&nbsp;";
            str += "<input type=submit value=수정하기 style=\"width:150px;font-size:15px;\"></td>";
            str += "</tr>";
         }
         str += "</table>";
         out.print(str);
      %>
   </form>
   </div>
   <%-- FOOTER --%>
   <div class="footer">
      <%@ include file="footer.jsp" %>
   </div>
</div>
</body>
</html>