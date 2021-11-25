<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/28 0028
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>首页</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

    <!-- 引入 layui.js -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="./iconfont.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.js"></script>
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
        .class1{
            width: 70%;
            height: auto;
            margin: 0 auto;
            /*background-color: #E4E4E4;*/
            border: 1px solid #efefef;
        }
        #searchText{
            width: 500px;
            height: 40px;
            margin-top: 10px;
            margin-left: 219px;
            border-radius: 20px;

        }
        .business{
            width: 100%;
            height: auto;
            margin-top: 20px;
        }
        .goods{
            width: 100%;
        }
        .goodspc{
            width: 200px;height: 200px;
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
                <select id="choice" name="address">

                    <%
                        Object address = request.getAttribute("Address");
                        if(address!=null){ %>
                    <option value="">${Address}</option>
                    <%
                        } else{ %>
                    <option value="">选择城市</option>
                    <%
                        }
                    %>

                    <option value="广州">广州</option>
                    <option value="深圳">深圳</option>
                    <option value="珠海">珠海</option>
                    <option value="汕头">汕头</option>
                    <option value="佛山">佛山</option>
                    <option value="韶关">韶关</option>
                    <option value="湛江">湛江</option>
                    <option value="肇庆">肇庆</option>
                    <option value="江门">江门</option>
                    <option value="茂名">茂名</option>
                    <option value="惠州">惠州</option>
                    <option value="梅州">梅州</option>
                    <option value="汕尾">汕尾</option>
                    <option value="河源">河源</option>
                    <option value="阳江">阳江</option>
                    <option value="清远">清远</option>
                    <option value="东莞">东莞</option>
                    <option value="中山">中山</option>
                    <option value="潮州">潮州</option>
                    <option value="揭阳">揭阳</option>
                    <option value="云浮">云浮</option>
                </select>
            </div>
            <div style="text-decoration: none;margin-left: 300px;text-align: center;line-height: 40px">
                <a>${userlogin.userName}</a>
                <a href="${pageContext.request.contextPath}/user/out">退出</a>
<%--                <a href="${pageContext.request.contextPath}/page/navigation.jsp">&nbsp;&nbsp;导航栏</a>--%>
                <a style="margin-left: 40px" href="${pageContext.request.contextPath}/shopcar/intoShopcar"><b>我的购物车</b></a>
                <a href="${pageContext.request.contextPath}/order/intoOrder" style="margin-left: 10px"><b>订单管理</b></a>
                <a href="${pageContext.request.contextPath}/user/intoAddress" style="margin-left: 10px"><b>我的地址簿</b></a>
            </div>
        </div>
    </div>
</div>

<div class="class1">
    <form action="" method="get">
        <input id="searchText" type="search" name="keyword" autocomplete="off" placeholder="请输入关键词">
        <div style="display: inline-block"><input type="button" onclick="selectBykey()" value="搜索" style="width: 40px;height: 40px"></div>
    </form>
<script>
    function selectBykey() {
        var t_key=document.getElementById("searchText").value;
        // alert(t_key)
        var myselect=document.getElementById("choice");
        var t_address=myselect.options[0].text;
        if(t_address=="选择城市"){
            alert("请选择城市,再搜索")
        }else{
            location.href="${pageContext.request.contextPath}/business/showBsByKey?address="+t_address+"&keyword="+t_key;
        }
        // alert(t_address)
    }

</script>
    <div class="layui-carousel" id="test1" lay-filter="test1" style="margin: 10px auto">
        <div carousel-item="">
            <div><img style="width: 100%;height: 400px" src="${pageContext.request.contextPath}/image/1.jpg"></div>
            <div><img style="width: 100%;height: 400px" src="${pageContext.request.contextPath}/image/2.jpg"></div>
            <div><img style="width: 100%;height: 400px" src="${pageContext.request.contextPath}/image/3.jpg"></div>
            <div><img style="width: 100%;height: 400px" src="${pageContext.request.contextPath}/image/4.jpg"></div>
        </div>
    </div>

    <div class="business">
        <div class="goods">
            <table width="100%" cellspacing="10px">
                <tr style="text-align: center">
                    <c:forEach items="${businessList}" var="business" varStatus="status">
                    <td width="33%">
                        <a href="${pageContext.request.contextPath}/business/showbs_food?id=${business.id}&bs_phone=${business.bs_phone}&store_name=${business.store_name}&store_address=${business.store_address}
                              &store_picture=${business.store_picture}&start_time=${business.start_time}&over_time=${business.over_time}"><div><img class="goodspc" src="<%=request.getContextPath()%>/${business.store_picture}"/></div>
                            <div>${business.store_name}</div>
                            <div>${business.store_description}</div>
                            <div>预计送餐时间：${Math.round(business.set_time/60)}分</div>

                            <div>营业时间: <c:if test="${Math.round(business.start_time/3600)<10}">
                                0
                            </c:if>${Math.round(business.start_time/3600)}:
                                <c:if test="${Math.round((business.start_time%3600)/60)<10}">
                                    0
                                </c:if>${Math.round((business.start_time%3600)/60)}--
                                    <c:if test=" ${Math.round(business.over_time/3600)<10}">
                                        0
                                    </c:if>
                                    ${Math.round(business.over_time/3600)}:
                                  <c:if test="${Math.round((business.over_time%3600)/60)<10}">
                                      0
                                  </c:if>
                                    ${Math.round((business.over_time%3600)/60)}</div>
                        </a>
                    </td>
                        <c:if test="${(status.index+1)%3==0}">
                      </tr><tr style="text-align: center">
                    </c:if>
                    </c:forEach>
            </tr>

            </table>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    layui.use(['carousel', 'form'], function(){
        var carousel = layui.carousel
            ,form = layui.form;

        //常规轮播
        carousel.render({
            elem: '#test1'
            ,width: '100%'
            ,height: '400px'
            ,arrow: 'always'
            ,interval: 3000
        });


        //事件
        // carousel.on('change(test4)', function(res){
        //     console.log(res)
        // });
        //
        // var $ = layui.$, active = {
        //     set: function(othis){
        //         var THIS = 'layui-bg-normal'
        //             ,key = othis.data('key')
        //             ,options = {};
        //
        //         othis.css('background-color', '#5FB878').siblings().removeAttr('style');
        //         options[key] = othis.data('value');
        //         ins3.reload(options);
        //     }
        // };
        //
        // //监听开关
        // form.on('switch(autoplay)', function(){
        //     ins3.reload({
        //         autoplay: this.checked
        //     });
        // });
        //
        // $('.demoSet').on('keyup', function(){
        //     var value = this.value
        //         ,options = {};
        //     if(!/^\d+$/.test(value)) return;
        //
        //     options[this.name] = value;
        //     ins3.reload(options);
        // });

    });


    $("#choice").change(function () {
        let $dom = $("#choice");
        let index = $dom[0].options[$dom[0].selectedIndex].value;
        // alert(index);
        <%--document.location="${pageContext.request.contextPath}/business/showbusiness?address="+index;--%>
        <%-- $.post("${pageContext.request.contextPath}/business/showbusiness",{'address':index})--%>
        <%--window.location.href="${pageContext.request.contextPath}/business/showbusiness?address="+"江门";--%>
        location.href="${pageContext.request.contextPath}/business/showbusiness?address="+index;
    });
</script>
</html>
