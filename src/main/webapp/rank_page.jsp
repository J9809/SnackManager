<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>과자 많이 먹은 사람 누구?</title>
</head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>

#chart-container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 50%;
    height: 300px; /* Set a fixed height for the container */
}

#myChart {
    max-width: 100%; /* Ensure the chart doesn't exceed the container width */
    max-height: 100%; /* Ensure the chart doesn't exceed the container height */
}

</style>


<body>
  <jsp:include page="./header.jsp">
    <jsp:param name="pageTitle" value="많이 먹은 사람은 누굴까요?" />
  </jsp:include>
  	<div style = "display : flex; justify-content  : center">
  	<div id = "chart-container">
	<canvas id="myChart" width="300" height="200"></canvas>
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	
<script>
    // Get the data from the model passed in by the controller
    var memberData = ${list}; // Assuming "list" is the attribute name
    // Sort the memberData array based on the 'count' property in descending order
    memberData.sort((a, b) => b.count - a.count);

    // Extract the top 5 members
    var topFive = memberData.slice(0, 5);

    // Extract names and counts for the chart
    var memberNames = topFive.map(member => member.name);
    var memberCounts = topFive.map(member => member.count);

    // Chart.js configuration
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: memberNames,
            datasets: [{
                label: '먹은 과자 개수',
                data: memberCounts,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
        }
    });
</script>

  
</body>
</html>

