<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>임시 관리자 페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
  <div>
    <button id="delId">간식 업데이트</button>
  </div>
</body>
</html>
<script>
  $(function () {
    $("button").click(function (e) {
      e.preventDefault();

        const settings = {
            "url": "http://localhost:9999/tempSnackUpdate.do",
            "method": "POST",
            "timeout": 0,
        };
        $.ajax(settings).done(function (response) {
            // console.log(response);
            // location.reload();
        });

    });
  });
</script>