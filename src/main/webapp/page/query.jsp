<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/7/5 0005
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>入驻申请查询</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.js"></script>
</head>
<body>
<div style="width: 70%;height: 600px;background-image: url(${pageContext.request.contextPath}/image/8.jpg);background-repeat: no-repeat;background-size: 100% 100%;margin: 0 auto">
    <div style="text-align: center;padding-top: 20px">
        <input type="search" id="phone" name="keyword" autocomplete="off" placeholder="请输入申请时填写的手机号码" style="width: 300px;height: 36px">
        <input type="button" value="搜索" onclick="selects()" style="height: 36px">
    </div>
   <script>
       function selects() {
            var bsphone= document.getElementById("phone").value;
            var list={"bs_phone":bsphone}
           $.ajax({
               type:"POST",
               url:"${pageContext.request.contextPath}/business/seleteStatus",
               data:JSON.stringify(list),
               success:function(data){
                   alert(data)
               },
               contentType:'application/json;charset=utf-8'
           })
       }
   </script>
</div>
</body>
</html>
