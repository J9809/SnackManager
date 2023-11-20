<%--
  Created by IntelliJ IDEA.
  User: seonghwan
  Date: 11/20/23
  Time: 10:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <h4 class="snack-name" id="${item.snackId}">${item.rank} ${item.name}</h4>
        </div>
    </c:forEach>
</div>
</body>
</html>
<script>

    $(function () {
        $(".snack-name").on("click", function () {
            const str = this.id
            let lst = this.id.split(" ")
            post(str);
        });
    });

    function post(str) {
        const settings = {
            "url": "http://localhost:9999/getMemberRankBySnack.do?snackId=" + String(str),
            "method": "GET",
            "timeout": 0,
            "headers": {
                "Content-Type": "text/plain",
            },
        };

        $.ajax(settings).done(function (response) {
            // console.log(response);
            location.reload();
        });
    }

</script>
