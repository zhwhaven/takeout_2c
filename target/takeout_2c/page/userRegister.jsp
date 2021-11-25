<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

    <!-- 引入 layui.js -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        .error{
            color: red;
        }
    </style>
</head>
<body>
<div style="padding: 40px 512px">
    <form class="layui-form" id="form"  action="${pageContext.request.contextPath}/user/register" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="userName" id="userName" lay-verify="required|userName" lay-reqtext="用户名是必填项，不能为空!" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
            <div id="s_userName" class="layui-form-mid layui-word-aux error"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="account" id="account" lay-verify="required|account" lay-reqtext="账号是必填项，不能为空!" autocomplete="off" placeholder="请输入账号" class="layui-input">
            </div>
            <div id="s_account" class="layui-form-mid layui-word-aux error"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" id="password" lay-verify="required|password" lay-reqtext="密码不能为空!" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
            <div id="s_password" class="layui-form-mid layui-word-aux error">6到12位密码</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-inline">
                <input type="password" name="confirmPassword" id="confirmPassword" lay-verify="required|password" lay-reqtext="确认密码不能为空!" placeholder="请再次输入密码" autocomplete="off" class="layui-input">
            </div>
            <div id="s_confirmPassword" class="layui-form-mid layui-word-aux error"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="text" name="phoneNumber" id="phoneNumber" lay-verify="required|phoneNumber" lay-reqtext="手机号不能为空!" placeholder="请输入手机号" autocomplete="off" class="layui-input">
            </div>
            <div id="s_phoneNumber" class="layui-form-mid layui-word-aux error"></div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo2">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

</body>

<script>
    layui.use(['form', 'layer'], function(){
        var form = layui.form
            ,layer = layui.layer;


        //给表单绑定onsubmiit事件
        document.getElementById("form").onsubmit = function () {
            //判断每一个方法的校验结果
            return checkUsername() && checkAccount() && checkPassword()
                    && checkConfirmPassword() && checkPhone();
        }

        //给每个表单绑定onblur事件
        document.getElementById('userName').onblur = checkUsername;
        document.getElementById('account').onblur = checkAccount;
        document.getElementById('password').onblur = checkPassword;
        document.getElementById('confirmPassword').onblur = checkConfirmPassword;
        document.getElementById('phoneNumber').onblur = checkPhone;

        function checkUsername() {
            var username = document.getElementById('userName').value;
            var reg = /^[a-zA-Z0-9\u4e00-\u9fa5]{3,10}$/;
            var flag = reg.test(username);
            var s_username = document.getElementById('s_userName');
            if (flag) {
                s_username.innerHTML = '正确';
            } else {
                s_username.innerHTML = '错误';
            }
            return flag;
        }

        function checkAccount() {
            var account = document.getElementById('account').value;
            var reg = /^\w{6,12}$/;
            var flag = reg.test(account);
            var s_account = document.getElementById('s_account');
            if (flag) {
                s_account.innerHTML = '正确';
            } else {
                s_account.innerHTML = '错误';
            }
            return flag;
        }

        function checkPassword() {
            var password = document.getElementById('password').value;
            var reg = /^[a-zA-Z]\w{5,11}$/;
            var flag = reg.test(password);
            var s_password = document.getElementById('s_password');
            if (flag) {
                s_password.innerHTML = '正确';
            } else {
                s_password.innerHTML = '错误';
            }
            return flag;
        }

        function checkConfirmPassword() {
            var pwd = document.getElementById('password').value;
            var repwd = document.getElementById('confirmPassword').value;
            var s_confirmPassword = document.getElementById('s_confirmPassword');
            if (pwd === repwd) {
                s_confirmPassword.innerHTML = '两次输入的密码一致';
            } else {
                s_confirmPassword.innerHTML = '两次输入的密码不一致';
            }
        }

        function checkPhone() {
            var phone = document.getElementById('phoneNumber').value;
            var reg = /^1[3-9]\d{9}$/;
            var flag = reg.test(phone);
            var s_phoneNumber = document.getElementById('s_phoneNumber');
            if (flag) {
                s_phoneNumber.innerHTML = '正确';
            } else {
                s_phoneNumber.innerHTML = '请输入正确的手机号';
            }
            return flag;
        }

        //监听提交
        form.on('submit(demo2)', function(data){
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
</html>