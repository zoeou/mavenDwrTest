<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <script type='text/javascript' src='dwr/util.js'></script>
    <script type='text/javascript' src='dwr/engine.js'></script>
<!--     <script type='text/javascript' src='/dwr/interface/DwrService.js'></script> -->
    <script type='text/javascript' src='dwr/interface/DwrPush.js'></script>
</head>
<body>
hello
<br>
<br>
<br>
<span class="selected-item">被修改的内容</span>
<br>
<br>
<br>
<button onclick="copyText()">Copy Text</button>

<button onclick="call()">callback1</button>
<script>
	function copyText(){
	    DwrService.echo('回声测试', function (str) {
	        alert(str);
	    });
    }
    function call(){
    	DwrPush.send("测试11");
    
    }
    //这个方法用来启动该页面的ReverseAjax功能
    dwr.engine.setActiveReverseAjax( true);
    //设置在页面关闭时，通知服务端销毁会话
    dwr.engine.setNotifyServerOnPageUnload( true);
    //这个函数是提供给后台推送的时候 调用的
    function callback(msg){
    	var va = document.getElementsByTagName("span");
    	if(va.length > 1){
            for(i=0; i<va.length; i++){
                va[i].innerHTML = "返回的值  "+msg;
            }
        }else{
            va[0].innerHTML = "返回的值  "+msg;
        }
    }
    
</script>
</body>
</html>