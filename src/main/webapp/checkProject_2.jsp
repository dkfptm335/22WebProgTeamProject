<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<% 
   String id = (String) session.getAttribute("id");
   session.setAttribute("id", id);
   
   ArrayList<ProjectStudentObj> projects = (new ProjectStudentDAO()).getProjectList(id);
   
    String str = "<table align=left style=line-height:200% border=0>";
    str+="<tr style=\"font-family:yg-jalnan\" align=left><th colspan=5><b style=\"font-size:30px;\">제출한 프로젝트 목록</b></th></tr>";
    str+="<tr style=\"font-family:yg-jalnan\" align=left><th colspan=5><b style=\"font-size:30px;\"><br></b></th></tr>";
    str+="<tr style=\"font-family:yg-jalnan\" align=left>";
    str+="<td width=\"200\"> <b style=\"font-size:15px;\">제목</b> </td>";
    str+="<td width=\"200\"> <b style=\"font-size:15px;\">제출날짜</b> </td>";
    str+="<td width=\"200\"> <b style=\"font-size:15px;\">점수</b> </td>";
    str+="<td width=\"200\"> <b style=\"font-size:15px;\">피드백</b> </td>";
    
    for (ProjectStudentObj project : projects) {
       str+="<tr><td colspan=5><hr></td></tr>";
       
       str+="<tr style=\"font-family:yg-jalnan\" align=left>";
       str+="<td><b>" + project.getTitle()+"</td>";
       str+="<td><b>" + project.getSdate()+"</td>";
       str+="<td><b>" + project.getPoint()+"</td>";
       if(project.getFeedback() == null){
          str+="<td><b>미채점</td>";
       }
       else{
          str+="<td><b>" + project.getFeedback()+"</td>";
       }
       str+="</tr>";
    }
    str+="</table>";
    out.print(str);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>