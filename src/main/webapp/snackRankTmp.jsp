<%@ page import="java.util.List" %>
<%@ page import="com.service.spring.domain.MemberRank" %>
<%@ page import="org.springframework.ui.Model" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
%>
<html>
<head>
	<title>Title</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<style>
	body a {
		text-decoration: none !important;
		color: inherit !important;
	}

</style>

<body>

<jsp:include page="./header.jsp">
	<jsp:param name="pageTitle" value="과자 랭킹" />
</jsp:include>

<div style=" width:90%; padding-left: 10%">
	<table class="table table-borderless">
		<thead class="table" style="background-color: #E4EEFF; text-align: center; vertical-align: middle">
            <tr>
                <th style="border-bottom: 1px solid #C1D3F2;"><h3>순위</h3></th>
                <th style="border-bottom: 1px solid #C1D3F2;"><h3>간식명</h3></th>
                <th style="border-bottom: 1px solid #C1D3F2; width: 40%;"><h3>과자별 사용자 랭킹</h3></th>
            </tr>
        </thead>
		<tbody>
		<div class="list display-snack-list" style="width:80%;">
			<c:forEach var="item" items="${list}">
				<tr class="display-each-snack" style="border-bottom : dotted #C1D3F2 1px">
					<td style="text-align: center; vertical-align: middle">${item.rank}위</td>
					<td class="snack-name" id="${item.snackId}" style="vertical-align: middle ">
						<img src="${item.imgUrl}" style="width: 100px; height: 100px; margin-left:33%;"/>
						<a href="#" data-snackid="${item.snackId}" class="snack-link">${item.name}</a>
					</td>
					<td class="additional-info" style="display: none;" ></td>
				</tr>	
			</c:forEach>
		</div>
		</tbody>
	</table>
</div>



</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('.snack-link').click(function(event) {
			event.preventDefault();
			var snackId = $(this).data('snackid');
			var additionalInfoContainer = $(this).closest('.display-each-snack').find('.additional-info');

			if (additionalInfoContainer.is(':visible')) {
				// Slide up to hide the additional info
				additionalInfoContainer.hide();
				return; // Stop further execution
			}


			$.ajax({
				type: 'GET',
				url: '/getMemberRankBySnack.do',
				data: { snackId: snackId },
				dataType: 'json',
				success: function(response) {
					var additionalInfo = '<table class="table table-striped table-hover" style="width: 80%;  margin-left:12%"><thead class="thead-light"><tr style="text-align: center;"><th>순위</th><th>갯수</th><th>이름</th></tr></thead><tbody>';

					$.each(response, function(index, element) {
						additionalInfo += '<tr style="text-align: center;">';
						additionalInfo += '<td>' + element.rank + '</td>';
						additionalInfo += '<td>' + element.count + '</td>';
						additionalInfo += '<td>' + element.name + '</td>';
						additionalInfo += '</tr>';
					});

					additionalInfo += '</tbody></table>';

					additionalInfoContainer.html(additionalInfo);
					additionalInfoContainer.show(); // Show the additional info
				},
				error: function(xhr, status, error) {
					console.error('Error:', error);
				}
			});
		});
	});
</script>

</html>