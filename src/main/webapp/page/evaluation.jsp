<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/11/4
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品评价</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.js"></script>
    <style>
        ul {
            padding-left: 0;
            overflow: hidden;
        }
        ul li {
            float: left;
            list-style: none;
            width: 27px;
            height: 27px;
            background: url(${pageContext.request.contextPath}/image/star.gif)
        }
        ul li a {
            display: block;
            width: 100%;
            padding-top: 27px;
            overflow: hidden;
        }
        ul li.light {
            background-position: 0 -29px;
        }
        /*隐藏原input*/
        .upload-btn {
            display: none;
        }
        /*美化自定义按钮*/
        .file-input-trigger {
            padding: 2px 5px;
            border-radius: 5px;
            border: 1px solid #3888C7;
            background-color: #3888C7;
            outline: none;
            color: #fff;
            cursor: pointer;
        }
    </style>
</head>

<body>
<div style="height: auto;width: 60%;background-color: #efefef;margin: 0 auto">
    <b><span style="text-align: center;display: block;padding-top: 5px">评价订单</span></b>
    <div style="width: 100%;height: auto;background-color: #ffffff">
        <form action="${pageContext.request.contextPath}/comment/saveComment" method="post" enctype="multipart/form-data">
            <table width="100%" border="1">
                <c:forEach items="${bs_name}" var="bs_name">
                    <tr>
                        <td colspan="2" height="40px" style="padding-left: 40px">${bs_name}</td>
                    </tr>
                </c:forEach>

                <tr>
<%--                    <c:forEach items="${page_id}" var="page_id">--%>
                    <input type="hidden" name="page_id" value="${page_id}">
<%--                    </c:forEach>--%>
                    <td width="40%" height="40px" style="padding-left: 40px">总体评分</td>
                    <td width="60%">
                        <ul>
<%--                            <li>--%>
<%--                                <input type="text" name="score" value="">--%>
<%--                            </li>--%>
                            <li class="light"><a href="javascript:;">1</a></li>
                            <li><a href="javascript:;">2</a></li>
                            <li><a href="javascript:;">3</a></li>
                            <li><a href="javascript:;">4</a></li>
                            <li><a href="javascript:;">5</a></li>
                            分数：<input type="text" name="c_score" value="">
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td width="40%">
                        <img src="" width="100%" height="200px" alt="请插入图片">
                    </td>
                    <td width="60%">
                        <textarea name="c_word" style="width: 100%;height: 200px;resize: none" placeholder="请输入您的评价"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"height="40px" style="padding-left: 40px">
                        <input type="file" class="upload-btn" name="multipartFile" onchange="previewFile()">
                        <span type="text" class="file-input-trigger">选择文件</span>
                        <p style="display: inline-block;margin-left: 10px" class="file-name"></p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" height="40px" style="padding-left: 40px">
                        <c:forEach items="${foodList}" var="food">
                            <label for="${food.id}"><input type="checkbox" name="foodidlist" id="${food.id}" value="${food.id}"> ${food.foodName}</label>
<%--                            <input type="hidden" name="foodidlist" value="${food.id}">--%>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" height="40px">
                        <input type="submit" value="提交">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
<script>
    var num = finalnum = tempnum= 0;
    var lis = document.getElementsByTagName("li");
    //num:传入点亮星星的个数
    //finalnum:最终点亮星星的个数
    //tempnum:一个中间值
    function fnShow(num) {
        finalnum= num || tempnum;//如果传入的num为0，则finalnum取tempnum的值
        for (var i = 0; i < lis.length; i++) {
            lis[i].className = i < finalnum? "light" : "";//点亮星星就是加class为light的样式
        }

    }
    for (var i = 1; i <= lis.length; i++) {
        lis[i - 1].index = i;
        lis[i - 1].onmouseover = function() { //鼠标经过点亮星星。
            fnShow(this.index);//传入的值为正，就是finalnum
        }
        lis[i - 1].onmouseout = function() { //鼠标离开时星星变暗
            fnShow(0);//传入值为0，finalnum为tempnum,初始为0
        }
        lis[i - 1].onclick = function() { //鼠标点击,同时会调用onmouseout,改变tempnum值点亮星星
            tempnum= this.index;
            // alert(finalnum)
            document.getElementsByName('c_score')[0].value = finalnum;
        }

    }

    $(function() {
        // 点击自定义的span标签触发input标签的点击事件
        $('.file-input-trigger').on('click', function() {
            $('.upload-btn').trigger('click')
        })
        // 文件改变时 将文件名称显示到p元素中
        $('.upload-btn').on('change', function(event) {
            var fileName = '已选文件：' + event.target.files[0].name
            $('.file-name').text(fileName)
        })
    })

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
