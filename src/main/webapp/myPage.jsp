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
<div class = "jumbotron">
	<h1>마이페이지</h1>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="collapse navbar-collapse" id="navbarNav">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" id="changePasswordBtn">비밀번호 변경하기</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" id="getHistoryBtn">히스토리 가져오기</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	
	<div id="changePassword">
	    <!-- Change Password form -->
	    <form id="passwordForm" action="api/updateMember.do" method="post">
	        <!-- Form fields -->
	        <label>새 비밀번호</label>
	        <input type="password" name="password"><br>
	        <button type="submit">변경하기</button>
	        
	    </form>
	    
	    <button>탈퇴하기 </button>
	</div>
	
	<div id="getHistory" style="display: none;">
	    <!-- History table -->
	    <h2>히스토리 가져오기</h2>
	    <table id="historyTable">
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
	    });
	    
        $('#changePasswordBtn').on('click', function(e) {
            e.preventDefault();
            $('#changePassword').show(); // Show Change Password section
            $('#getHistory').hide(); // Hide Get History section
            $('#historyTable').hide(); // Hide history table if visible
        });

	  });
</script>
