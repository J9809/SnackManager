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
<body>

  <jsp:include page="./header.jsp">
    <jsp:param name="pageTitle" value="과자 랭킹" />
  </jsp:include>


<div class="list display-snack-list">
    <c:forEach var="item" items="${list}">
        <div class="display-each-snack">
            <p class="snack-name" id="${item.snackId}">
                <img src="${item.imgUrl}" style="width: 100px; height: 100px;"/>
                ${item.rank}
                <a href="#" data-snackid="${item.snackId}" class="snack-link">${item.name}</a>
            </p>
            <div class="additional-info" style="display: none;">
                <!-- Additional information will be displayed here -->
            </div>
        </div>
    </c:forEach>
</div>



</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $('.snack-link').click(function(event) {
            event.preventDefault();
            var snackId = $(this).data('snackid');
            var additionalInfoContainer = $(this).closest('.display-each-snack').find('.additional-info');

            $.ajax({
                type: 'GET',
                url: '/getMemberRankBySnack.do',
                data: { snackId: snackId },
                dataType: 'json',
                success: function(response) {
                    var additionalInfo = '<ul>'; // Assuming a list format
                    $.each(response, function(index, element) {
                        additionalInfo += '<li> Rank : ';
                        additionalInfo += element.rank;
                        additionalInfo += ' , Count :';
                        additionalInfo += element.count;
                        additionalInfo += ', Name : ';
                        additionalInfo += element.name;
                        additionalInfo += '</li>';
                    });

                    additionalInfo += '</ul>';
                    additionalInfoContainer.html(additionalInfo);
                    additionalInfoContainer.slideDown(); // Show the additional info
                },
                error: function(xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        });
    });
</script>

</html>
