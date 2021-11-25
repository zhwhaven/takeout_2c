<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/25 0025
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/user/a2">
<p>文件1：<input type="file" name=" multipartFiles"></p>
    <p>文件2：<input type="file" name=" multipartFiles"></p>
<%--    <p> 名字：<input type="text" name="name"></p>--%>
    <input type="submit" name="提交">提交
</form>
<%
   String x="upload//11/13/95bb11a87fca4ca2a5098139de84ef14_p6.jpg";
   pageContext.setAttribute("x",x);
%>
<img src="<%=request.getContextPath()%>/${x}">
<%--<img src="${pageContext.request.contextPath}/upload/9/6/79553ec0555e4478a4916fd76d45e33a_p2.jpg">--%>

<%--<img src="${pageContext.request.contextPath}\upload\\9\6\79553ec0555e4478a4916fd76d45e33a_p2.jpg">--%>
</body>
</html>
