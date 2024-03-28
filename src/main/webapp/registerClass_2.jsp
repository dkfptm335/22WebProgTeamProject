<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/setting.css">
</head>
<body>
<form method=post action=classInfo.jsp>
	<table align=left style=line-height:200% border=0>
	   <tr style="font-family:yg-jalnan" align=left>
	      <td> <b style="font-size:30px;">수업 등록하기<br></b> </td>
	   </tr>
	   <tr style="font-family:yg-jalnan" align=left>
	      <td> <b style="font-size:15px;">강좌명</b> </td>
	   </tr>
	   <tr align=left style="width:300px;height:20px;font-size:15px;">
	      <td>
	      <input type=text name="classname" placeholder="강좌명" required style="font-family:yg-jalnan;width:300px;height:20px;font-size:15px;"></td>
	   </tr>
	   <tr style="font-family:yg-jalnan" align=left>
	      <td> <b style="font-size:15px;">강좌 세부사항</b> </td>
	   </tr>
	   <tr align=left style="width:300px;height:20px;font-size:15px;">
	      <td>
	      <textarea name="classdetail" placeholder="강좌 설명" style="font-family:yg-jalnan;width:300px;height:100px;font-size:15px;"></textarea></td>
	   </tr>
	   <tr align=left>
	      <td>
	      <input type=reset value=초기화 style="width:150px;font-size:15px;">
	      <input type=submit value=등록 style="width:150px;font-size:15px;">
	      </td>
	   </tr>
	</table>
</form>
</body>
</html>