<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/7/2 0002
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.js"></script>
</head>
<body>
<div style="width: 1200px;height: auto;margin: 20px auto;background-color: #FAFAFA">
    <table cellspacing="0" border="1" width="100%">

        <tr style="height: 40px">
            <th style="width: 10%">商家真实姓名</th>
            <th style="width: 15%">店铺名</th>
            <th style="width: 30%">地址</th>
            <th style="width: 15%">营业执照</th>
            <th style="width: 15%">身份证</th>
            <th style="width: 5%">状态</th>
            <th style="width: 10%">操作</th>
        </tr>
        <c:forEach items="${businessList}" var="business">
        <tr class="t-item" style="height: 100px;text-align: center">
            <td>${business.bs_name}</td>
            <td>${business.store_name}</td>
            <td>${business.store_address}</td>
            <td><img style="width: 100px;height: 80px" src="<%=request.getContextPath()%>/${business.license_picture}"/></td>
            <td><img style="width: 100px;height: 80px" src="<%=request.getContextPath()%>/${business.idCard_picture}"/></td>
            <td>
              <c:if test="${business.status==1}">
                  已入驻
              </c:if>
                <c:if test="${business.status==0}">
                    待审核
                </c:if>
                <c:if test="${business.status==2}">
                    停业
                </c:if>
                </td>
            <td>
                <button id="${business.id}pass" onclick="pass('${business.id}')">
                    <c:if test="${business.status==1}">
<%--                        已入驻--%>
                    </c:if>
                    <c:if test="${business.status==0}">
                        批准
                    </c:if>
                    </button>
                <input type="hidden" class="bsid" value="${business.id}">
                <a href="javascript:;" class="t-action">强制停业</a>
            </td>
        </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    $(function () {
        $(".t-action").click(function () {
            var bid=$(this).siblings(".bsid").val();
            var list={"id":bid}
             $.ajax({
                 type:"POST",
                 url:"${pageContext.request.contextPath}/admin/deleteBusiness",
                 data:JSON.stringify(list),
                 success:function(data){
                     alert(data)
                 },
                 contentType:'application/json;charset=utf-8'
             })
            $(this).parents(".t-item").remove();
        })


    })
    function pass(aa) {
        var list={"id":aa}
        var x=document.getElementById(aa+"pass").innerText;
        if(x==""){}else{
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/admin/pass",
                data:JSON.stringify(list),
                success:function(data){
                    alert(data)
                },
                contentType:'application/json;charset=utf-8'
            })
            document.getElementById(aa+"pass").disabled = true;}
    }
</script>
</html>
