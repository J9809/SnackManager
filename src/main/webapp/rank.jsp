<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

%>

<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>D3.js 사람형태 막대 그래프</title>
    <!-- D3.js -->
    <script src="https://d3js.org/d3.v5.min.js"></script>
</head>
<body>
${list}
<svg width="1000" height="400"></svg>

<script>
    // 데이터
    var data = [8, 5, 3, 2];
    var names = ['양석현', '안광휘', '권구택', '성준호'];

    // SVG 요소 생성
    var svg = d3.select("svg");

    // 막대 그래프 생성
    var bars = svg.selectAll("g")
        .data(data)
        .enter()
        .append("g")
        .attr("transform", function(d, i) { return "translate(" + (i * 100 + 30) + "," + (400 - d * 20) + ")"; });

    // 각 막대에 이미지 추가
    bars.append("image")
        .attr("xlink:href", "people.png") // 이미지 파일의 경로
        .attr("width", 50)
        .attr("height", function(d) { return d * 20; });



    // 텍스트 추가 (옵션, 막대 위 값 표시)
    var texts = svg.selectAll(".value")
        .data(data)
        .enter()
        .append("text")
        .attr("class", "value")
        .text(function(d, i) { return names[i]+" : " + d; })
        .attr("x", function(d, i) { return i * 100 + 20 + 25; })
        .attr("y", function(d) { return 400 - d * 20 - 5; })
        .attr("text-anchor", "middle")
        .attr("fill", "black");


</script>
</body>
</html>