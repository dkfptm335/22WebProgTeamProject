<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.StudentDAO" %>
<%@ page import="dao.TeacherDAO" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw1 = request.getParameter("pw1");
	String pw2 = request.getParameter("pw2");
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
		<%@ include file="category.jsp" %>
	</div>
	<%-- MAIN --%>
	<div class="main" style=font-family:yg-jalnan align=center>
	<%
		if(!pw1.equals(pw2)){
			out.print("<h1>비밀번호가 일치하지 않습니다.<br>회원가입에 실패하였습니다.</h1>");
		}
		else{
			if(position.equals("student")){ // 학생 가입
				if(sdao.exists(id) || tdao.exists(id)){
					out.print("<h1>이미 존재하는 아이디입니다.</h1>");
					return;
				}
				if(sdao.insert(id, pw1, name, num)){
					out.print("<h1>회원가입이 완료되었습니다.<br>");
					out.print("<a href=\"login.jsp\"><input type=button value=로그인 style=\"width:150px;font-size:15px;\"></a></h1>");
				}
				else{
					out.print("<h1>회원가입 처리 중 오류가 발생하였습니다.</h1>");
				}
			}
			else { // 교수 가입
				if(sdao.exists(id) || tdao.exists(id)){
					out.print("<h1>이미 존재하는 아이디입니다.</h1>");
					return;
				}
				if(tdao.insert(id, pw1, name, num)){
					out.print("<h1>회원가입이 완료되었습니다.<br>");
					out.print("<a href=\"login.jsp\"><input type=button value=로그인 style=\"width:150px;font-size:15px;\"></a></h1>");
				}
				else{
					out.print("<h1>회원가입 처리 중 오류가 발생하였습니다.</h1>");
				}
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