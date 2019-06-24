var url = "ws://192.168.43.54:8084/CampusRewardSoft/websocket";
var ws = "";
var message ={"pAccount":"","pContent":"","SendToWho":""};
function connection() {
    ws = new WebSocket(url);
    console.log("connection.......");
    ws.onmessage = function (e){
       // var json = eval('(' +  e.data.toString() + ')');
        alert("有消息！");
        console.log("有消息！");
    }
    ws.onclose = function() {
        showMessage("close");
    }
    ws.onerror = function (e){
        showMessage("error");
    }
    ws.onopen = function() {
        //showMessage("链接成功")
        message.pAccount ="${loginUser.account}";
        message.pContent = "newUser";
        console.log(JSON.stringify(message));
        ws.send(JSON.stringify(message));
        message.pContent = "";
        console.log("连接成功!");
    }
}
if(ws=="") connection();


window.onbeforeunload = function(event) { 
	ws.onclose =function(){};
	ws.close();
}
