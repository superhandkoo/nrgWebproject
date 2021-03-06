var socket = new WebSocket("ws://localhost:8080/nrg-0.0.1-SNAPSHOT/init");

$(function() {
	listen();
})

function emit() {
	var text = encodeScript($("#msg").val());
	if($.trim(text)==null||$.trim(text)==undefined||$.trim(text)==''){
		return;
	}
	var msg = {
		"message" : text,
		"color" : "#CECECE",
		"bubbleColor" : "#2E2E2E",
		"fontSize" : "12",
		"fontType" : "黑体"
	};
	msg = JSON.stringify(msg);

	socket.send(msg);
	
	$("#content").append("<kbd style='color: #" + "CECECE" + ";float: right; font-size: " + 12 + ";'>" + text +  "</kbd><br/>");
	$("#msg").val("");
}

function listen() {
	socket.onopen = function() {
		$("#content").append("<kbd>Welcome!</kbd></br>");
	};
	socket.onmessage = function(evt) {
		var data = JSON.parse(evt.data);
		$("#content").append("<kbd style='color: #" + data.color + ";font-size: " + data.fontSize + ";margin-top: 10px;'>" + data.userName + " Say: " + data.message + "</kbd></br>");
	};
	socket.onclose = function(evt) {
		$("#content").append("<kbd>" + "Close!" + "</kbd></br>");
	}
	socket.onerror = function(evt) {
		$("#content").append("<kbd>" + "ERROR!" + "</kbd></br>");
	}
}

document.onkeydown = function(event){
	var e = event || window.event || arguments.callee.caller.arguments[0];
	if(e && e.keyCode == 13){ // enter 键
		emit();
	}
}; 