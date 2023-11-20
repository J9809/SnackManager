<%--
  Created by IntelliJ IDEA.
  User: seonghwan
  Date: 11/17/23
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 5rem;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        /* 레이블 텍스트와 입력 필드의 간격을 조정 */
        .label-text {
            display: inline-block;
            width: 13%; /* 레이블 텍스트의 너비 조정 */
            text-align: end;
        }

        .input {
            flex: 1;
            padding-left: 20px;
            display: flex;
        }

        /* 공통 input 필드의 너비를 조정 */
        input[type="text"],
        input[type="password"] {
            width: 75%; /* input 필드의 너비 조정 */
        }

        /* 회원가입 제목 크기 조정 */
        .signup-title {
            font-size: 2rem; /* 원하는 크기로 조정하세요 */
        }
        
        .duplicated{
        	color : red;
        }
        
        .not-duplicated{
        	color : green;
        }
        
    </style>
</head>
<body>
    <header>
        <!-- 네비게이션 바 추가 가능 -->
    </header>

    <main role="main">
        <div class="container">
            <div class="jumbotron" style = "display : flex; align-items:center; flex-direction : column;">
                <h2 class="signup-title" align="center">회원가입</h2>
                <p class="lead" align="center">회원가입을 하시면 다양한 서비스를 제공받으실 수 있습니다.</p>
                <form action="api/registerMember.do" method="post" onsubmit="return validatePassword()" style = "width : 80%;">
                    <div class="form-group">
                        <label class="label-text" for="name">이름</label>
                        <div class="input">
                            <input type="text" class="form-control" id="name" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="label-text" for="memberId">아이디</label>
                        <div class="input">
                            <input type="text" class="form-control" id="memberId" name="memberId">
                        	<button class = "btn btn-secondary" style = "margin-left : 10px;" id = "duplicateChkBtn">중복확인</button>
                        </div>
                    </div>
           			<div id = "duplicateMessage" style = "text-align : right; width : 78%; margin-bottom : 20px;"></div>
                    
                    <div class="form-group">
                        <label class="label-text" for="password">비밀번호</label>
                        <div class="input">
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="label-text" for="confirm-password">비밀번호 확인</label>
                        <div class="input">
                            <input type="password" class="form-control" id="confirm-password" name="confirm-password" required>
                        </div>
                    </div>
                    <input type="hidden" name="voteFlag" value="N">
                    <input type="hidden" name="role" value="student">
                    <div class="row justify-content-end" style = "width : 81%;">
                        <div class="col-auto">
                            <button type="submit" class="btn btn-primary">가입</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <footer>
        <!-- 페이지 하단에 추가될 내용 -->
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    function areAllFieldsFilled() {
        var name = $("#name").val();
        var memberId = $("#memberId").val();
        var password = $("#password").val();
        var confirmPassword = $("#confirm-password").val();

        return name !== "" && memberId !== "" && password !== "" && confirmPassword !== "";
    }    
    
    function toggleRegisterButton() {
        var registerButton = $("button[type='submit']");
        if (areAllFieldsFilled() && $("#duplicateMessage").hasClass("not-duplicated")) {
            registerButton.prop("disabled", false);
        } else {
            registerButton.prop("disabled", true);
        }
    }

    $("input").on("input", function() {
        toggleRegisterButton();
    });  
       
    function validatePassword() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirm-password").value;

        if (password !== confirmPassword) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }
        return true;
    }
    
    
    $("#duplicateChkBtn").click(function() {
    	event.preventDefault();
        var memberId = $("#memberId").val(); // Get the memberId from the input field
        $.ajax({
            url: "/checkDuplicateId.do", // Updated URL for the API endpoint
            method: "GET",
            data: { memberId: memberId },
            success: function(response) {
                console.log(response);
                if (response === "duplicated") {
                    document.getElementById('duplicateMessage').innerHTML = '이미 사용 중인 아이디입니다.';
                    duplicateMessage.classList.add('duplicated');
                    duplicateMessage.classList.remove('not-duplicated');
                } else if (response === "not duplicated") {
                    document.getElementById('duplicateMessage').innerHTML = '사용 가능한 아이디입니다.';
                    duplicateMessage.classList.add('not-duplicated');
                    duplicateMessage.classList.remove('duplicated');
                    toggleRegisterButton(); // Check conditions for enabling the register button

                } else {
                    console.log("Error or unexpected response:", response);
                }
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
            }
        });
    });

                
        
    </script>
</body>
</html>



