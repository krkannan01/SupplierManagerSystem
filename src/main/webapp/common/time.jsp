<%--
  Created by IntelliJ IDEA.
  User: xietao
  Date: 2018/4/11
  Time: 8:55
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    /*debugger
    function getParent(win) {
        while (win != win.parent) win = win.parent;
        return win;
    }

    function makeWebSocket(win) {
        win = getParent(win);
        if (!win.websocket) {
            if ('WebSocket' in window) {
                win.websocket = new WebSocket('ws://127.0.0.1:8888/websocket');
            } else {
                alert('该浏览器不支持websocket!');
            }

            win.websocket.onopen = function(event) {
                console.log('建立连接');
            }

            win.websocket.onclose = function(event) {
                console.log('连接关闭');
            }

            win.websocket.onmessage = function(event) {
                alert('收到消息:' + event.data);
            }

            win.websocket.onerror = function(event) {
                alert('websocket通信发生错误!');
            }

            win.onbeforeunload = function() {
                websocket.close();
            }

        }
    }

    makeWebSocket(window);*/
    $.post("${pageContext.request.contextPath}/login/online");
    <%--window.setInterval(function() {--%>
        <%--$.post("${pageContext.request.contextPath}/login/online");--%>
    <%--}, 60000);--%>
</script>`