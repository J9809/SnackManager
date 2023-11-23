<%-- Created by IntelliJ IDEA. User: seonghwan Date: 11/17/23 Time: 1:35 PM To
change this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
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
  <style>
  
  ul{
  width : 60%;
}
  .nav.flex-column li{
    list-style: none; /* Remove list-style */
    width: auto; /* Adjust width */
    height :70px;
    transition: all 0.3s ease; /* Smooth transition */
    display: flex; /* Display as block to apply width */
    align-items : center;
    justify-content : center;
    padding: 8px 0; /* Add padding */
    color: black; /* Default text color */
	font-size : 20px;
  }

	  .nav.flex-column li:hover {
	    background-color: lightgrey; /* Change background on hover */
	  }
	
	.nav.flex-column a:hover {
	  text-decoration: none;
	}
  
</style>
  
  <body>
   <jsp:include page="./header.jsp">
    <jsp:param name="pageTitle" value="간식관리시스템" />
  </jsp:include>
  <div class="jumbotron" style = "display: flex; flex-direction : column; justify-content : center; align-items:center; padding-top : 0; background-color : white;">

  <c:if test="${not empty sessionScope['loginUser'] and sessionScope['loginUser'].role == 'admin'}">
	      <ul class="nav flex-column">
	        <a href="selectAllByAdmin.do"><li class="list-group-item">재고조회</li></a>
	        <a href="orderSnack.do"><li class="list-group-item">간식 주문</li></a>
	        <a href="getMemberRank.do"><li class="list-group-item">많이 먹은 학생 순위 조회</li></a>
	        <a href="getSnackRank.do"><li class="list-group-item">과자 순위 조회(전체과자, 과자별)</li></a>
              <a href="tempAdmin.jsp"><li class="list-group-item">간식 업데이트</li></a>
	      </ul>
  </c:if>

  <c:if test="${not empty sessionScope['loginUser'] and sessionScope['loginUser'].role == 'student'}">
     <ul class="nav flex-column">
      <a href="selectAllByStudent.do"><li class="list-group-item">간식 선택</li></a>
      <a href="voteSnack.do"><li class="list-group-item">먹고 싶은 간식 투표</li></a>
       <a href="getMemberRank.do"><li class="list-group-item">많이 먹은 학생 순위 조회</li></a>
       <a href="getSnackRank.do"><li class="list-group-item">과자 순위 조회(전체과자, 과자별)</li></a>
    </ul>
  </c:if>
</div>

</body>

</html>
