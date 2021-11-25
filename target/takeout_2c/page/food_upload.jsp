<%@ page import="com.takeout.pojo.Business" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/30 0030
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品上架</title>
    <a1>${msg}</a1>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<form action="${pageContext.request.contextPath}/business/upload_food" method="post" enctype="multipart/form-data">
    <div class="layui-form-item">
        <label class="layui-form-label">商品名称</label>
        <div class="layui-input-inline">
            <input type="text" name="foodName" id="foodName" lay-verify="required" lay-reqtext="店铺名是必填项，不能为空!" placeholder="请输入商品名称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品图片</label>
        <img src="" height="200" width="150" >
        <input type="file" name="multipartFile" onchange="previewFile()"lay-verify="required" lay-reqtext="必须上传商品图片!" autocomplete="off">
    </div>
<%--    <div class="layui-form-item">--%>

<%--    </div>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">商品价格</label>
        <div class="layui-input-inline">
            <input type="text" name="foodPrice" id="foodPrice" lay-verify="required" lay-reqtext="价格不能为空!" placeholder="请输入商品价格" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品折扣</label>
        <div class="layui-input-inline">
            <input type="text" name="foodDiscount" id="foodDiscount" lay-verify="required" lay-reqtext="折扣不能为空!" placeholder="请输入商品折扣" autocomplete="off" class="layui-input">
        </div>
    </div>
    <input name="bs_id" value="${bslogin.id}" type="hidden">
    <div class="layui-form-item">
        <label class="layui-form-label">商品库存</label>
        <div class="layui-input-inline">
            <input type="text" name="foodCount" id="foodCount" lay-verify="required" lay-reqtext="库存不能为空!" placeholder="请输入商品库存" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">商品描述</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" name="food_describe" class="layui-textarea" style="width: 300px"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品分类</label>
        <div class="layui-input-block">
            <select name="food_style_code" lay-filter="shuxing">
                <option value="">请选择分类</option>
                <option value="0001">主食</option>
                <option value="0002">小吃</option>
                <option value="0003">饮料</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">送货时间</label>
<%--        <%--%>
<%--            Business bs = (Business) request.getAttribute("bslogin");--%>
<%--            int x=Math.round(bs.getSet_time());--%>
<%--        %>--%>
        <div class="layui-input-inline">
            <input type="text" name="st" value="${bslogin.set_time/60}" id="set_time" placeholder="请输入送货时间（分钟）" autocomplete="off" class="layui-input">
        </div>
        <input name="set_time" value="${bslogin.set_time}"type="hidden">
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo2">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</body>
<script>
    layui.use(['form', 'layer'], function(){
        var form = layui.form
            ,layer = layui.layer;

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
<%--图片预览--%>
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
</script>
</html>
