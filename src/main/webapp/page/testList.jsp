<%@ page import="org.springframework.test.context.ContextConfiguration" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/28 0028
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.js"></script>
    <title>Title</title>
</head>
<body>
<%
    String receive = request.getParameter("receiveList");
//    pageContext.setAttribute("receive",receive);
    pageContext.setAttribute("ccc","555");
    request.setAttribute("receive",receive);
%>aaaa
${receive}
<table>

    <tr>
        <th>id</th>
        <th>姓名</th>
        <th>电话：</th>
        <th>地址：</th>
    </tr>
    <c:forEach items="${receiveList}" var="receive" >
    <tr>
        <td>${receive.id}</td>
        <td>${receive.name}</td>
        <td>${receive.phoneNumber}</td>
        <td>${receive.address}</td>
    </tr></c:forEach>
</table>
<%--<script type="text/javascript">--%>
<%--    // alert("sdfsdfs");--%>
<%--    // var x={"id":1,"name":"haven","phoneNumber":"13580263089","address":"addffff"};--%>
<%--    //  var s = JSON.stringify(x);--%>
    <%--$.post("${pageContext.request.contextPath}/ajax/a1",{'name':$("#name").val()},function (data) {--%>
    <%--    alert("oooooo")--%>
    <%--    alert(data.toString())--%>
    <%--})--%>

    <%--alert("xxxx")--%>
    <%--var x=${receiveList}.toString();--%>
    <%--var t=JSON.stringify(x);--%>
    <%--alert("tttt")--%>
    <%--&lt;%&ndash;function th() {&ndash;%&gt;--%>
    <%--&lt;%&ndash;   document.location="${pageContext.request.contextPath}/user/a6?receiveList="+x;&ndash;%&gt;--%>
    <%--&lt;%&ndash;}&ndash;%&gt;--%>
    <%--document.location="${pageContext.request.contextPath}/user/a6?receiveList="+t;--%>
<%--</script>--%>
<%--<button id=""type="button" onclick="th()" name="tijiao">提交</button>--%>
</body>
<script type="text/javascript">
    var receiveList=new Array();
    receiveList.push({id:1,name:"haven",phoneNumber:"1358026089",address:"bububuu"});
    receiveList.push({id:1,name:"haven",phoneNumber:"1358026089",address:"bububuu"});
    receiveList.push({id:1,name:"haven",phoneNumber:"1358026089",address:"bububuu"});


    <%--$.ajax({        type: "POST",--%>
    <%--    url: "${pageContext.request.contextPath}/user/a7",--%>
    <%--    data:  JSON.stringify(receiveList),--%>
    <%--    contentType : 'application/json;charset=utf-8'  });--%>
    $.post("${pageContext.request.contextPath}/user/a8",function (data) {
       alert(data)

    })
</script>
</html>
