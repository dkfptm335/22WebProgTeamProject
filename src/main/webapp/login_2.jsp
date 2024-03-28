<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/setting.css">
</head>
<body>
<form action=member.jsp method=post>
	<table align=cenetr border=0 style=line-height:200%>
	<tr align=center style="font-family:yg-jalnan">
		<td><b style="font-size:30px;">로그인</b></td>
	</tr>
	<tr align=center>
		<td><input type=text size=30 name="id" placeholder="아이디" required style="width:300px;height:20px;font-size:15px;"></td>
	</tr>
	<tr align=center>
		<td><input type=password size=30 name="pw" placeholder="비밀번호" required style="width:300px;height:20px;font-size:15px;"></td>
	</tr>
	<tr style="font-family:yg-jalnan" align=center>
	      <td> 
	      <input type=radio size=15 id=id1 name="position" value="student" checked><label for=id1>학생</label>
	      <input type=radio size=15 id=id2 name="position" value="teacher"><label for=id2>교수</label>
	      </td>
	   </tr>
	<tr align=center>
		<td>
		<a href="signup.jsp"><input type=button value=회원가입 style="width:150px;font-size:15px;"></a>
		<input type=submit value=로그인 style="width:150px;font-size:15px;">
		</td>
	</tr>
	</table>
</form>
</body>
</html>