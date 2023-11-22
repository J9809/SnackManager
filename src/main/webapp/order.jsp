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
    <title>간식 주문 페이지</title>
</head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<body>
  <jsp:include page="./header.jsp">
    <jsp:param name="pageTitle" value="간식 주문" />
  </jsp:include>
  
	  <div class="row" style = "display : flex; justify-content : center;">
	    <div class="col-auto">
	      <h3>예산</h3>
	    </div>
	    <div class="col-5">
	      <input type="text" class="form-control" placeholder="가격을 입력하세요">
	    </div>
	    <div class = "col-auto">
	   	<button type = "submit" class = "btn btn-primary" style = "margin-left : 20px;">확인</button>	    
	  	</div>
	  </div>
	<hr style = "width : 80%;">


</body>
</html>

<script>

	function getRequest(b) {
		const settings = {
			"url": "http://localhost:9999/knapsack.do?budget=" + String(b),
			"method": "GET",
			"timeout": 0,
		};
		$.ajax(settings).done(function (response) {
			console.log(response);
			location.reload();
		});
	}

	$(function () {
		$("button").click(function (e) {
			e.preventDefault()
			console.log(e)

			const res = document.querySelector(".form-control");
			console.log(res.value)

			getRequest(Number(res.value));
		});
	});
</script>