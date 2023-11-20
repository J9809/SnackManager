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
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
	.custom-background {
	    background-color: #A3C2F1; /* Your desired background color */
	    padding: 20px; /* Adjust the padding as needed for spacing */
	    border-radius: 10px; /* Optionally, add rounded corners for a nicer look */
	}
	
	.samsung-bg{
		color : white;
		background-color : #1429A0
	}

	.title{
	padding-bottom : 20px;
	}

  .heading {
    padding: 10px; 
  }

  .paragraph {
    padding: 10px; 
  }
</style>

<body>
<div class = "jumbotron d-flex flex-column align-items-center" style = "margin-top: 5%">
<h1 class = "title">스낵매니저</h1>
<h2 class = "heading">로그인</h2>
<p class = 'paragraph'>회원님께서 가입하신 아이디와 비밀번호를 입력해주세요.</p>

<form action="login.do" method = "post" class = "w-50 custom-background">
  <div class="form-group row">
    <label class="col-sm-2 col-form-label">ID: </label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="memberId" placeholder = "아이디를 입력해주세요.">
    </div>
  </div>
  <div class="form-group row">
    <label class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="password" placeholder="비밀번호를 입력해주세요">
    </div>
  </div>
    <div class="col-sm-10 offset-sm-2">
      <button type="submit" class="btn samsung-bg float-right">로그인</button>
    </div>
</form>

<button id = "registerButton" class = "btn samsung-bg">회원가입</button>
</div>
</body>

</html>
<script>
  document.getElementById("registerButton").addEventListener("click", function() {
    window.location.href = "registerMember.jsp"; // Redirects to register.jsp
  });
</script>

