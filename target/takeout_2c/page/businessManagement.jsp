<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/30 0030
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商家管理</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

    <!-- 引入 layui.js -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">商家后台管理</div>

        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>
<%--            <a style="color: white" href="${pageContext.request.contextPath}/page/navigation.jsp">&nbsp;&nbsp;导航栏</a>--%>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="<%=request.getContextPath()%>/${bslogin.store_picture}" class="layui-nav-img">
                   ${bslogin.store_name}
                </a>
                <dl class="layui-nav-child">
<%--                    <dd><a href="">Your Profile</a></dd>--%>
<%--                    <dd><a href="">Settings</a></dd>--%>
                    <dd><a href="${pageContext.request.contextPath}/business/out">退出</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div style="text-align: center" class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/page/food_upload.jsp">商品上架</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/business/selectAllFood">商品管理</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/order/bsSelectOrder">订单管理</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe id="iframeMain" src="" width="100%" height="100%" scrolling="auto" frameborder="0"></iframe>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <div style="padding: 15px;">内容主体区域。记得修改 layui.css 和 js 的路径</div>
    </div>

    <div class="layui-footer" style="text-align: center">
        <!-- 底部固定区域 -->
        demo外卖系统
    </div>
</div>
</body>
<script>
    //JS
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
        });
    });
</script>
<script>
    $(document).ready(function(){
        $("li>a").click(function (e) {
            e.preventDefault();
            $("#iframeMain").attr("src",$(this).attr("href"));
        });
    });
</script>
</html>
