<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    response.sendRedirect(request.getContextPath()+"/page/navigation.jsp");
%>
</body>

<%--<script type="text/javascript">--%>
<%--    &lt;%&ndash;var url=<%=requestURI%>;&ndash;%&gt;--%>
<%--    &lt;%&ndash;alert(url)&ndash;%&gt;--%>
<%--    // function tt() {--%>
<%--    //     var value = document.getElementsByName("sex").id;--%>
<%--    //     alert(value)--%>
<%--    // }--%>
<%--    /*private int id;--%>
<%--    private String name;--%>
<%--    private String phoneNumber;--%>
<%--    private String address;*/--%>
<%--    &lt;%&ndash;document.location="${pageContext.request.contextPath}/user/a1";&ndash;%&gt;--%>
<%--    var x={"id":1,"name":"haven","phoneNumber":"13580263089","address":"广东揭阳"};--%>
<%--    var stringify = JSON.stringify(x);--%>
<%--    document.location="${pageContext.request.contextPath}/user/a4?receive="+stringify;--%>
<%--</script>--%>

</html>
