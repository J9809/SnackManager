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
<html>
<head>
    <title>학생 - 재고</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
</head>
<body>
<section>
    <div id="hacker-list">
        <div class="form-inline">
            <!-- The search class allows List.js to search through the list -->
            <div class="form-group">
                <input type="text" placeholder="Search" class="search form-control"/>
            </div>

        </div>
        <ul class="list">
            <c:forEach var="item" items="${snacks}">
                <li>
                    <h4 class="name">${item.name}</h4>
                </li>
            </c:forEach>
        </ul>

    </div>
</section>
</body>
</html>

<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>
<script>
    var options = {
        valueNames: ['name', 'city']
    };
    var hackerList = new List('hacker-list', options);

    // Assigning references to the filter buttons
    // var filterCityButton = document.getElementById("filter");
    // var removeFiltersButton = document.getElementById("removeFilters");
    //
    // // When the filter button is clicked. The list is filtered by calling the filter function of the list object and passing in a function that accepts the list items.
    // filterCityButton.addEventListener("click", function() {
    //     hackerList.filter(function(item) {
    //         if (item.values().city == "Edmonton") {
    //             return true;
    //         } else {
    //             return false;
    //         }
    //     }); // Only items that have Edmonton as the city.
    // });
    //
    // // When the remove filter button is clicked, the filters are removed by calling the filter function once again with no parameters.
    // removeFiltersButton.addEventListener("click", function() {
    //     hackerList.filter();
    // });
</script>