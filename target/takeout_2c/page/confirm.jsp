<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/7/2 0002
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>结算</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
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
                <a href="${pageContext.request.contextPath}/order/intoOrder" style="margin-left: 10px"><b>订单管理</b></a>
                <a href="${pageContext.request.contextPath}/user/intoAddress" style="margin-left: 10px"><b>我的地址簿</b></a>
            </div>
        </div>
    </div>
</div>
<div style="width: 100%;height: 150px">
    <div style="width: 100%;height: 150px;background-color: #ffffff;display: inline-block;float: left;text-decoration: none">
        <div style="margin-top: 63px;margin-left: 15%"><span style="font-size: 24px;color: #7F7F7F">结算页</span></div>
    </div>
</div>
<div style="width: 70%;height: auto;margin: 0 auto">
    <div style="height: 34px;line-height: 34px">填写并核对订单信息</div>

    <div style="width: 100%;height: auto;border: 1px solid #efefef">
        <div style="margin-top: 10px;margin-left: 10px"><span><b>收货人信息</b></span></div>
        <div style="margin-top: 20px;margin-left: 20px;float: left" class="layui-input-inline">
            <select id="receive" name="msg" style="width: 900px">
                <option value="">请选择收货人</option>
                <c:forEach items="${receiveList}" var="receive">
                <option value="${receive.id}">收货人：${receive.name}&nbsp;&nbsp;手机号：${receive.phoneNumber}&nbsp;&nbsp;
                        收货地址：${receive.address}</option></c:forEach>
            </select>
        </div>
        <hr style="width: 100%;margin-top: 66px">

        <div style="margin-top: 10px;margin-left: 10px"><span><b>支付及配送方式</b></span></div>
        <div style="margin-top: 10px;margin-left: 20px"><span>支付方式：在线支付</span></div>
        <div style="margin-top: 10px;margin-left: 20px"><span>配送方式：外卖配送</span></div>
        <div style="margin-top: 10px;margin-left: 20px"><span>配送费 ：¥0.00</span>
            <span style="color: #ED1C0F">(免配送费)</span></div>
        <hr style="width: 100%;margin-top: 30px">

        <span style="margin-left: 10px"><b>商品清单</b></span>
        <c:forEach items="${carson}" var="carson">
        <div style="width: 96%;margin: 10px auto;border: 1px solid #E4E4E4">

            <table cellspacing="0" width="100%" style="">
                <tbody>
                <tr style="background-color:#FFF4D7;line-height: 26px">
                    <th class="store_name" style="width:282px;height: 40px;border-top: 1px #CCCCCC solid;border-bottom: 1px #CCCCCC solid;padding-left: 70px"  align="left">${carson.business.store_name}</th>
                    <th style="width:240px;border-top: 2px #CCCCCC solid;border-bottom: 2px #CCCCCC solid">商品名称</th>
                    <th style="display: none" class="start_time">${carson.business.start_time}</th>
                    <th style="display: none" class="over_time">${carson.business.over_time}</th>
                    <th style="width:240px;border-top: 2px #CCCCCC solid;border-bottom: 2px #CCCCCC solid">价格</th>
                    <th style="display: none" class="bd">${carson.business.id}</th>
                    <th style="width:240px;border-top: 2px #CCCCCC solid;border-bottom: 2px #CCCCCC solid">数量</th>
                    <th style="width:240px;border-top: 2px #CCCCCC solid;border-bottom: 2px #CCCCCC solid">小计</th>
                </tr>
                <c:forEach items="${carson.cargrandsonList}" var="cargrandson">
                <tr>
                    <th style="width: 200px;height: 100px;font-size:14px;white-space: pre-line;border-bottom: 1px #CCCCCC solid"><img style="width: 80px;height: 80px" src="<%=request.getContextPath()%>/${cargrandson.food.foodPicture}"/></th>
                    <th style="width: 300px;border-bottom: 1px #CCCCCC solid" class="foodname">${cargrandson.food.foodName}</th>
                    <th style="width: 200px;border-bottom: 1px #CCCCCC solid">¥${cargrandson.food.foodPrice}</th>
                    <th style="display: none" class="bsid">${carson.business.id}</th>
                    <th style="display: none" class="set_time">${carson.business.set_time}</th>
                    <th style="display: none" class="foodid">${cargrandson.food.id}</th>
                    <th style="display: none" class="kucun">${cargrandson.food.foodCount}</th>
                    <th class="foodcount" style="width: 200px;border-bottom: 1px #CCCCCC solid">${cargrandson.count}</th>
                    <th style="display: none" class="shopcarid" >${cargrandson.shopcarId}</th>

                    <th style="width: 200px;border-bottom: 1px #CCCCCC solid">${cargrandson.count*cargrandson.food.foodPrice}</th>
                </tr>
                </c:forEach>

                </tbody>
            </table>

        </div>
        </c:forEach>


    <div style="width: 100%;height: 100px;border: 1px solid #efefef;margin-top: 10px/*;background-color: #FF6700*/">
        <div style="float: right">
            <table style="border-collapse: separate;border-spacing: 18px;text-align: right">
                <tr>
                    <td>${allcount}件商品，总商品金额：</td>
                    <td>¥${allprice}</td>
                </tr>
                <tr>
                    <td>配送费：</td>
                    <td>¥0.00</td>
                </tr>
            </table>
        </div>
    </div>

    <div style="width: 100%;height: 60px/*;background-color: #CC3300*/">
        <div style="float: right">
            <table style="border-collapse: separate;border-spacing: 18px;text-align: right">
                <tr>
                    <td>应付总额：</td>
                    <td><b><span style="color: #e4393c">¥${allprice}</span></b></td>
                </tr>
            </table>
        </div>
    </div>

    <div style="width: 100%;height: 45px">
        <div style="width: 165px;height: 45px;float: right;text-decoration: none">
            <a onclick="submitorder()"><img src="${pageContext.request.contextPath}/image/button4.png"/></a>
        </div>
    </div>
