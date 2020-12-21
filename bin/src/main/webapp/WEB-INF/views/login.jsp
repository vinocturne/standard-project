<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="EUC-KR">
<title>로그인</title>
</head>
<body>
<h1>로그인</h1>
<hr>
<form action="login.do" method="post">
	<table border="1" cellpadding="0" cellpspacing="0">
	<tr>
		<th bgcolor="grey">아이디</th>
		<td><input type="text" name="c_Id"/></td>
	</tr>
	<tr>	
		<th bgcolor="grey">비밀번호</th>
		<td><input type="password" name="c_Password"/></td>
	</tr>
	
	<tr>
		<input type="submit" value="로그인"/>
	</tr>
	</table>
	
</form>
</body>
</html>