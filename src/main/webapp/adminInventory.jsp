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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    
    <style>
	    table {
	            font-size: 18px; /* 원하는 크기로 조절 */
	            border-collapse: collapse; /* 테이블 셀 경계선이 겹치지 않도록 설정 */
                width: 100%; /* 테이블이 부모 요소에 꽉 차도록 설정 */
	        }
	        
	    th, td {
            border: 1px solid #dddddd; /* 각 셀의 테두리 설정 */
            text-align: left;
            padding: 8px; /* 셀 안의 내용과 테두리 사이의 간격 설정 */
            width: 22%;
            padding-left: 20px;
        }
        
        th:nth-child(1),
        td:nth-child(1) {
            width: 34%; /* 첫 번째 컬럼의 가로 길이 설정 */
        }
	        
        .table-container {
            max-height: 550px; /* 표시하고자 하는 최대 높이 설정 */
            overflow-y: auto;
        }
        
        .sticky-thead th {
            position: sticky;
            top: 0;
            z-index: 1;
        }
    </style>
</head>
<body>
    <jsp:include page="./header.jsp" >
    <jsp:param name="pageTitle" value="재고 관리" />
    </jsp:include>

    <div class="container mt-3">
        <!-- 스크롤바 추가를 위한 부모 컨테이너 -->
        <div class="table-container">
            <table class="table">
                <thead class="thead-light sticky-thead ">
                    <tr>
                        <!-- 컬럼 이름 및 정렬 버튼 추가 -->
                        <th>과자 이름</th>
                        <th>카테고리</th>
                        <th>가격</th>
                        <th>수량</th>
                        <!-- 추가적인 컬럼은 여기에 추가 -->
                    </tr>
                </thead>
                <!-- forEach 사용 -->
                <tbody>
                    <c:forEach items="${snacks}" var="snack">
                        <tr>
                            <td>${snack.name}</td>
                            <td>${snack.category}</td>
                            <td><fmt:formatNumber value="${snack.price}" pattern="##,###원" /></td>
                            <td>${snack.quantity}</td>
                            <!-- 추가적인 데이터에 대한 표시는 여기에 추가 -->
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS 및 Popper.js CDN -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</body>
</html>
