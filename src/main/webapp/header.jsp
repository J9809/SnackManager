<%--
  Created by IntelliJ IDEA.
  User: seonghwan
  Date: 11/17/23
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.service.spring.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Member member = (Member) session.getAttribute("loginUser");
	String userName = member.getName();
	
    String pageTitle = request.getParameter("pageTitle");
    if (pageTitle == null || pageTitle.isEmpty()) {
        pageTitle = "간식관리시스템";
    }
%>
<html>
<head>
     <title><%= pageTitle %></title>
</head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  
<body>
<div class = "jumbotron" style = "background-color : white; padding-bottom : 0;">
<a href = "http://localhost:9999/index.jsp" style = " margin-right : 20px; "><img src = "./img/home.png"/>
</a>
<h1 style = "text-align : center ;display : inline-block; margin-left : 30%;"><%= pageTitle %></h1>
<div style = "display: flex; justify-content : flex-end; ">
    <div style="margin-right: 10px; display:flex; justify-content : center; align-items: center; "><%= userName %> 님</div>
    <button id = "myPageBtn" class = "btn btn-outline-info" style="margin-right: 10px;">마이페이지</button>
    <button class = "btn btn-outline-danger" style="margin-right: 10px;" id = "logoutBtn">로그아웃</button>
</div>
<hr>
</div>
</body>
</html>

<script>
document.getElementById('myPageBtn').addEventListener('click', function() {
    window.location.href = 'myPage.jsp'; // Replace 'mypage.jsp' with your actual page URL
});

$(document).ready(function() {
    $('#logoutBtn').on('click', function() {
        $.ajax({
            type: 'GET',
            url: 'logout.do', // Replace with your logout endpoint
            success: function() {
                alert('로그아웃 되었습니다.'); // Display logout message
                window.location.href = '/login.jsp'; // Redirect to the login page
            },
            error: function() {
            }
        });
    });
});

</script>
