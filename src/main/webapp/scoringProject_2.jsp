<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProjectDAO"%>
<%@ page import="dao.ProjectStudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<% 
   String id = (String) session.getAttribute("id");
   session.setAttribute("id", id);
   String title = request.getParameter("title");
   
   ArrayList<ProjectStudentObj> assignments = (new ProjectStudentDAO()).getAssignmentList(title);
   
   String str = "<form method=post action=inputScore.jsp>";
   
   str+="<table align=left style=line-height:200% border=0>";
   str+="<tr style=\"font-family:yg-jalnan\" align=left><th colspan=5><b style=\"font-size:30px;\">제출물 리스트</b></th></tr>";
   str+="<tr style=\"font-family:yg-jalnan\" align=left><td colspan=5><br></td></tr>";
   str+="<tr style=\"font-family:yg-jalnan\" align=left>";
   str+="<td width=\"100\"> <b style=\"font-size:15px;\">이름</b> </td>";
   str+="<td width=\"300\"> <b style=\"font-size:15px;\">제출 내용</b> </td>";
   str+="<td width=\"200\"> <b style=\"font-size:15px;\">제출 날짜</b> </td>";
   str+="<td width=\"100\"> <b style=\"font-size:15px;\">점수</b> </td>";
   str+="<td width=\"200\"> <b style=\"font-size:15px;\">피드백</b> </td>";

   int count = 0;
   for (ProjectStudentObj assignment : assignments) {
	  count++;
	  str+="<tr><td colspan=5><hr></td></tr>";
	      
	  str+="<tr style=\"font-family:yg-jalnan\" align=left>";
	  str+="<td>" + assignment.getID() + "</td>";
	  str+="<td>" + assignment.getContent() + "</td>";
	  str+="<td>" + assignment.getSdate() + "</td>";
		      
	  if(assignment.getFeedback()!=null){
	   	  str+="<td>" + assignment.getPoint() + "</td>";
	   	  str+="<td>" + assignment.getFeedback() + "</td>";
	   	  str+="</tr>";
	  }
	  else{
	      str+="<td>" + "<input type=number name=score min=0 max=100 multiple>" + "</td>";
	      str+="<td>" + "<textarea name=feedback multiple>" + "</textarea>" + "</td>";
	      str+="</tr>";
	      str+="<input type=hidden name=idx multiple value=" + assignment.getProject_idx() + ">";    	  
	  }		  
   }	 
   if(count==0){
	  str+="<tr><td colspan=5><hr></td></tr>";
	  str+="<tr style=\"font-family:yg-jalnan\" align=center><td colspan=5>제출자가 없습니다.</td></tr>";		   
   }
   str += "<tr style=\"font-family:yg-jalnan\" align=center><th colspan=5><b style=\"font-size:15px;\"><input type=submit value=채점완료></b></th></tr>";
   str+="</table>";
   str+="</form>";
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