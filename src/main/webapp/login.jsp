<%--
  Created by IntelliJ IDEA.
  User: seonghwan
  Date: 11/17/23
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="login.do" method = "post">
	<label for "ID">ID:</label>
	<input type = "text" name = "memberId"><br>
	<label for "pwd">Password</label>
	<input type = "password" name = "password"><br>
	<button type = "submit">login</button>
</form>
</body>
</html>
