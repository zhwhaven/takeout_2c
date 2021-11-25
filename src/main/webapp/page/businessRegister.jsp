<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商家注册</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

    <!-- 引入 layui.js -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<div style="padding: 40px 512px">
    <form class="layui-form" id="form" action="${pageContext.request.contextPath}/business/register" enctype="multipart/form-data" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="bs_name" id="bs_name" lay-verify="required|bs_name" lay-reqtext="姓名是必填项，不能为空!"
                       placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
            </div>
            <div id="s_bs_name" class="layui-form-mid layui-word-aux error"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="text" name="bs_phone" id="bs_phone" lay-verify="required|bs_phone" lay-reqtext="手机号不能为空!"
                       placeholder="请输入手机号" autocomplete="off" class="layui-input">
            </div>
            <div id="s_bs_phone" class="layui-form-mid layui-word-aux error"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">店铺名</label>
            <div class="layui-input-inline">
                <input type="text" name="store_name" id="store_name" lay-verify="required|store_name"
                       lay-reqtext="店铺名是必填项，不能为空!" placeholder="请输入店铺名" autocomplete="off" class="layui-input">
            </div>
            <div id="s_store_name" class="layui-form-mid layui-word-aux error"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">店铺图片</label>
            <input type="file" name="files" multiple="multiple" lay-verify="required|license_picture"
                   lay-reqtext="必须上传店铺图片!" autocomplete="off">
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">店铺描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" name="store_description" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">营业执照</label>
            <input type="file" name="files" multiple="multiple" lay-verify="required|license_picture"
                   lay-reqtext="必须上传营业执照!" autocomplete="off">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">上传身份证</label>
            <input type="file" name="files" multiple="multiple" lay-verify="required|idCard_picture"
                   lay-reqtext="必须上传身份证!" autocomplete="off">
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">店铺地址</label>
            <div class="layui-input-inline">
                <input type="text" name="store_address" lay-verify="required|store_address" lay-reqtext="地址不能为空!"
                       autocomplete="off" placeholder="请输入地址" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">配送时间</label>
            <div class="layui-input-inline">
                <input type="text"id="st" name="st" lay-verify="required|store_address" onblur="xt()" lay-reqtext="地址不能为空!"
                       autocomplete="off" placeholder="分钟" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">营业时间</label>
                <div class="layui-input-inline" style="width: 40px;">
                    <input type="text" name="start_hour" placeholder="时" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">:</div>
                <div class="layui-input-inline" style="width: 40px;">
                    <input type="text" name="start_minute" placeholder="分" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">--</div>
                <div class="layui-input-inline" style="width: 40px;">
                    <input type="text" name="over_hour" placeholder="时" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">:</div>
                <div class="layui-input-inline" style="width: 40px;">
                    <input type="text" name="over_minute" placeholder="分" autocomplete="off" onblur="countTime()"
                           class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">24小时制</div>
            </div>
            <%--            <div class="layui-inline">--%>
            <%--                <label class="layui-form-label">时间范围</label>--%>
            <%--                <div class="layui-input-inline">--%>
            <%--                    <input type="text" class="layui-input" id="test9" placeholder=" - ">--%>
            <%--                </div>--%>
            <%--            </div>--%>
        </div>
        <input type="hidden" name="start_time" id="start">
        <input type="hidden" name="over_time" id="over">
        <input type="hidden" name="set_time" id="set_time">
        <script>
            function xt() {
                      var xx=document.getElementById("st").value;
                      var tt=xx*60;
                      document.getElementById("set_time").value=tt;

            }
        </script>
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="bs_account" id="bs_account" lay-verify="required|bs_account"
                       lay-reqtext="账号是必填项，不能为空!" autocomplete="off" placeholder="请输入账号" class="layui-input">
            </div>
            <div id="s_bs_account" class="layui-form-mid layui-word-aux error"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="bs_password" id="bs_password" lay-verify="required|bs_password"
                       lay-reqtext="密码不能为空!" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
            <div id="s_bs_password" class="layui-form-mid layui-word-aux error">6到12位密码</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-inline">
                <input type="password" name="bs_confirmPassword" id="bs_confirmPassword" lay-verify="required|password"
                       lay-reqtext="确认密码不能为空!" placeholder="请再次输入密码" autocomplete="off" class="layui-input">
            </div>
            <div id="s_bs_confirmPassword" class="layui-form-mid layui-word-aux error"></div>
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
    layui.use(['form', 'layer'], function () {
        var form = layui.form
            , layer = layui.layer;

        //给表单绑定onsubmiit事件
        document.getElementById("form").onsubmit = function () {
            //判断每一个方法的校验结果
            return checkBsName() && checkBsPhone() && checkStoreName()
                && checkBsAccount() && checkBsPassword() && checkBsConfirmPassword();
        }

        //给每个表单绑定onblur事件
        document.getElementById('bs_name').onblur = checkBsName;
        document.getElementById('bs_phone').onblur = checkBsPhone;
        document.getElementById('store_name').onblur = checkStoreName;
        document.getElementById('bs_account').onblur = checkBsAccount;
        document.getElementById('bs_password').onblur = checkBsPassword;
        document.getElementById('bs_confirmPassword').onblur = checkBsConfirmPassword;

        function checkBsName() {
            var name = document.getElementById('bs_name').value;
            var reg = /^[\u4e00-\u9fa5]{2,6}$/;
            var flag = reg.test(name);
            var s_bs_name = document.getElementById('s_bs_name');
            if (flag) {
                s_bs_name.innerHTML = '正确';
            } else {
                s_bs_name.innerHTML = '请输入正确的姓名';
            }
            return flag;
        }

        function checkBsPhone() {
            var phone = document.getElementById('bs_phone').value;
            var reg = /^1[3-9]\d{9}$/;
            var flag = reg.test(phone);
            var s_bs_phone = document.getElementById('s_bs_phone');
            if (flag) {
                s_bs_phone.innerHTML = '正确';
            } else {
                s_bs_phone.innerHTML = '错误';
            }
            return flag;
        }

        function checkStoreName() {
            var store = document.getElementById('store_name').value;
            var reg = /^[\u4e00-\u9fa5]{2,9}$/;
            var flag = reg.test(store);
            var s_store_name = document.getElementById('s_store_name');
            if (flag) {
                s_store_name.innerHTML = '正确';
            } else {
                s_store_name.innerHTML = '错误';
            }
            return flag;
        }

        function checkBsAccount() {
            var account = document.getElementById('bs_account').value;
            var reg = /^\w{6,12}$/;
            var flag = reg.test(account);
            var s_bs_account = document.getElementById('s_bs_account');
            if (flag) {
                s_bs_account.innerHTML = '正确';
            } else {
                s_bs_account.innerHTML = '错误';
            }
            return flag;
        }

        function checkBsPassword() {
            var password = document.getElementById('bs_password').value;
            var reg = /^[a-zA-Z]\w{5,11}$/;
            var flag = reg.test(password);
            var s_bs_password = document.getElementById('s_bs_password');
            if (flag) {
                s_bs_password.innerHTML = '正确';
            } else {
                s_bs_password.innerHTML = '错误';
            }
            return flag;
        }

        function checkBsConfirmPassword() {
            var pwd = document.getElementById('bs_password').value;
            var repwd = document.getElementById('bs_confirmPassword').value;
            var s_bs_confirmPassword = document.getElementById('s_bs_confirmPassword');
            if (pwd === repwd) {
                s_bs_confirmPassword.innerHTML = '两次输入的密码一致';
            } else {
                s_bs_confirmPassword.innerHTML = '两次输入的密码不一致';
            }
        }

        //监听提交
        form.on('submit(demo2)', function (data) {
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
           // })
            // return false;
        });


        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function () {
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>
<%--将时间转换成秒--%>
<script type="text/javascript">
    function countTime() {
        var start_hour =document.getElementsByName("start_hour")[0].value;
        var start_minute =document.getElementsByName("start_minute")[0].value;
        var over_hour =document.getElementsByName("over_hour")[0].value;
        var over_minute =document.getElementsByName("over_minute")[0].value;
        // alert(document.getElementsByName("start_hour")[0].value)
        //  alert(start_hour)
        var start_time=start_hour*3600+start_minute*60;
        var over_time=over_hour*3600+over_minute*60;
        document.getElementById("start").value=start_time;
        document.getElementById("over").value=over_time;
        // alert(document.getElementById("start").value)
        // alert( document.getElementById("over").value)
        // alert(start_time)
        // alert(over_time)

    }
</script>
</html>