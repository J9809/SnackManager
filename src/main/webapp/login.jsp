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

<body >
<div class = "jumbotron d-flex flex-column align-items-center" style = "margin-top: 5%; background-color: white;">
<h1 class = "title">스낵매니저</h1>
<h2 class = "heading">로그인</h2>
<p class = 'paragraph'>회원님께서 가입하신 아이디와 비밀번호를 입력해주세요.</p>

<form id="loginForm" class = "w-50">
  <div class="form-group row">
    <label class="col-sm-2 col-form-label">ID: </label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="memberId" placeholder = "아이디를 입력해주세요." id = "memberId">
    </div>
  </div>
  <div class="form-group row">
    <label class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="password" placeholder="비밀번호를 입력해주세요" id = "password">
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function () {
    $('#loginForm').submit(function (event) {
        event.preventDefault(); // Prevent the form from submitting normally

        // Send AJAX request
        $.ajax({
            type: 'POST',
            url: 'login.do',
            data: $(this).serialize(), // Serialize form data
            success: function (response) {
                if (response.success) {
                	console.log(response.success)
                    // Redirect to another page or handle success as needed
                    window.location.replace('index.jsp');
                } else {
                    // Display the alert message
                    $('#memberId').val('');
                    $('#password').val('');
                    alert(response.message);
                    
                }
            },
            error: function () {
                alert('An error occurred while processing the login.');
            }
            
        });
    });
});
  document.getElementById("registerButton").addEventListener("click", function() {
    window.location.href = "registerMember.jsp"; // Redirects to register.jsp
  });
</script>

