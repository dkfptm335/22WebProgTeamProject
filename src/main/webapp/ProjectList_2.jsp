<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.ProjectDAO"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<% 
   String id = (String) session.getAttribute("id");
   session.setAttribute("id", id);
   
   ArrayList<ProjectObj> feeds = (new ProjectDAO()).getProjectList(id);
   
   String str = "<table align=left style=line-height:200% border=0>";
   str+="<tr style=\"font-family:yg-jalnan\" align=left><th colspan=5><b style=\"font-size:30px;\">프로젝트 리스트</b></th></tr>";
   str+="<tr style=\"font-family:yg-jalnan\" align=left><td colspan=5><br></td></tr>";
   str+="<tr style=\"font-family:yg-jalnan\" align=left>";
   str+="<td width=\"200\"> <b style=\"font-size:15px;\">제목</b> </td>";
   str+="<td width=\"200\"> <b style=\"font-size:15px;\">수업</b> </td>";
   str+="<td width=\"200\"> <b style=\"font-size:15px;\">시작날짜</b> </td>";
   str+="<td width=\"200\"> <b style=\"font-size:15px;\">마감날짜</b> </td>";
   str+="<td width=\"200\"> <b style=\"font-size:15px;\">프로젝트 설명</b> </td>";
   for (ProjectObj feed : feeds) {
      str+="<tr><td colspan=5><hr></td></tr>";
      
      str+="<tr style=\"font-family:yg-jalnan\" align=left>";
      str+="<td>" + "<a href=\"scoringProject.jsp?title=" + feed.getTitle() + "\">" + feed.getTitle()+"</td>";
      str+="<td>" + feed.getClassname()+"</td>";
      str+="<td>" + feed.getSdate()+"</td>";
      str+="<td>" + feed.getFdate()+"</td>";
      str+="<td>" + feed.getContent()+"</td>";
      str+="</tr>";
   }
   str+="</table>";
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