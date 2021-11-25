<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/7/1 0001
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
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
        .store{
            width: 70%;
            height: 240px;
            margin: 30px auto;
            border: 1px solid #E4E4E4;
            border-radius: 5px;
            background-color: #F8F8F8
        }
        .main{
            width: 70%;
            height: auto;
            margin: 10px auto;
            background-color: #F8F8F8;
            border: 1px solid #E4E4E4;
            border-radius: 5px
        }
        .btn .price{display:none;}
        .goodspc{
            width: 200px;
            height: 160px;
        }
        .modal{
            width: 60%;
            height: 300px;
            overflow-y: scroll;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: absolute;
            top: 40%;
            left: 19%;
            background: whitesmoke;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px #E7EDF9;
            display: none;
        }
        .close-btn{
            font-size: 22px;
            position: absolute;
            top: 20px;
            right: 30px;
            cursor: pointer;
        }
        .footer{
            margin: 0 auto;
            width: 70%;
            height: 80px;
            background-color: #F8F8F8;
            color:#f03c03;
            line-height:35px;
            font-size:15px;
            border: 1px solid #E4E4E4;
            border-radius: 5px;
        }
        .footer .left{float:left;font-size: 24px;line-height: 80px;margin-left:10px;}
        .footer .right{float:right;margin-right:20px;margin-top: 24px}
        .footer .right .disable{background:#dbdbdb;}
        .footer .xhlbtn{display:block;text-align:center;background-color:#F03C03;padding:0 15px;border-radius:20px;color:#fff;font-weight:bold;}
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
                <a href="${pageContext.request.contextPath}/order/intoOrder" style="margin-left: 10px"><b>订单管理</b></a>
                <a href="${pageContext.request.contextPath}/user/intoAddress" style="margin-left: 10px"><b>我的地址簿</b></a>
            </div>
        </div>
    </div>
</div>
<div class="store">
    <div style="width: 58%;height: 240px;float: left;margin: auto 1%">
        <div style="margin-left: 5px">
            <p style="margin-top: 24px;font-size: 30px">${business.store_name}</p>
            <hr align="center" width="98%" size="1">

            <p style="margin-top: 14px;font-size: 22px">地址:${business.store_address}</p>
            <p style="margin-top: 14px;font-size: 22px">电话:${business.bs_phone}</p>
            <p style="margin-top: 14px;font-size: 22px">营业时间:<c:if test="${Math.round(business.start_time/3600)<10}">
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
                ${Math.round((business.over_time%3600)/60)}</p>
        </div>
    </div>
    <div style="width: 38%;height: 240px;float: left;margin: auto 1%">
        <img style="width: 100%;height: 240px" src="<%=request.getContextPath()%>/${business.store_picture}"/>
    </div>
</div>
<div style="margin-left: 15%;margin-top: 50px"></div>
<div class="main">
    <div style="width: 100%;height: 70px;background-color: #FFFF00">
        <div style="padding-left: 30px;padding-top: 12px">
            <b><span style="font-size: 24px;line-height: 45px">商品</span></b>
<%--            <i class="layui-icon layui-icon-tips" style="font-size: 24px; color: #000000">商品</i>--%>
<%--            <input type="button" value="所有" style="margin-left: 20px;width: 50px; height: 50px; border-radius:50%;border: none">--%>
<%--            <input type="button" value="主食" style="margin-left: 20px;width: 50px; height: 50px; border-radius:50%;border: none">--%>
<%--            <input type="button" value="小吃" style="margin-left: 20px;width: 50px; height: 50px; border-radius:50%;border: none">--%>
<%--            <input type="button" value="饮料" style="margin-left: 20px;width: 50px; height: 50px; border-radius:50%;border: none">--%>
        </div>
    </div>
    <div class="food">
        <table width="100%" cellspacing="10px" border="1px solid #efefef">
            <tr style="text-align: center">
                <c:forEach items="${foodList}" varStatus="status" var="food">
                <td width="25%" height="240px">
                    <div><img style="cursor: pointer"onclick="selectById('${food.id}','${business.id}')" class="check goodspc" src="<%=request.getContextPath()%>/${food.foodPicture}"/></div>
                    <div>${food.foodName}</div>
                    <div>¥${food.foodPrice}</div>
                    <div class="btn">
                        <button style="width: 25px;height: 25px;display: none" class="minus">
                            <img src="${pageContext.request.contextPath}/image/jianhao.jpg" style="width: 22px;height: 22px"/>
                        </button>
                        <i style="display: none">0</i>
                        <button style="width: 25px;height: 25px" class="add">
                            <img src="${pageContext.request.contextPath}/image/jiahao.jpg" style="width: 22px;height: 22px"/>
                        </button>
                        <i class="price" style="">${food.foodPrice}</i>
                        <i class="foodid" style="display: none">${food.id}</i>
                        <i class="bsid" style="display: none">${business.id}</i>
<%--                        <i class="userid" style="">${userlogin.id}</i>--%>
                    </div>
                </td>
                <c:if test="${(status.index+1)%5==0}">
                </tr><tr style="text-align: center">
                </c:if>
                </c:forEach>


            </tr>
        </table>
    </div>
</div>

<div class="modal">
    <div class="close-btn">x</div>
    <b><span>评价</span></b>
    <form style="width: 890px;height: 200px;margin-top: 10px">
<%--        <iframe href="${pageContext.request.contextPath}/foodComments.jsp"></iframe>--%>
        <c:forEach items="${commentList}" var="comment">
        <table style="width: 90%;height: auto;margin-top: 2px" border="1">

            <tr>
                <td width="250px" height="30px">${comment.user.userName}</td>
                <td width="551px" height="30px">${comment.c_score}</td>
            </tr>
            <tr>
<%--                <img style="cursor: pointer"onclick="selectById('${food.id}','${business.id}')" class="check goodspc" src="<%=request.getContextPath()%>/${food.foodPicture}"/>--%>
                <td height="100px"><img src="<%=request.getContextPath()%>/${comment.c_picture}"></td>
                <td height="100px">${pageContext.c_word}</td>
            </tr>
        </table>
        </c:forEach>
        <table style="width: 90%;height: auto;margin-top: 2px" border="1">
            <tr>
                <td width="250px" height="30px">用户名</td>
                <td width="551px" height="30px">评分</td>
            </tr>
            <tr>
                <td height="100px">图片</td>
                <td height="100px">文字评价</td>
            </tr>
        </table>
        <table style="width: 90%;height: auto;margin-top: 2px" border="1">
            <tr>
                <td width="250px" height="30px">用户名</td>
                <td width="551px" height="30px">评分</td>
            </tr>
            <tr>
                <td height="100px">图片</td>
                <td height="100px">文字评价</td>
            </tr>
        </table>
    </form>
</div>

<div class="footer">
    <div class="left">
        已选：<span id="cartN">
            <span id="totalcountshow">0</span>份　总计：￥<span id="totalpriceshow">0</span>
            </span>元
    </div>
    <div class="right">
        <a id="btnselect" class="xhlbtn  disable" href="${pageContext.request.contextPath}/shopcar/intoShopcar" onclick="btnSelectJump();">选好了</a>
    </div>
</div>
</body>
<script>
    const check = document.querySelector('.check')
    const closeBtn = document.querySelector('.close-btn')
    const modal = document.querySelector('.modal')

    // check.addEventListener('click',()=>{
    //     modal.style.display = 'flex'
    // })
    $(".check").click(function () {
        // modal.style.display = 'flex'

    })

    // closeBtn.addEventListener('click',()=>{
    //     modal.style.display = 'none'
    // })
    $(".close-btn").click(function () {
        modal.style.display = 'none'
    })

    $(document).ready(function () {
    <%--<i class="price" style="">${food.foodPrice}</i>--%>
    <%--        <i class="foodid" style="display: none">${food.id}</i>--%>
    <%--        <i class="bsid" style="display: none">${business.id}</i>--%>
    <%--        <i class="userid" style="">${userlogin.id}</i>--%>
        //加的效果
        $(".add").click(function () {
            $(this).prevAll().css("display", "inline-block");
            var n = $(this).prev().text();
            var num = parseInt(n) + 1;
            if (num == 0) { return; }
            $(this).prev().text(num);

            var danjia = $(this).next().text();//获取单价
            var fd=$(this).next().next().text();
            var bd=$(this).next().next().next().text();
            // var userid=$(this).next().next().next().next().text();
            // alert(userid)
            // alert("foodid  "+foodid+"  bsid  "+bsid+"  userid "+userid)
            var a = $("#totalpriceshow").html();//获取当前所选总价
            $("#totalpriceshow").html((a * 1 + danjia * 1).toFixed(2));//计算当前所选总价

            var nm = $("#totalcountshow").html();//获取数量
            $("#totalcountshow").html(nm*1+1);
            jss();//改变按钮样式
            var  aa={"foodID":fd,"bsID":bd};
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/shopcar/addupdateShopcar",
                data:JSON.stringify(aa),
                contentType:'application/json;charset=utf-8'

            });
        });
        //减的效果
        $(".minus").click(function () {
            var n = $(this).next().text();
            var num = parseInt(n) - 1;

            $(this).next().text(num);//减1

            var danjia = $(this).nextAll(".price").text();//获取单价
            var fd=$(this).nextAll(".foodid").text();
            var bd=$(this).nextAll(".bsid").text();
            var  aa={"foodID":fd,"bsID":bd};
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/shopcar/cutupdateShopcar",
                data:JSON.stringify(aa),
                contentType:'application/json;charset=utf-8'

            });
            var a = $("#totalpriceshow").html();//获取当前所选总价
            $("#totalpriceshow").html((a * 1 - danjia * 1).toFixed(2));//计算当前所选总价

            var nm = $("#totalcountshow").html();//获取数量
            $("#totalcountshow").html(nm * 1 - 1);
            //如果数量小于或等于0则隐藏减号和数量
            if (num <= 0) {
                $(this).next().css("display", "none");
                $(this).css("display", "none");
                jss();//改变按钮样式
                return
            }

        });

        function jss() {
            var m = $("#totalcountshow").html();
            if (m > 0) {
                $(".right").find("a").removeClass("disable");
            } else {
                $(".right").find("a").addClass("disable");
            }
        }
    });
    function selectById(foodid,bs_id) {
                      var foodid=parseInt(foodid);
                      var bs_id=parseInt(bs_id)
                      location.href="${pageContext.request.contextPath}/comment/selectCommentById?foodid="+foodid+"&bs_id="+bs_id;
        // modal.style.display = 'flex'

                      document.getElementsByClassName('  modal').style.display='flex'
    }
</script>
</html>
