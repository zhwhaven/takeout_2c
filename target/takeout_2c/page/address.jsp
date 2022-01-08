<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/7/3 0003
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>地址管理</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

    <!-- 引入 layui.js -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.js"></script>
    <style>
        .nav{
            width: 100%;
            height: 40px;
            background-color: green;
        }
        .nav-content{
            width: 70%;
            height: 100%;
            margin: 0 auto;
            position: relative;
            align-items: center;
            display: flex;
        }
        .logo{
            color: white;
            font-size: 16px;
            line-height: 40px;
            cursor: pointer;
            display: flex;
        }
        .content{
            margin-left: 100px;
            display: flex;
        }
    </style>
</head>
<body>
<div class="nav">
    <div class="nav-content">
        <div class="logo">
            <span style="margin-left: 20px"><a href="${pageContext.request.contextPath}/page/index.jsp"><b>外卖系统</b></a></span>
        </div>
        <div class="content">
            <div style="margin-top: 9px" class="layui-input-inline">
                <i class="iconfont icon-weizhi1"></i>
            </div>
            <div style="text-decoration: none;margin-left: 300px;text-align: center;line-height: 40px">
                <a>${userlogin.userName}</a>
                <a href="${pageContext.request.contextPath}/user/out">退出</a>
<%--                <a href="${pageContext.request.contextPath}/page/navigation.jsp">&nbsp;&nbsp;导航栏</a>--%>
                <a style="margin-left: 40px" href="${pageContext.request.contextPath}/shopcar/intoShopcar"><b>我的购物车</b></a>
                <a href="${pageContext.request.contextPath}/order/intoOrder" style="margin-left: 10px"><b>我的订单</b></a>
                <a href="${pageContext.request.contextPath}/user/intoAddress" style="margin-left: 10px"><b>刷新</b></a>
            </div>
        </div>
    </div>
</div>
<div style="width: 70%;height: 600px;background-color: #E4E4E4;margin: 20px auto">
    <div style="margin-left: 20px;font-size: 18px"><p>地址管理</p></div>
    <div style="width: 70%;height: 240px;background-color: white;margin: 20px auto">
        <span style="color: #FF0308">新增收货地址</span>
        <div class="layui-form-item">
            <label class="layui-form-label"><span style="color: #FF0308">*</span>收货人姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" id="userName" lay-verify="required|userName" lay-reqtext="收货人姓名不能为空!" placeholder="请输入收货人姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span style="color: #FF0308">*</span>收货地址</label>
            <div class="layui-input-inline">
                <input type="text" name="address" id="userAddress" lay-verify="required|userName" lay-reqtext="收货地址不能为空!" placeholder="请输入收货地址" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span style="color: #FF0308">*</span>手机号码</label>
            <div class="layui-input-inline">
                <input type="text" name="phoneNumber" id="userPhone" lay-verify="required|userName" lay-reqtext="手机号码不能为空!" placeholder="请输入手机号码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" onclick="save()" lay-filter="demo1">保存</button>

            </div>
        </div>
    </div>
    <script>
        function save() {
            // alert("xxxx")
             var userName=document.getElementById("userName").value;
            // alert(userName)
             var userAddress=document.getElementById("userAddress").value;
            // alert(userAddress)
             var userPhone=document.getElementById("userPhone").value;
            // alert(userPhone)
            // var  aa={"foodID":fd,"bsID":bd};
             var aa={"name":userName,"phoneNumber":userPhone,"address":userAddress};
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/user/addAddress",
                data:JSON.stringify(aa),
                success:function(data){
                    alert("添加成功")
                    location.href="${pageContext.request.contextPath}/user/intoAddress"

                },
                contentType:'application/json;charset=utf-8'
            });
        }
    </script>
    <table id="table" width="70%" border="1" style="margin: 0 auto">
        <tr align="center" style="height: 40px">
            <td>收货人</td>
            <td>详细地址</td>
            <td>手机号码</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${receiveList}" var="receive">
        <tr class="p-msg" align="center" style="height: 50px">
            <td>${receive.name}</td>
            <td>${receive.address}</td>
            <td>${receive.phoneNumber}</td>
            <td>
                <a onclick="deleteAddress('${receive.id}')" class="t-action">删除</a>
            </td>
        </tr></c:forEach>
    </table>
</div>
</body>
<script>
    $(function () {
        //删除按钮
        $(".t-action").click(function () {
            $(this).parents(".p-msg").remove();
        })
    })
    function deleteAddress(receiveid) {
             var receive={"id":receiveid};
             $.ajax({
                 type:"POST",
                 url:"${pageContext.request.contextPath}/user/deleteAddress",
                 data:JSON.stringify(receive),
                 success:function(data){
                   alert("删除成功")
                 },
                 contentType:'application/json;charset=utf-8'
             })
               alert(receiveid)
    }
</script>
</html>