</div>
</div>
</body>
<script>
    function submitorder() {
                  //获得地址id
                  var innerText = document.getElementById("receive").value;

                  if(innerText==""){
                      alert("请添加地址后再提交")
                  }
                  else{
                      var st=1; //当st为0时代表其中一店铺不在营业时间，不能下单
                      //获取当前时间
                      var nowDate = new Date();
                      var hours = nowDate.getHours();
                      var minutes = nowDate.getMinutes();
                      var seconds = nowDate.getSeconds();
                       var nowtime=hours*3600+minutes*60+seconds;
                     // alert(nowtime)
                      var startlist = document.getElementsByClassName("start_time");
                      var overlist = document.getElementsByClassName("over_time");
                      var storelist=document.getElementsByClassName("store_name");
                      for(i=0;i<startlist.length;i++){
                          var start_time=parseInt(startlist[i].innerHTML)
                          var over_time=parseInt(overlist[i].innerHTML)
                          if(nowtime>=start_time&&nowtime<=over_time){}else {
                              st=0;
                              alert("店铺："+storelist[i].innerHTML+"  "+"未在营业时间，请重新选择")
                          }
                      }
                      if(st==1){
                          var gg=1;//检查食物库存，当点单数量大于库存数时，置为0
                          var ctlist=document.getElementsByClassName("foodcount");
                          var klist= document.getElementsByClassName("kucun");
                          var flist = document.getElementsByClassName("foodname");
                          for (x=0;x<ctlist.length;x++) {
                              var c=parseInt(ctlist[x].innerHTML)
                              var k=parseInt(klist[x].innerHTML)
                              // alert(c+" aaa"+k)
                              if(c>k){
                                  gg=0;
                                  alert("商品："+flist[x].innerHTML+"库存量不足，请重新选择 "+"剩余："+k)
                              }
                          }
                          if(gg==1){
                          // alert("收货信息"+innerText);
                          var receiveid=parseInt(innerText);
                          var shopcaridList = document.getElementsByClassName("shopcarid");
                          var foodidList=document.getElementsByClassName("foodid");
                          var countList=document.getElementsByClassName("foodcount");
                          var bsList=document.getElementsByClassName("bsid");
                          var setTimeList=document.getElementsByClassName("set_time");
                          var shopcarlist=new Array();
                          var foodlist=new Array();
                          var foodcountlist=new Array();
                          var bsidlist=new Array();
                          var setlist=new Array();
                          for(i=0;i<shopcaridList.length;i++){
                              var shopcarid = parseInt(shopcaridList[i].innerHTML);
                              shopcarlist.push(shopcarid);
                              var foodid=parseInt(foodidList[i].innerHTML);
                              foodlist.push(foodid);
                              var count=parseInt(countList[i].innerHTML);
                              foodcountlist.push(count)
                              var  bsid=parseInt(bsList[i].innerHTML)
                              bsidlist.push(bsid)
                              var  set_time=parseInt(setTimeList[i].innerHTML)
                              setlist.push(set_time)
                          }
                          var bd = document.getElementsByClassName("bd");
                          var bdlist=new Array();
                          for(t=0;t<bd.length;t++){
                               var bdd=parseInt(bd[t].innerHTML);
                               bdlist.push(bdd);
                          }
                          location.href="${pageContext.request.contextPath}/order/submitConfirm?receiveid="+receiveid+
                                  "&shopcaridList="+shopcarlist+"&foodidList="+foodlist+"&foodcountList="+foodcountlist+
                              "&bsidlist="+bsidlist+"&setlist="+setlist+"&bdlist="+bdlist;
                          // alert("收获地址id"+receiveid)
                          // alert("购物车"+shopcarlist)
                          // alert("食物"+foodlist)
                          // alert("数量"+foodcountlist)
                      }
                      }

        }

    }
</script>
</html>
