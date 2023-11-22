<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<style>
    #header {
        position: fixed;
        width: 100%;
    }
    
    #hacker-list {
        padding-top: 300px;
	    display: flex;
	    flex-direction: column;
    }

    .form-group {
        position: fixed;
        z-index: 5;
        width: 100%;
		margin-top: 20px;
        padding: 20px 300px;
        background-color: rgba(255, 255, 255, 0.9) ;
        top: 165px;
        border-bottom: 1px solid rgb(240, 240, 240);
        box-shadow: 0px 12px 10px -10px  rgba(0, 0, 0, 0.3);

    }
    
    .display-snack-list {
        display: flex;
        flex-wrap: wrap;
        width: 75%;
        margin: 10px 40px;
        height: 15%;
        justify-content: space-between; /* 요소 사이의 간격 조절 */
	    gap: 10px;
    }
    
  .display-each-snack {
        width: calc(25% - 30px);
        height: 320px;
        background-color: white;
        display: flex;
        flex-direction: column;
        align-items: center;
      }

  .display-each-snack:hover {
        box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3); /* 마우스를 올렸을 때의 테두리 스타일 및 색상 지정 */
      }
  
    #snack-img {
        height:150px;
        width: 150px;
    }
    
    .list hr {
        width: 95%;
        border: 1px solid rgb(240, 240, 240); /* 원하는 스타일로 변경 가능 */
    }
    
    #selection {
      text-align: center;
      position: fixed;
      right: 3%;
      width: 15%; /* 필요에 따라 너비를 조절하세요 */
      height: 60%;
      padding: 10px;
      border: 1px solid rgb(220, 220, 220);
    }
    #snack-selection-container {
      height: 80%;
      overflow-y: auto;
    }
    
    #send-btn {
    	text-align: center;
    }
    .upper-div {
        display: flex;
    }
    .lower-div {
        display: flex;
    }
	.lower-div > * {
		margin-right: 10px;
	}
	.snack-selected {
		margin-bottom: 10px;
	}

</style>
<body>
<div id="header">
<jsp:include page="./header.jsp">
    <jsp:param name="pageTitle" value="간식 선택" />
  </jsp:include>
  </div>
  

  <div id="hacker-list">
    <div class="form-group">
      <input type="text" placeholder="Search" class="search form-control" />
    </div>

    <div class="list display-snack-list">
      <c:forEach var="item" items="${snacks}" varStatus="status">
        <div id="${item.snackId}" class="display-each-snack">
          <div class="snack-img-wrapper">
            <img src="${item.imgUrl}" id="snack-img" />
          </div>
          <div class="snack-info-wrapper"></div>
          <marquee style="z-index: 0" class="snack-name" id="${item.snackId}" direction="left" onmouseover="this.stop()">${item.name}</marquee>
          <h4 class="snack-brand" id="${item.brand}"></h4>
          <span class="snack-quantity" style="font-size: 17px;">남은 수량 : ${item.quantity}</span>
        </div>

        <!-- 매 4번째 아이템일 때 줄 바꾸기 -->
        <c:if test="${status.index % 4 == 3}">
          <hr>
        </c:if>
      </c:forEach>
    </div>
    
    <div id="selection">
    	<span style="font-size: 20px;">장바구니</span>
    	<hr>
      <div id="snack-selection-container">
      </div>
      <div id="send-btn">
          <button class="btn btn-primary" type="button">EAT!!</button>
      </div>
    </div>

   </div>

</body>
</html>

<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
      // 페이지가 로드될 때 실행되는 함수입니다.
      var header = $(".header"); // 여기서 ".header"는 헤더의 CSS 클래스나 ID에 맞게 수정하세요.
      var headerOffset = header.offset().top;

      $(window).scroll(function () {
        // 스크롤 이벤트를 처리하는 함수입니다.
        if ($(window).scrollTop() > headerOffset) {
          // 스크롤이 헤더를 지나쳤을 때 헤더를 고정합니다.
          header.addClass("fixed-header"); // 여기서 "fixed-header"는 헤더를 고정시키는 CSS 클래스에 맞게 수정하세요.
        } else {
          // 스크롤이 헤더 위에 있을 때 고정을 해제합니다.
          header.removeClass("fixed-header");
        }
      });
    });
  </script>
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

            for (let i = 0; i < snackSelectionList.length; i++) {
                  const curId = String(snackSelectionList[i].id)
                  const res = document.querySelector("input[name='" + curId + "']")
                  if (parseInt(res.value) === 0) {
                    alert("수량을 알맞게 입력하세요.");
                    return false;
                  }
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

          const snackContainer = document.getElementById("snack-selection-container");
          const snackSelectionList = snackContainer.getElementsByClassName("snack-selected");
          if (snackSelectionList.length >= 5) return;

          const curId = String(this.id);
          let snackName = "";
          let snackQuantity = 0;
          const searchList = document.getElementsByClassName("display-each-snack");
          // console.log(searchList)

          for (let i = 0; i < searchList.length; i++) {
            if (String(searchList[i].id) === curId) {
              snackName = searchList[i].querySelector(".snack-name").innerText;
              snackQuantity = Number(searchList[i].querySelector(".snack-quantity").innerText);
              break;
            }
          }
          if (snackName === "") {
            alert("간식이 선택되지 않았습니다.")
            return false;
          }

          const selectedDiv = document.createElement("div");
          const spanDiv = document.createElement("div");
          const span = document.createElement("span");
          const upperDiv = document.createElement("div");
          const lowerDiv = document.createElement("div");

          spanDiv.id = "snackSpanDiv";
          span.innerText = snackName;

          spanDiv.appendChild(span);

          selectedDiv.id = curId;
          selectedDiv.className = "snack-selected";

          const input = document.createElement("input");
          input.id=curId;
          input.name=curId;
          input.type = "number";
          input.classList.add("snack-eat-count")
          input.min = "0";
          input.max = String(snackQuantity);
          input.onkeydown = preventKeyboardInput;
          input.value = "0";

          const delBtn = document.createElement("button");
          delBtn.innerText = 'X';
          delBtn.classList.add("btn")
          delBtn.classList.add("btn-danger")
          delBtn.classList.add("delBtn");
          delBtn.addEventListener("click", deleteSnack);

          upperDiv.classList.add("upper-div");
          lowerDiv.classList.add("lower-div");
          upperDiv.appendChild(spanDiv);
          lowerDiv.appendChild(input);
          lowerDiv.appendChild(delBtn);

          selectedDiv.appendChild(upperDiv);
          selectedDiv.appendChild(lowerDiv);

          const created = document.getElementsByClassName("snack-selected");
          for (let i = 0; i < created.length; i++) {
            if (curId === String(created[i].id)) return
          }

          snackList.appendChild(selectedDiv);

          let ssc = document.querySelector("#snack-selection-container");
          ssc.scrollTop = ssc.scrollHeight;
        })
    })

    function preventKeyboardInput(event) {
      event.preventDefault();
    }
</script>