<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<table width=780 border=0 cellpadding=0 cellspacing=0>
	<tr>
	  <td width="20"></td>
	  <td>
  		<!--contents-->
	  <table width=590 border=0 cellpadding=0 cellspacing=0>
		  <tr>
			<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>회원가입</b></td>
		  </tr>
		  <tr>
			<td align="center">회원가입을 하시면 다양한 서비스를 제공받으실 수 있습니다</td>
		  </tr>
	  </table>  
	  <br>
	  
	  <!-- write Form  -->
	  <form method="post" action="savePhone.do">
	  <table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
		  <tr>
			<td width=100 align=center bgcolor="E5EDF9" height="22">이름</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10">
				<input type="text" style="width:150" name="num"/>  
			</td>
		  </tr>
		  <tr>
			<td width=100 align=center bgcolor="E5EDF9" height="22">아이디</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10">
				<input type="text" style="width:150" name="model"/>
			</td>
		  </tr>
		  <tr>
			<td width=100 align=center bgcolor="E5EDF9" height="22">비밀번호</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10">
				<input type="text" style="width:150" name="model"/>
			</td>
		  </tr>
		  <tr>
			<td width=100 align=center bgcolor="E5EDF9" height="22">비밀번호 확인</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10">
				<input type="text" style="width:150" name="model"/>
			</td>
		  </tr>	  
	  </table>

	  <br>
	  
	  <table width=590 border=0 cellpadding=0 cellspacing=0>
		  <tr>
			<td align=center>
			<input type="submit" value="회원가입" /> &nbsp;
			</td>
		  </tr>
	  </table>
	  </form>
	  </td>
	</tr>
</table>  

</body>

</html>