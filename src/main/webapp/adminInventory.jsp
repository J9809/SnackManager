<%--
  Created by IntelliJ IDEA.
  User: seonghwan
  Date: 11/17/23
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<jsp:include page="/header.jsp" />
<table>
    <thead>
    <tr>
        <th>과자 이름</th>
        <th>카테고리</th>
        <th>가격</th>
        <th>수량</th>
    </tr>
    </thead>
    <!--  forEach 사용 -->
    <tbody>
    <c:forEach items="${snacks}" var="snack">
        <tr>
            <td>${snack.name}</td>
            <td>${snack.category}</td>
            <td>${snack.price}</td>
            <td>${snack.quantity}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
