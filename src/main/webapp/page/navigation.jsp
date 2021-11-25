<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/24 0024
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>导航页</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

    <!-- 引入 layui.js -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="./iconfont.css">

    <style>
        .root{
            width: 100%;
            height: 700px;
            background-color: #0000FF;
            background-image: url(${pageContext.request.contextPath}/image/9.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
            -moz-background-size:100% 100%;
        }
        .header{
            height: 70px;
            width: 100%;
            /*position: fixed;*/
            background-color: transparent;
        }
        .header-content{
            height: 100%;
            width: 990px;
            position: relative;
            margin: 0 auto;
            align-items: center;
            display: flex;
        }
        #right{
            margin-left: 400px;
        }
    </style>
</head>
<body>
<div class="root">
    <div class="header">
        <div class="header-content">
            <div id="left">
<%--                <img style="height: 70px;width: 120px" src="${pageContext.request.contextPath}/image/logo.png"/>--%>
<%--                <span style="font-size: 20px;line-height: 70px;color: white"><b>二米外卖</b></span>--%>
            </div>
<%--            <div id="right">--%>
<%--                <span style="font-size: 20px;line-height: 70px;color: white"><a href="${pageContext.request.contextPath}/index.jsp"><b>首页</b></a></span>--%>
<%--            </div>--%>
        </div>
    </div>
    <div style="width: 990px;height: 180px;background-color: #1E9FFF;margin: 0 auto;margin-top: 460px">
        <a style="text-align: center;line-height: 180px" href="${pageContext.request.contextPath}/page/businessLogin.jsp">
            <div style="width: 330px;height: 180px;background-color: #F54C45;float: left">
                <i style="font-size: 40px" class="iconfont icon-dianpu">商家入驻</i>
            </div>
        </a>
        <a style="text-align: center;line-height: 180px" href="${pageContext.request.contextPath}/page/adminLogin.jsp">
            <div style="width: 330px;height: 180px;background-color: #FFBD27;float: left">
                <i style="font-size: 40px" class="iconfont icon-guanliyuan">管理员入口</i>
            </div>
        </a>
        <a style="text-align: center;line-height: 180px" href="${pageContext.request.contextPath}/page/userLogin.jsp">
            <div style="width: 330px;height: 180px;background-color: #658FF7;float: left">
                <i style="font-size: 40px" class="iconfont icon-canyin">我要点餐</i>
            </div>
        </a>
    </div>
</div>
</body>
</html>