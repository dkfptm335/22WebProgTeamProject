<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/setting.css">
</head>
<body>
<form method=post action=memberinfo.jsp>
<table align=center style=line-height:200% border=0>
   <tr style="font-family:yg-jalnan" align=center>
      <td> <b style="font-size:30px;">회원가입</b> </td>
   </tr>
   <tr style="font-family:yg-jalnan" align=center>
      <td> <b style="font-size:15px;">회원가입이 완료되면 이용하실 수 있습니다.</b> </td>
   </tr>
   <tr align=center style="width:300px;height:20px;font-size:15px;">
      <td>
      <input type=text size=30 name="id" placeholder="아이디" required style="width:300px;height:20px;font-size:15px;"></td>
   </tr>
   <tr align=center>
      <td>
      <input type=password size=30 name="pw1" placeholder="비밀번호" required style="width:300px;height:20px;font-size:15px;"></td>
   </tr>
   <tr align=center>
      <td>
      <input type=password size=30 name="pw2" placeholder="비밀번호 확인" required style="width:300px;height:20px;font-size:15px;"> </td>
   </tr>
   <tr align=center>
      <td>
      <input type=text size=30 name="name" placeholder="이름" required style="width:300px;height:20px;font-size:15px;"> </td>
   </tr>
   <tr align=center>
      <td> 
      <input type=text size=30 name="sid" placeholder="학번/교번"  required style="width:300px;height:20px;font-size:15px;"> </td>
   </tr>
   <tr style="font-family:yg-jalnan" align=center>
      <td> 
      <input type=radio size=15 id=id1 name="position" value="student" checked><label for=id1>학생</label>
      <input type=radio size=15 id=id2 name="position" value="teacher"><label for=id2>교수</label>
      </td>
   </tr>
   <tr align=center>
      <td>
      <input type=reset value=초기화 style="width:150px;font-size:15px;">
      <input type=submit value=회원가입 style="width:150px;font-size:15px;">
      </td>
   </tr>
   <tr align=center>
      <td colspan=2>
      <input type=button value=약관보기 style="width:305px;font-size:15px;">
      </td>
   </tr>
</table>

</form>
</body>
</html>