<%-- Created by IntelliJ IDEA. User: seonghwan Date: 11/17/23 Time: 1:35 PM To
change this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <body>
  <div class = "jumbotron">
    <jsp:include page="./header.jsp" >
   		<jsp:param name="pageTitle" value="간식관리시스템" />
    </jsp:include>

    <a href="index.jsp">home</a> <br />
    <a href="login.jsp">login</a> <br />
    <a href="admin/selectAll.do">admin-inventory</a> <br />
    <a href="student/selectAll.do">student-inventory</a> <br />
    <a href="admin/registerSnack.do">admin-register-snack</a> <br>






    <a href="student/voteSnack.do">vote</a> <br>
    <a href="getMemberRank.do">member rank</a> <br>
    <a href="getSnackRank.do">snack rank</a> <br>
   </div>
  </body>
</html>
