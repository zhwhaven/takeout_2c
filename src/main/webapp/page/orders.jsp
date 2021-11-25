<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/30 0030
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.js"></script>
    <!-- 引入 layui.js -->
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
                <a href="${pageContext.request.contextPath}/order/intoOrder" style="margin-left: 10px"><b>刷新</b></a>
                <a href="${pageContext.request.contextPath}/user/intoAddress" style="margin-left: 10px"><b>我的地址簿</b></a>
            </div>
        </div>
    </div>
</div>
<div style="width: 80%;height: auto;margin: 20px auto;background-color: #FFFFFF;border: 1px solid #E4E4E4">
    <div style="width: 96%;margin: 20px auto">
        <h1>我的订单</h1>
        <hr>
    </div>
    <div style="width: 100%;height: auto">
        <c:forEach items="${carsonList}" var="carson">
<%--            ${carson.coutlist}--%>
        <table cellspacing="0" style="width:96%;text-align: center;border-top:2px #c8cccc solid;border-bottom:2px #c8cccc solid;border-left:2px #c8cccc solid;border-right:2px #c8cccc solid;margin: 10px auto">
            <tbody>
            <tr style="background-color: #e2e2e2;line-height: 30px">
                <td style="border-bottom:2px #c8cccc solid;text-align: left" colspan="3">${carson.business.store_name}&nbsp;&nbsp;&nbsp;&nbsp;订单编号:${carson.pageid}</td>
                <td style="border-bottom:2px #c8cccc solid;text-align: left" colspan="2">预计送达时间：${carson.finish_time}</td>
            </tr>
            <c:forEach items="${carson.cargrandsonList}" var="cargrandson" varStatus="status" >
            <tr>

                <td>
                    <table width="100%" style="text-align: center">
                        <td style="width: 100px;height: 100px"><img style="width: 80px;height: 80px" src="<%=request.getContextPath()%>/${cargrandson.food.foodPicture}"/></td>
                        <td style="width: 200px" class="${carson.pageid}name">${cargrandson.food.foodName}</td>
<%--                        <td style="width: 200px" class="${carson.pageid}id">${cargrandson.food.id}</td>--%>
                        <input class="${carson.pageid}id" value="${cargrandson.food.id}" type="hidden">
                        <td style="width: 100px">￥${cargrandson.food.foodPrice}</td>
                        <td style="width: 100px">${cargrandson.count}</td>
                        <td style="width: 100px;border-right: 1px solid #c8cccc">￥${cargrandson.food.foodPrice*cargrandson.count}</td>
                    </table>
                </td>
                <c:if test="${status.index+1==1}">

                    <td width="169x"  rowspan="${carson.coutlist}" style="border-right: 1px solid #c8cccc">总计：￥${carson.totalPrice}</td>
                    <td id="st${carson.pageid}" width="169px" rowspan="${carson.coutlist}" style="border-right: 1px solid #c8cccc">
                        <c:if test="${carson.status==0}">
                            未发货
                        </c:if>
                        <c:if test="${carson.status==1}">
                            已发货
                        </c:if>
                        <c:if test="${carson.status==2}">
<%--                            订单完成--%>
                            <button id="comment" onclick="intoComment('${carson.pageid}','${carson.business.store_name}')">评价</button>
                        </c:if>
                        <c:if test="${carson.status==3}">
                            已评价
                        </c:if>
                    </td>
                    <td width="169px" rowspan="${carson.coutlist}" style="border-right: 1px solid #c8cccc">${carson.receive.address}</td>
                    <td width="169px" rowspan="${carson.coutlist}"><button id="${carson.pageid}btn" onclick="confirmget('${carson.pageid}')">

                        <c:if test="${carson.status==0}">

                        </c:if>
                        <c:if test="${carson.status==1}">
                            确认收货
                        </c:if>
                        <c:if test="${carson.status==2}">
<%--                            已完成--%>
                        </c:if></button></td>
                </c:if>
                </c:forEach>

            </tr>

        </table></c:forEach>
    </div>
</div>
</body>
<script>
    function confirmget(aa) {
        var x=document.getElementById(aa+"btn").innerText;
        if(x==""||x=="已收货"){

        }else{
        document.getElementById(aa+"btn").innerText="已收货";
        document.getElementById(aa+"btn").disabled=true;
        document.getElementById("st"+aa).innerText="已完成";
        var pageid=parseInt(aa);
        var tt={"id":pageid,"status":2};
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/order/changeStutus",
                data:JSON.stringify(tt),
                contentType:'application/json;charset=utf-8'

            });
        }
    }
    function intoComment(pageid,bs_name) {
    <%--<td style="width: 200px" class="${carson.pageid}name">${cargrandson.food.foodName}</td>--%>
    <%--        <input class="${carson.pageid}id" value="${cargrandson.food.id}" type="hidden">--%>
    //     alert(bs_name)
    //     alert(pageid)
        var bs_name=bs_name;
        var page_id=parseInt(pageid);
        var obj = document.getElementsByClassName(pageid+"id");
        var obj1=document.getElementsByClassName(pageid+"name");
        var idlist=new Array();
        var namelist=new Array();
         for(i=0;i<obj.length;i++){
             //x是id,y是foodname
             var x=obj[i].value;
             var y=obj1[i].innerText;
             // alert(x +"jjjjj"+"  "+y)
             idlist.push(x);
             namelist.push(y)
         }
         location.href="${pageContext.request.contextPath}/comment/intoComment?foodid="+idlist
             +"&foodName="+namelist+"&bs_name="+bs_name+"&page_id="+page_id;
    }
</script>
</html>
