<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>학생 - 재고</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
          crossorigin="anonymous">
</head>
<style>
    body {

    }
    #container {
        height: 100%;
        background-color: bisque;
        margin: 10px;
        display: flex;
    }
    #left-container {
        width: 80%;
        background-color: lightsalmon;
    }
    .display-snack-list {
        background-color: cadetblue;
        display: flex;
        flex-wrap: wrap;
    }
    .display-each-snack {
        width: calc(25% - 10px);
        height: 250px;
        margin-left: 10px;
        margin-top: 10px;
        background-color: white;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    #snack-img {
        height:150px;
        width: 150px;
    }
</style>
<body>
<div id="container">
    <div id="left-container">
        <div id="hacker-list">
            <div class="form-inline">
                <div class="form-group">
                    <input type="text" placeholder="Search" class="search form-control"/>
                </div>

            </div>

            <div class="list display-snack-list">
                <c:forEach var="item" items="${snacks}">
                    <div id="${item.snackId} ${item.name}" class="display-each-snack">
                        <div class="snack-img-wrapper">
                            <img src="${item.imgUrl}" id="snack-img" />
                        </div>
                        <div class="snack-info-wrapper"></div>
                        <h4 class="snack-name" id="${item.snackId}">${item.name}</h4>
                        <h4 class="snack-brand" id="${item.brand}">${item.brand}</h4>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div>
        <div id="send-btn">
            <button type="button">EAT!!</button>
        </div>
        <div id="snack-selection-container">
            <ul id="snack-selection-list">

            </ul>
        </div>

    </div>
</div>
</body>
</html>

<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>

<script>
    var options = {
        valueNames: ['snack-name', 'snack-brand']
    };
    var hackerList = new List('hacker-list', options);

    let snackList = document.getElementById("snack-selection-list");

    let objList = [];

    function post() {
        const settings = {
            "url": "http://localhost:9999/student/fetchSnack.do",
            "method": "POST",
            "timeout": 0,
            "headers": {
                "Content-Type": "application/json",
            },
            "data": JSON.stringify(objList),
        };
        $.ajax(settings).done(function (response) {
            console.log(response);
        });
    }

    function deleteSnack(event) {
        const li = event.target.parentElement;
        const id = li.getAttribute('id');
        console.log("del id = ", id)
        $('#snack-selection-list #' + String(id)).remove()
    }

    $(function () {
        $("button").click(function (e) {
            e.preventDefault()
            // console.log("button clicked")

            const inputList = document.getElementsByClassName("snack-li-create");
            for (i = 0; i < inputList.length; i++) {
                const curId = String(inputList[i].id)
                const res = document.querySelector("input[name='" + curId + "']")
                // console.log(res.value)
                var obj = {};
                obj.snackId = String(inputList[i].id);
                obj.count = parseInt(res.value);
                objList.push(obj);
            }
            post();
        });
    });

    $(function () {
        $(".display-each-snack").on("click", function () {
            const str = this.id
            let lst = this.id.split(" ")

            const li = document.createElement("li");
            const span = document.createElement("span");

            span.innerText = lst[1];
            li.id = lst[0];
            li.className = "snack-li-create";
            li.appendChild(span);
            const input = document.createElement("input");
            input.id=lst[0]
            input.name=lst[0]
            input.type = "number";
            input.classList.add("snack-eat-count")
            li.appendChild(input);
            const delBtn = document.createElement("button");
            delBtn.innerText = 'X';
            delBtn.classList.add("delBtn");
            delBtn.addEventListener("click", deleteSnack);
            li.appendChild(delBtn);

            const created = document.getElementsByClassName("snack-li-create");
            for (i = 0; i < created.length; i++) {
                if (lst[0] === created[i].id) return
            }

            snackList.appendChild(li);
        })
    })
</script>