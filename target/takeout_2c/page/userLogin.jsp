<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/26 0026
  Time: 23:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

    <!-- 引入 layui.js -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        .pic3{
            width: 100%;
            height: 660px;
            position: relative;
            background-image: url(${pageContext.request.contextPath}/image/5.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
            -moz-background-size:100% 100%;
            text-align: center;
        }
        .frame3{
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
<form action="${pageContext.request.contextPath}/user/login" method="get">
    <div class="pic3">
        <b><div style="position: absolute;font-size: 24px;top: 5px;left: 10px"><a href="${pageContext.request.contextPath}/page/navigation.jsp">导航页</a></div></b>
        <div class="frame3">
            <h2 style="margin-top: 20px">用户登录</h2>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">账号</label>
                <div class="layui-input-inline">
                    <input type="text" name="account" lay-verify="required|account" lay-reqtext="账号不能为空!" autocomplete="off" placeholder="请输入账号" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" id="password" lay-verify="required|password" lay-reqtext="密码不能为空!" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div><p>${msg}</p></div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-right: 100px">
                    <button class="layui-btn" lay-submit="" lay-filter="demo2">登录</button>
                </div>
                <div style="margin-top: 10px">
                    <span>还没有账号？<a href="${pageContext.request.contextPath}/page/userRegister.jsp">立即注册</a></span>
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
        form.on('submit(demo2)', function(data){
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
            // return false;
        });


        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>
</html>
