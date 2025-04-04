window.onload = function () {
    //獲取 DOM 元件
    var userName = document.getElementById("userName");
    var loginBtn = document.getElementById("loginBtn");
    var exitBtn = document.getElementById("exitBtn");
    var submitBtn = document.getElementById("submitBtn");
    var infoWindow = document.getElementById("infoWindow");    
    var userinput = document.getElementById("userinput");
    var messageDisplay = document.getElementById("messageDisplay");
    var webSocket;
    var isConnectSuccess = false;
    
    //設置登入鈕的動作，登入才可發言
    loginBtn.addEventListener("click", function () {
        //檢查有無輸入名稱
        if (userName.value !== "") {
            setWebSocket();  //設置WebSocket連接
        } else {
            infoWindow.innerHTML = "請輸入名稱";
        }
    });
    
    exitBtn.addEventListener("click", function () {
        location.reload();
    });
    
    //Submit Form時送出訊息
    submitBtn.addEventListener("click", function () {
        sendMessage();
    });
    
    //使用webSocket擁有的function, send(), 送出訊息
    function sendMessage() {
        //檢查WebSocket連接狀態
        if (webSocket && isConnectSuccess) {
            var messageInfo = {
                id: userName.value,
                message: userinput.value
            }
            webSocket.send(JSON.stringify(messageInfo));
        } else {
            infoWindow.innerHTML = "未登入";
        }
    }

    //設置 WebSocket
    function setWebSocket() {
        var url = 'ws://localhost:8080/Chat/chatRoom/'+userName.value;
        console.log(url);
        // 開始 WebSocket 連線
        webSocket = new WebSocket(url);
        //以下開始偵測WebSocket的各種事件                
        // onerror , 連線錯誤時觸發  
        webSocket.onerror = function (event) {
            loginBtn.disabled = false;
            userName.disabled = false;
            infoWindow.innerHTML = "登入失敗";
        };
        // onopen , 連線成功時觸發
        webSocket.onopen = function (event) {
            isConnectSuccess = true;
            loginBtn.disabled = true;
            userName.disabled = true;
            infoWindow.innerHTML = "登入成功";
        };

        // onmessage , 接收到來自Server的訊息時觸發
        webSocket.onmessage = function (event) {
            //var messageObject = JSON.parse(event.data);
            messageDisplay.innerHTML += event.data + "<br/>";
        };        
    }
}
