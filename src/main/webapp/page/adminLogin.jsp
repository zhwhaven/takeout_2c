<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/26 0026
  Time: 23:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

    <!-- 引入 layui.js -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        .pic2{
            width: 100%;
            height: 660px;
            position: relative;
            background-image: url(${pageContext.request.contextPath}/image/7.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
            -moz-background-size:100% 100%;
            text-align: center;
        }
        .frame2{
            width: 360px;
            height: 420px;
            position: absolute;
            background-color: #F9F9FB;
            right: 150px;
            top: 130px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/admin/login" method="post">
    <div class="pic2">
        <div class="frame2">
            <h2 style="margin-top: 20px">管理员登录</h2>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">账号</label>
                <div class="layui-input-inline">
                    <input type="text" name="admin_account" lay-verify="required|admin_account" lay-reqtext="账号不能为空!" autocomplete="off" placeholder="请输入账号" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="admin_password" id="password" lay-verify="required|admin_password" lay-reqtext="密码不能为空!" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div>
                <p>${msg}</p>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-right: 100px">
<%--                    <button class="layui-btn" lay-submit="demo2" lay-filter="demo2">登录</button>--%>
<%--                    <input type="submit" value="登录">--%>
                        <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">登录</button>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
<script>
    layui.use(['form', 'layer'], function(){
        var form = layui.form
            ,layer = layui.layer;

        // //自定义验证规则
        // form.verify({
        //     username: function(value){
        //         if(value.length < 3){
        //             return '用户名至少得3个字符';
        //         }
        //     }
        //     ,password: [
        //         /^[\S]{6,12}$/
        //         ,'密码必须6到12位，且不能出现空格'
        //     ]
        //     ,phone: [
        //         /^1[3-9]\d{9}$/
        //         ,'请输入正确的手机号'
        //     ]
        // });


        //监听提交
        form.on('submit(demo1)', function(data){
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
        });


        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>
<script>

</script>
</html>
