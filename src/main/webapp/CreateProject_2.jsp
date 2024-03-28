<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.*"%>
<%
	String id = (String) session.getAttribute("id");
	session.setAttribute("id", id);
	ArrayList<ClassObj> classes = (new ClassDAO()).getClassList(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/setting.css">
</head>
<body>
<form method=post action=ProjectInfo_nofile.jsp>
<table align=left style=line-height:200% border=0>
   <tr style="font-family:yg-jalnan" align=left>
      <td> <b style="font-size:30px;">프로젝트 생성하기<br></b> </td>
   </tr>
   <tr style="font-family:yg-jalnan" align=left>
      <td> <b style="font-size:15px;">수업</b> </td>
   </tr>
   <tr align=left style="width:300px;height:20px;font-size:15px;">
      <td>
      <select name="class" required style="font-family:yg-jalnan;width:300px;height:25px;font-size:15px;">
		 <%
		 	String str = null;
		 	for(ClassObj subject : classes)
		 	{
		 		str += "<option value=\"";
		 		str += subject.getClass_name();
		 	    str += "\">";
		 	    str += subject.getClass_name();
		 	    str += "</option>";
		 	}
		 	out.print(str);
		 %>      
      </select>
      </td>
   </tr>
   
   <tr style="font-family:yg-jalnan" align=left>
      <td> <b style="font-size:15px;">제목</b> </td>
   </tr>
   <tr align=left style="width:300px;height:20px;font-size:15px;">
      <td>
      <input type=text name="title" placeholder="제목" required style="font-family:yg-jalnan;width:300px;height:20px;font-size:15px;"></td>
   </tr>
   <tr style="font-family:yg-jalnan" align=left>
      <td> <b style="font-size:15px;">시작날짜</b> </td>
   </tr>
   <tr align=left style="font-family:yg-jalnan;width:300px;height:20px;font-size:15px;">
      <td>
      <input type=date name="sdate" placeholder="연도-월-일" required style="font-family:yg-jalnan;width:300px;height:20px;font-size:15px;"></td>
   </tr>
   <tr style="font-family:yg-jalnan" align=left>
      <td> <b style="font-size:15px;">마감날짜</b> </td>
   </tr>
   <tr align=left style="width:300px;height:20px;font-size:15px;">
      <td>
      <input type=date name="fdate" placeholder="연도-월-일" required style="font-family:yg-jalnan;width:300px;height:20px;font-size:15px;"></td>
   </tr>
   <tr style="font-family:yg-jalnan" align=left>
      <td> <b style="font-size:15px;">프로젝트 설명</b> </td>
   </tr>
   <tr align=left style="width:300px;height:20px;font-size:15px;">
      <td>
      <textarea name="content" placeholder="프로젝트 설명" style="font-family:yg-jalnan;width:300px;height:100px;font-size:15px;"></textarea></td>
   </tr>
   <tr style="font-family:yg-jalnan" align=left>
      <td> <b style="font-size:15px;">첨부파일</b> </td>
   </tr>
   <tr align=left style="width:300px;height:20px;font-size:15px;">
      <td><input type=file name="file" style="font-size:15px;"></td>
   </tr>
   <tr align=left>
      <td>
      <input type=reset value=초기화 style="width:150px;font-size:15px;">
      <input type=submit value=생성 style="width:150px;font-size:15px;">
      </td>
   </tr>
</table>
</form>
</body>
</html>