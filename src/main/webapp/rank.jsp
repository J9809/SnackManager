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
                <a href="javascript:void(0);" onclick="getMemberRank('${item.snackId}')">${item.name}</a>
            </h4>
        </div>
    </c:forEach>
</div>
${memberRankList}
</body>
<script>
    function getMemberRank(snackId) {
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
            updatePageWithMemberRank(response);
        });
    }

    function updatePageWithMemberRank(data) {
        // Assuming there's a DOM element where you want to display the member rank information
        // Update this part based on your actual HTML structure
        $(".snack-info-wrapper").html(data);
    }
</script>
</html>