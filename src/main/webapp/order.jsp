<%--
  Created by IntelliJ IDEA.
  User: seonghwan
  Date: 11/17/23
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>

	.total-price {
		display: flex;
		justify-content: flex-end;
		margin-right : 20px;
	}
	
	.total-container{
		display:flex;
		justify-content: flex-end;
	}
</style>

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



  <div class="container mt-3">
	  <!-- 스크롤바 추가를 위한 부모 컨테이너 -->
	  <div class="table-container">
		  <table class="table">
			  <thead class="thead-light">
			  <tr>
				  <!-- 컬럼 이름 및 정렬 버튼 추가 -->
				  <th>과자 이름</th>
				  <th>가격</th>
				  <th>수량</th>
				  <!-- 추가적인 컬럼은 여기에 추가 -->
			  </tr>
			  </thead>
			  <!-- forEach 사용 -->
			  <tbody class = "tbody-for-remove">
			  <c:forEach items="${snacks}" var="snack">
				  <tr>
					  <td>${snack.name}</td>
					  <td><fmt:formatNumber value="${snack.price}" pattern="##,###원" /></td>
					  <td>${snack.quantity}</td>
					  <!-- 추가적인 데이터에 대한 표시는 여기에 추가 -->
				  </tr>
			  </c:forEach>
			  </tbody>
		  </table>
		  <div class = "total-container">
		  <div class="total-price"></div>
		  </div>
	  </div>
  </div>
</body>
</html>

<script>

	function getRequest(b) {
		const settings = {
			"url": "http://localhost:9999/knapsack.do?budget=" + String(b),
			"method": "GET",
			"timeout": 0,
		};
		$.ajax(settings).done(function (data) {
			let totalPrice = 0;
			$('.tbody-for-remove').empty();
			$.each(data, function (index, snack) {
				$('.table').append('<tr><td>' + snack.name + '</td><td>' + snack.price + '</td><td>' + snack.quantity + '</td></tr>');
				totalPrice += Number(snack.price) * Number(snack.quantity);
			});
			console.log(totalPrice);
			const tp = document.querySelector('.total-price');
			tp.innerHTML = "총액: " + String(totalPrice) + "원";
			
	        if (!document.querySelector('.submit-btn')) {
	            const submitButton = document.createElement("button");
	            submitButton.innerText = "주문"; // Set the button text
	            submitButton.classList.add("btn"); // Add classes if needed
	            submitButton.classList.add("btn-primary"); // Add classes if needed
	            submitButton.classList.add("submit-btn");
	            // Append the button after the total-price div
	            tp.insertAdjacentElement('afterend', submitButton);

	            // Handling click event for the submit button
	            submitButton.addEventListener("click", function () {
	            	 $.ajax({
	                     url: '/updateSnack.do',
	                     type: 'POST',
	                     contentType: 'application/json',
	                     data: JSON.stringify(data), // Sending the list of snacks in the request body
	                     success: function (response) {
	                         console.log("updateSnack.do success");
                            window.location.href = '/index.jsp';
	                     },
	                     error: function (error) {
	                         console.error("Error in updateSnack.do");
	                     }
	                 });
	            
	            
	            });
	        }
			
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