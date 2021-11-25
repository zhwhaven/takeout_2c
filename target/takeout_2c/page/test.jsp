<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/23 0023
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
测试
<table>
    <tr>
        <th>用户名</th>
        <th>用户账号</th>
        <th>用户密码</th>
        <th>用户手机号</th>
    </tr>
<%--    <tr>--%>
<%--        <td>${user.userName}</td>--%>
<%--        <td>${user.account}</td>--%>
<%--        <td>${user.password}</td>--%>
<%--        <td>${user.phoneNumber}</td>--%>
<%--<img src="${pageContext.request.contextPath}\upload\\5\11\94f5a3731aa74cdc8dc0f4d4e8e1fea3_p2.jpg">--%>
<%--    </tr>--%>
<%--    <img src="${pageContext.request.contextPath}/upload\\5\11\11\94f5a3731aa74cdc8dc0f4d4e8e1fea3_p2.jpg">--%>
<%--    <img src="localhost:8080/takeout_2c/upload/5/11/3f9c3e3bf4bd47baabccb78de0ed09ed_p2.jpg">--%>
<%--    <img src="${pageContext.request.contextPath}/upload/4/3/4aa3501d100143e49cb0d70a4f31c63f_p1.jpg">--%>
</table>
<%--<script>--%>
<%--    location.href="${pageContext.request.contextPath}/user/a10";--%>
<%--</script>--%>
<%--<%--%>
<%--    String head="${pageContext.request.contextPath}"+"\\";--%>
<%--         String x= "image/banner.png";--%>
<%--         String t="upload////4/15///773716a644ee4533993d1146578dbe30_p2.jpg";--%>
<%--         pageContext.setAttribute("x",x);--%>
<%--         pageContext.setAttribute("t",t);--%>
<%--         int z=1800;--%>
<%--         int y=1800/3600;--%>


<%--%>--%>
<%--${x}--%>
<%--<img src="${x}">--%>
<%--<img src="<%=request.getContextPath()%>/${x}">--%>
<%--&lt;%&ndash;<img src="${pageContext.request.contextPath}\upload\\4\15\773716a644ee4533993d1146578dbe30_p2.jpg">&ndash;%&gt;--%>
<%--&lt;%&ndash;<img src="${pageContext.request.contextPath}\"+${x}>&ndash;%&gt;--%>
<%--<img src="<%=request.getContextPath()%>/${t}">--%>
<%--<img src="${pageContext.request.contextPath}\upload\\4\15\773716a644ee4533993d1146578dbe30_p2.jpg">--%>
<form action="${pageContext.request.contextPath}/user/a10" enctype="multipart/form-data" method="post">
   <tr>id:</tr></td> <input name="id" type="text"></tr>
    <tr>userName:</tr></td> <input name="userName" type="text"></tr>
    <tr>
        文件1：
        <input type="file"  name=" multipartFile" onchange="previewFile()"><br>
        <img src="" height="200" >
    </tr>

    <tr>
        <td>兴趣爱好： </td>
        <td><input type="CheckBox" name="hobby" value="1"/>篮球
            <input type="CheckBox" name="hobby" value="2"/>羽毛球
            <input type="CheckBox" name="hobby" value="3"/>排球
        </td>
    <tr>
    <tr>
    <input type="text" name="ttt">
    <input type="text" name="ttt">
    <input type="text" name="ttt">
    <input type="text" name="ttt">
</tr>
    <input type="button" name="跳转" onclick="movex()">跳转
    <input type="submit" name="提交">提交
</form>
<script>
    function previewFile() {
        var preview = document.querySelector('img');
        var file    = document.querySelector('input[type=file]').files[0];
        var reader  = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
    function movex() {

    }
    // localStorage.infos="aaaa";
    // localStorage["infos"]="aaaa";
    // localStorage.setItem("infos","aaaa");
</script>
</body>
</html>
