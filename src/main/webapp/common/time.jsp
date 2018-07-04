<%--
  Created by IntelliJ IDEA.
  User: xietao
  Date: 2018/4/11
  Time: 8:55
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $.post("${pageContext.request.contextPath}/login/online");
    <%--window.setInterval(function() {--%>
        <%--$.post("${pageContext.request.contextPath}/login/online");--%>
    <%--}, 60000);--%>
</script>