<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.ProjectDAO"%>
<%@ page import="dao.ProjectObj"%>
<% 
   ArrayList<ProjectObj> feeds = (new ProjectDAO()).getProjectList2();
   
   String str = "<form method=post action=submitInfo.jsp>"; 
   str += "<table align=left style=line-height:200% border=0>";
   str += "<tr style=\"font-family:yg-jalnan\" align=left><td> <b style=\"font-size:30px;\">프로젝트 제출하기<br></b> </td>";
   str += "</tr>";
         
   str +="<tr style=\"font-family:yg-jalnan\" align=left>";
   str +="<td> <b style=\"font-size:15px;\">제목</b> </td>";
   str += "</tr>";
   
   str += "<tr align=left style=\"width:300px;height:20px;font-size:15px;\">";
   str += "<td>";
   str += "<select name=\"title\" required style=\"font-family:yg-jalnan;width:300px;height:20px;font-size:15px;\">";
   for (ProjectObj feed : feeds) {
      str += "<option value=\"";
      str += feed.getTitle();
      str += "\">";
      str += feed.getTitle();
      str += "</option>";
   }

   str += "</td>";
    str += "</tr>";
    str += "<tr style=\"font-family:yg-jalnan\" align=left>";
    str += "<td> <b style=\"font-size:15px;\">프로젝트 내용</b> </td>";
    str += "</tr>";
    str += "<tr align=left style=\"width:300px;height:20px;font-size:15px;\">";
    str += "<td>";
    str += "<textarea name=\"content\" placeholder=\"프로젝트 내용\" style=\"font-family:yg-jalnan;width:300px;height:100px;font-size:15px;\"></textarea></td>";
    str += "</tr>";
    str += "<tr style=\"font-family:yg-jalnan\" align=left>";
    str += "<td> <b style=\"font-size:15px;\">첨부파일</b> </td>";
    str += "</tr>";
    str += "<tr align=left style=\"width:300px;height:20px;font-size:15px;\">";
    str += "<td><input type=file name=\"file\" style=\"font-size:15px;\"></td>";
    str += "</tr>";
    str += "<tr align=left>";
    str += "<td>";
    str += "<input type=reset value=초기화 style=\"width:150px;font-size:15px;\">";
    str += "<input type=submit value=제출 style=\"width:150px;font-size:15px;\">";
    str += "</td>";
    str += "</tr>";
    str+="</table>";
    str += "</form>";
   out.print(str);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/setting.css">
</head>
<body>
</body>
</html>