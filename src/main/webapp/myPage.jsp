<%--
  Created by IntelliJ IDEA.
  User: seonghwan
  Date: 11/17/23
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<style>

	#changePasswordBtn{
		border : none;
	}
	#getHistoryBtn{
		border : none;
	}
	
    .active-btn {
    	background-color : lightgrey;
    	border-radius : 5%;
    }

</style>

<div class = "jumbotron">
	
	<div>
	<a href = "http://localhost:9999/index.jsp"><img src = "./img/home.png"/>
	</a>
	<h1>마이페이지</h1>
	</div>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="collapse navbar-collapse" id="navbarNav">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <button class="nav-link" id="changePasswordBtn">비밀번호 변경하기</button>
	      </li>
	      <li class="nav-item">
	        <button class="nav-link" id="getHistoryBtn">히스토리 가져오기</button>
	      </li>
	    </ul>
	  </div>
	</nav>
	
	<div id="changePassword" class="jumbotron text-center">
	    <!-- Change Password form -->
	    <form id="passwordForm" action="api/updateMember.do" method="post" class="mt-4 d-inline-block w-50">
		<div id="passwordForm" class="form-group">
		    <div class="row">
		        <div class="col-md-4">
		            <label for="password" class="col-form-label">새 비밀번호</label>
		        </div>
		        <div class="col-md-8">
		            <input type="password" class="form-control" name="password" id="password">
		        </div>
		    </div>
		</div>
	        <button type="submit" class="btn btn-primary float-md-right">변경하기</button>
	    </form>
	    <hr>
	    <div style = "margin-top : 50px">
	        <h3 style = "margin-bottom:20px">회원 탈퇴</h3>
	        <p>회원 탈퇴 시, 고객 정보 및 개인형 서비스 이용 기록은 개인 정보보호 처리 방침 기준에 따라 삭제됩니다.</p>
	        <p>회원 탈퇴 시, 더이상 서비스 이용이 불가능합니다.</p>
	        <button class="btn btn-danger" id = "deleteMemberBtn">탈퇴하기</button>
	    </div>
	</div>

	
	<div id="getHistory" style="display: none;">
	    <!-- History table -->
	    <table id="historyTable" class = "table table-hover" style = "margin-top : 30px;">
	        <thead>
				<tr>
					<th>과자명</th>
					<th>과자갯수</th>
					<th>먹은시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${histories}" var="history">
				<tr>
					<td>${history.snackName}</td>
					<td>${history.count}</td>
					<td>${history.time}</td>
				</tr>			
				</c:forEach>
			</tbody>
	    </table>
	</div>
</div>
</body>
</html>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        // Function to get and display history
	    function getHistory() {
	        $('#changePassword').hide(); // Hide Change Password section
	        $('#getHistory').show(); // Show Get History section
	        $('#historyTable').show(); // Show Get History section

	        // Make AJAX call or load content for history
	        $.ajax({
	            type: 'GET', 
	            url: 'api/getHistory.do', 
	            success: function(data) {
	                $('#historyTable').html(data); // Show history table
	            },
	            error: function() {
	                // Handle error if necessary
	            }
	        });
	    }
	
	    // getHistoryBtn click event
	    $('#getHistoryBtn').on('click', function(e) {
	        e.preventDefault();
	        getHistory(); // Call the function to get and display history
	        $(this).addClass('active-btn');
            $('#changePasswordBtn').removeClass('active-btn');
	    });
	    
        $('#changePasswordBtn').on('click', function(e) {
            e.preventDefault();
            $('#changePassword').show(); // Show Change Password section
            $('#getHistory').hide(); // Hide Get History section
            $('#historyTable').hide(); // Hide history table if visible
            $(this).addClass('active-btn');
            $('#getHistoryBtn').removeClass('active-btn');
        });
		
        $('#deleteMemberBtn').on('click', function(e){
	        $.ajax({
	            type: 'GET', 
	            url: 'api/getHistory.do', 
	            success: function(data) {
	                $('#historyTable').html(data); // Show history table
	            },
	            error: function() {
	                // Handle error if necessary
	            }
	        });
        })
	  });
</script>
