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
</head>
<body>
<div class="list display-snack-list">
    <c:forEach var="item" items="${list}">
        <div id="${item.snackId} ${item.name} " class="display-each-snack">
            <div class="snack-info-wrapper"></div>
            <h4 class="snack-name" id="${item.snackId}">
                    ${item.rank}
                <a href="javascript:void(0);" onclick="getMemberRank('${item.snackId}', this)">${item.name}</a>
            </h4>
        </div>
    </c:forEach>
</div>
${memberRankList}
</body>
<script>
    function getMemberRank(snackId, element) {
        const settings = {
            "url": "http://localhost:9999/getMemberRankBySnack.do?snackId=" + snackId,
            "method": "GET",
            "timeout": 0,
            "headers": {
                "Content-Type": "text/plain",
            },
        };

        $.ajax(settings).done(function (response) {
            // Update the page with the received data
            updatePageWithMemberRank(response, element);
        });
    }

    function updatePageWithMemberRank(data, element) {
        // Create a new element to hold the member rank information
        const rankInfoElement = document.createElement('div');
        rankInfoElement.innerHTML = data;

        // Append the new element below the clicked button
        element.parentNode.appendChild(rankInfoElement);
    }
</script>
</html>