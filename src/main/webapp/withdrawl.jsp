<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.StudentDAO" %>
<%@ page import="dao.TeacherDAO" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String num = request.getParameter("sid");
	String position = request.getParameter("position");
	
	StudentDAO sdao = new StudentDAO();
	TeacherDAO tdao = new TeacherDAO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/setting.css">
<title>main page</title>
</head>
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
	<div class="main" style="font-family:yg-jalnan;" align=center>
	<%
	if(position.equals("student")){ // 학생 로그인
		int code = sdao.login(id, pw);
		if(code == 1) // 아이디 없음
			out.print("<h1>회원정보가 존재하지 않습니다.</h1>");
		else if(code == 2) // 비밀번호 불일치
			out.print("<h1>회원정보가 존재하지 않습니다.</h1>");
		else{ // 로그인 성공 -> 탈퇴
			if(sdao.delete(id))
				out.print("<h1>회원탈퇴가 완료되었습니다.</h1>");
			else
				out.print("<h1>회원탈퇴 처리 중 오류가 발생하였습니다.</h1>");
		}
	}
	else{ // 교수 로그인
		int code = tdao.login(id, pw);
		if(code == 1) // 아이디 없음
			out.print("<h1>회원정보가 존재하지 않습니다.</h1>");
		else if(code == 2) // 비밀번호 불일치
			out.print("<h1>회원정보가 존재하지 않습니다.</h1>");
		else{ // 로그인 성공 -> 탈퇴
			if(tdao.delete(id))
				out.print("<h1>회원탈퇴가 완료되었습니다.</h1>");
			else
				out.print("<h1>회원탈퇴 처리 중 오류가 발생하였습니다.</h1>");
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