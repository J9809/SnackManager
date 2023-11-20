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
    #container {
        background-color: lightskyblue;
        height: 90%;
        margin: 10px;
        display: flex;
    }
    #left-container {
        width: 80%;
        height: 100%;
        background-color: lightblue;
    }
    #right-container {
        width: 20%;
        justify-content: center;
        align-items: center;
    }
    .display-snack-list {
        display: flex;
        flex-wrap: wrap;
        overflow-y: auto;
        margin: 30px;
        height: 500px;
    }
    .display-each-snack {
        width: calc(25% - 10px);
        height: 280px;
        margin: 10px 5px;
        background-color: white;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    #snack-img {
        height:150px;
        width: 150px;
    }
    #snack-selection-container {
        list-style: none;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin: 10px;
        padding: 10px;
    }
    .snack-selected {
        background-color: whitesmoke;
        width: 90%;
        padding: 10px;
        margin: 10px;
    }
    .upper-div {
        display: flex;
        justify-content: space-between;
    }
    .lower-div {
        display: flex;
        justify-content: center;
    }
    input {

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
                    <div id="${item.snackId} ${item.name} ${item.quantity}" class="display-each-snack">
                        <div class="snack-img-wrapper">
                            <img src="${item.imgUrl}" id="snack-img" />
                        </div>
                        <div class="snack-info-wrapper"></div>
                        <h4 class="snack-name" id="${item.snackId}">${item.name}</h4>
                        <h4 class="snack-brand" id="${item.brand}">${item.brand}</h4>
                        <h4 class="snack-quantity">${item.quantity}</h4>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div id="right-container">
        <div id="send-btn">
            <button type="button">EAT!!</button>
        </div>
        <div id="snack-selection-container">
        </div>

    </div>
</div>
</body>
</html>

<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>

<script>
    const options = {
        valueNames: ['snack-name', 'snack-brand']
    };
    const hackerList = new List('hacker-list', options);

    let snackList = document.getElementById("snack-selection-container");

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
            // console.log(response);
            location.reload();
        });
    }

    function deleteSnack(event) {
        const elem = event.target.parentElement.parentElement;
        const delId = elem.getAttribute('id');
        $('#snack-selection-container #' + String(delId)).remove()
    }

    $(function () {
        $("button").click(function (e) {
            e.preventDefault()
            // console.log("button clicked")

            const snackContainer = document.getElementById("snack-selection-container");
            const snackSelectionList = snackContainer.getElementsByClassName("snack-selected");

            for (i = 0; i < snackSelectionList.length; i++) {
                const curId = String(snackSelectionList[i].id)
                const res = document.querySelector("input[name='" + curId + "']")
                const obj = {};
                obj.snackId = String(curId);
                obj.quantity = parseInt(res.value);
                objList.push(obj);
            }
            post();
        });
    });

    $(function () {
        $(".display-each-snack").on("click", function () {
            const str = this.id
            let lst = this.id.split(" ")

            const selectedDiv = document.createElement("div");
            const spanDiv = document.createElement("div");
            const span = document.createElement("span");
            const upperDiv = document.createElement("div");
            const lowerDiv = document.createElement("div");

            spanDiv.id = "snackSpanDiv";
            span.innerText = lst[1];

            spanDiv.appendChild(span);

            selectedDiv.id = lst[0];
            selectedDiv.className = "snack-selected";

            const input = document.createElement("input");
            input.id=lst[0]
            input.name=lst[0]
            input.type = "number";
            input.classList.add("snack-eat-count")
            input.min = 1;
            input.max = lst[2]

            const delBtn = document.createElement("button");
            delBtn.innerText = 'X';
            delBtn.classList.add("delBtn");
            delBtn.addEventListener("click", deleteSnack);

            upperDiv.classList.add("upper-div");
            lowerDiv.classList.add("lower-div");
            upperDiv.appendChild(spanDiv);
            upperDiv.appendChild(input);
            lowerDiv.appendChild(delBtn);

            selectedDiv.appendChild(upperDiv);
            selectedDiv.appendChild(lowerDiv);

            const created = document.getElementsByClassName("snack-selected");
            for (i = 0; i < created.length; i++) {
                if (lst[0] === created[i].id) return
            }

            snackList.appendChild(selectedDiv);
        })
    })
</script>