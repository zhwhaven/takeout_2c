<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/29 0029
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>购物车</title>
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
        .store-item{
            border: 1px solid #efefef;
            margin-top: 50px;
            box-shadow: -1px 1px  #E4E4E4;
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
<%--                <a style="margin-left: 40px" href="${pageContext.request.contextPath}/page/navigation.jsp"><b>导航栏</b></a>--%>
                <a href="${pageContext.request.contextPath}/order/intoOrder" style="margin-left: 10px"><b>订单管理</b></a>
                <a href="${pageContext.request.contextPath}/user/intoAddress" style="margin-left: 10px"><b>我的地址簿</b></a>
            </div>
        </div>
    </div>
</div>
<div style="width: 70%;margin: 0 auto">

<c:forEach items="${carsonList}" var="carson">
    <div class="store-item">
        <div style="height: 40px;line-height: 40px;background-color: mistyrose">
            <input type="checkbox" onclick="store_m('${carson.business.id}')" class="check goods-check checkStore" style="margin-left: 30px">
            <span style="font-size: 16px;line-height: 40px;font-weight: bold">
                <a href="${pageContext.request.contextPath}/business/showbs_food?id=${carson.business.id}&bs_phone=${carson.business.bs_phone}&store_name=${carson.business.store_name}&store_address=${carson.business.store_address}
                              &store_picture=${carson.business.store_picture}&start_time=${carson.business.start_time}&over_time=${carson.business.over_time}">${carson.business.store_name}</a></span>
        </div>
        <table cellspacing="0">
            <thead style="line-height: 30px;border-bottom: 1px #eed061 solid;background-color: #F2F2F2;color: #90551d">
            <th style="width: 80px;border-bottom: 1px #DFC9B2 solid"></th>
            <th style="width: 150px;border-bottom: 1px #DFC9B2 solid">图片</th>
            <th style="width: 400px;border-bottom: 1px #DFC9B2 solid">名称</th>
            <th style="width: 150px;border-bottom: 1px #DFC9B2 solid">单价</th>
            <th style="width: 150px;border-bottom: 1px #DFC9B2 solid">数量</th>
            <th style="width: 150px;border-bottom: 1px #DFC9B2 solid">小计</th>
            <th style="width: 150px;border-bottom: 1px #DFC9B2 solid">操作</th>
            </thead>
            <tbody>
            <c:forEach items="${carson.cargrandsonList}" var="cargrandson">
            <tr class="cart-item">
                <td style=";width: 80px;border-right: 1px #c8cccc solid;border-bottom: 1px #c8cccc solid"><input type="checkbox" name="items" class="check goods-check j-checkbox" style="margin-left: 30px"></td>
                <td style="height: 120px;white-space: pre-line;color: #4F87C8;border-right: 1px #c8cccc solid;border-bottom: 1px #c8cccc solid">
                    <img src="<%=request.getContextPath()%>/${cargrandson.food.foodPicture}" style="width: 90px;height: 90px;float: left;border: 1px solid #efefef;margin-left: 24px"></td>
                <td style="white-space: pre-line;border-right: 1px #c8cccc solid;border-bottom: 1px #c8cccc solid">
                    <div style="text-align: center">${cargrandson.food.foodName}</div></td>
                <td class="p-price" style="color: #CC3300;border-right: 1px #c8cccc solid;border-bottom: 1px #c8cccc solid;text-align: center">¥${cargrandson.food.foodPrice}</td>
                <td style="border-right: 1px #c8cccc solid;border-bottom: 1px #c8cccc solid">
                    <button class="increase"  onclick="" style="background-color: #FFFFFF;width: 30px;height: 21px;color:#FF0E23;font-size: 15px;text-align: center;margin-left: 15px">+</button>
                    <input type="text" class="itxt" value="${cargrandson.count}" style="width: 30px;text-align: center" >
                    <input type="hidden" class="fid" value="${cargrandson.food.id}">
                    <input type="hidden" class="bsid" value="${carson.business.id}">
                    <button  class="decrease" style="background-color: #FFFFFF;width: 30px;height: 21px;color: #FF0E23;font-size: 15px;text-align: center">-</button>
                </td>
                <td class="shopcarid" style="display:none">${cargrandson.shopcarId}</td>
                <td class="p-sum" style="border-right: 1px #c8cccc solid;border-bottom: 1px #c8cccc solid;text-align: center">¥${cargrandson.food.foodPrice*cargrandson.count}</td>
                <td class="p-action" style="white-space: pre-line;color:#4F87C8;text-align: center;border-bottom: 1px #c8cccc solid"><a href="javascript:;">删除</a></td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</c:forEach>
    <%--    第三部分    --%>
    <div style="width: 100%;height: 66px;border: 1px solid #efefef;margin-top: 20px">
        <div style="float: left;margin-left: 29px;margin-top: 25px">
            <input type="checkbox" name="" id="" class="checkAll">&nbsp;全选
        </div>
        <div style="width: 100px;height: 40px;float: right;margin-right: 17px;text-decoration: none">
         <span onclick="countall()">  <img src="${pageContext.request.contextPath}/image/button3.jpg"/></span>
        </div>
        <div style="float: right">
            <table style="border-collapse: separate;border-spacing: 7px">
                <tr>
                    <td><b>数量：</b></td>
                    <td id="allcount" class="amount-sum"><em style=" color: #FF0308;
            text-decoration: none;font-weight: bold">0</em></td>
                </tr>
                <tr>
                    <td><b>总价：</b></td>
                    <td id="allprice" class="price-sum"><em style=" color: #FF0308;
            text-decoration: none;font-weight: bold">¥0.00</em></td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        //计算总计和总额
        function getSum() {
            var count = 0;  //计算总件数
            var money = 0;  //计算总价钱
            var checklist=document.getElementsByClassName("j-checkbox");
            var itxtlist=document.getElementsByClassName("itxt");
            var pricelist=document.getElementsByClassName("p-price");
            for(var i=0;i<checklist.length;i++){
                if(checklist[i].checked==true){
                    var foodcount=parseInt(itxtlist[i].value);
                    var foodprice=pricelist[i].innerHTML;
                    foodprice=parseFloat(foodprice.substr(1));
                    count+=foodcount;
                    var xj=foodcount*foodprice;
                    money+=xj;
                }
            }
            $(".amount-sum em").text(count);
            $(".price-sum em").text("¥" + money.toFixed(2));
        }
        // 点击店铺按钮
        $(".checkStore").click(function() {
            if ($(this).prop("checked") == true) { //如果店铺按钮被选中
                $(this).parents(".store-item").find(".goods-check").prop('checked', true); //店铺内的所有商品按钮也被选中
                if ($(".checkStore").length == $(".checkStore:checked").length) { //如果店铺被选中的数量等于所有店铺的数量
                    $(".checkAll").prop('checked', true); //全选按钮被选中
                    //TotalPrice();

                } else {
                    $(".checkAll").prop('checked', false); //else全选按钮不被选中
                    //TotalPrice();

                }
            } else { //如果店铺按钮不被选中
                $(this).parents(".store-item").find(".goods-check").prop('checked', false); //店铺内的所有商品也不被全选
                $(".checkAll").prop('checked', false); //全选按钮也不被选中
                //TotalPrice();
            }
            getSum();
        });
    })

    $(function () {
        //全选 全不选功能模块
        $(".checkAll").change(function () {
            $(".checkStore, .j-checkbox").prop("checked",$(this).prop("checked"));
            getSum();
        });
        //通过勾选全部小的来达到全选
        $(".j-checkbox").change(function () {
            if ($(".j-checkbox:checked").length === $(".j-checkbox").length) {
                $(".checkAll").prop("checked",true);
            } else {
                $(".checkAll").prop("checked",false);
            }
            getSum();
        });

        //数量加减
        $(".increase").click(function () {
            //得到当前兄弟文本框的值
            var n = $(this).siblings(".itxt").val();
            // alert(n)
            var foodID=$(this).siblings(".fid").val();
            var bsID=$(this).siblings(".bsid").val();
            // alert(foodID)
            // alert(bsID)
            var  aa={"foodID":foodID,"bsID":bsID};
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/shopcar/addupdateShopcar",
                data:JSON.stringify(aa),
                contentType:'application/json;charset=utf-8'

            });
            // alert(foodid)
            n++;
            console.log($(this).parent().siblings(".j-checkbox").prop("checked"));
            //alert(che)
            $(this).siblings(".itxt").val(n);
            //计算小计模块  根据文本框的值 乘以 当前商品的价格
            //当前商品的价格 p
            var p =$(this).parent().siblings(".p-price").html();
            //截去¥符号
            p = p.substr(1);
            //小计模块
            $(this).parent().siblings(".p-sum").html("¥" + (p * n).toFixed(2));
            getSum();
        });

        $(".decrease").click(function () {
            var foodID=$(this).siblings(".fid").val();
            var bsID=$(this).siblings(".bsid").val();
            // alert(foodID)
            // alert(bsID)
            var  aa={"foodID":foodID,"bsID":bsID};
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/shopcar/cutupdateShopcar",
                data:JSON.stringify(aa),
                contentType:'application/json;charset=utf-8'

            });
            var n = $(this).siblings(".itxt").val();
            if (n == 1) {
                return false;
            }
            n--;
            $(this).siblings(".itxt").val(n);
            var p =$(this).parent().siblings(".p-price").html();
            //截去¥符号
            p = p.substr(1);
            //小计模块
            $(this).parent().siblings(".p-sum").html("¥" + (p * n).toFixed(2));
            getSum();
        });

        //通过直接修改文本框的值计算小计模块
        $(".itxt").change(function () {
            var n = $(this).val();
            var p =$(this).parent().siblings(".p-price").html();
            //截去¥符号
            p = p.substr(1);
            //小计模块
            $(this).parent().siblings(".p-sum").html("¥" + (p * n).toFixed(2));
            getSum();
        });

        //计算总计和总额
        function getSum() {
            var count = 0;  //计算总件数
            var money = 0;  //计算总价钱
            //
            // $(".itxt").each(function (i,ele) {
            //     count += parseInt($(ele).val());
            // });
            // $(".j-checkbox").each(function (i,ele) {
            //     //count += parseInt($(ele).val());
            //     console.log($(ele).val())
            //  alert($(ele).checked)
            // });
            var checklist=document.getElementsByClassName("j-checkbox");
            var itxtlist=document.getElementsByClassName("itxt");
            var pricelist=document.getElementsByClassName("p-price");
            for(var i=0;i<checklist.length;i++){
                // alert(checklist[i].checked +" 数量"+itxtlist[i].value+" 价格 "+pricelist[i].innerHTML)
                if(checklist[i].checked==true){
                    var foodcount=parseInt(itxtlist[i].value);
                    var foodprice=pricelist[i].innerHTML;
                    foodprice=parseFloat(foodprice.substr(1));
                    count+=foodcount;
                    var xj=foodcount*foodprice;
                    // alert(count)
                    money+=xj;
                    // alert(money)

                    // alert(checklist[i].checked +" 数量"+itxtlist[i].value+" 价格 "+pricelist[i].innerHTML)
                }
            // alert(count)
            //     alert(money)
            }
            // document.getElementById("allcount").innerHTML=count;
            // document.getElementById("allprice").innerText=money;
            $(".amount-sum em").text(count);
            // $(".p-sum").each(function (i,ele) {
            //     money += parseFloat($(ele).text().substr(1));
            // });
            $(".price-sum em").text("¥" + money.toFixed(2));
            // document.getElementById("allprice").innerText=money;
        }

        //删除按钮
        $(".p-action").click(function () {
            $(this).parents(".cart-item").remove();
            //$(this).parent().siblings(".p-sum").html("¥" + (p * n).toFixed(2));
            var shopcarid = $(this).siblings().siblings(".shopcarid").html();
            var aa={"id":shopcarid}
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/shopcar/deleteShopcar",
                data:JSON.stringify(aa),
                contentType:'application/json;charset=utf-8'
            });
            alert(shopcarid)
        })
    })
    function countall() {
         // alert("结算了")
        var checklist=document.getElementsByClassName("j-checkbox");
        // var itxtlist=document.getElementsByClassName("itxt");
        // var pricelist=document.getElementsByClassName("p-price");
        var shopcarlist = document.getElementsByClassName("shopcarid");
        var shopcaridlist=new Array();
       var allcount= parseInt($(".amount-sum em").html());
        var allprice=$(".price-sum em").html();
        allprice=parseFloat(allprice.substr(1));
       //alert(allcount)
        //alert(allprice)
        // var num = document.getElementsByClassName("amount-sum").innerHTML;
        // var sum = document.getElementsByClassName("price-sum").innerHTML;
        // sum = sum.substr(1);
        // alert(num)
        // alert(sum)
        for(var i=0;i<checklist.length;i++){
            if(checklist[i].checked==true){
               var t= parseInt(shopcarlist[i].innerHTML);
               shopcaridlist.push(t)
               // alert(t)
            }
        }
        // alert(shopcaridlist)
        location.href="${pageContext.request.contextPath}/shopcar/countShopcar?shopcaridlist="+
            shopcaridlist+"&allcount="+allcount+"&allprice="+allprice;
    }
</script>

</html>
