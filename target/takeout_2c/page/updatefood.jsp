<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/7/2 0002
  Time: 20:15
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
<div style="width: 1000px;height: auto;margin: 20px auto;background-color: #FAFAFA">
    <table id="mytable" cellspacing="0" border="1" width="100%">
        <tr style="height: 40px">
            <th style="width: 20%">图片</th>
            <th style="width: 20%">名称</th>
            <th style="width: 15%">单价</th>
            <th style="width: 15%">库存</th>
            <th style="width: 30%">操作</th>
        </tr>
           <c:forEach items="${foodList}" var="food">
        <tr class="t-item" style="height: 100px;text-align: center">
            <td><img style="width: 80px;height: 80px" src="<%=request.getContextPath()%>/${food.foodPicture}"/></td>
            <td > <input id="${food.id}name" type="text" style="border: none;text-align: center;background-color:#FAFAFA" value="${food.foodName}"></td>
            <td ><input id="${food.id}price" type="text" style="border: none;text-align: center;background-color:#FAFAFA" value="${food.foodPrice}"></td>
            <td ><input id="${food.id}count" type="text" style="border: none;text-align: center;background-color:#FAFAFA" value="${food.foodCount}"></td>
            <td>
                <a href='#' onclick="updateFood('${food.id}')">修改</a>
                <a href='#' onclick='Del( ${food.id},this.parentNode,this.parentNode.parentNode.rowIndex)'>删除</a>
            </td>
        </tr>
           </c:forEach>

    </table>
</div>

</body>
<script>
    function x(id) {
        return document.getElementById(id);
    }

  function updateFood(aa) {
        // alert("修改"+aa)
      var name= document.getElementById(aa+"name").value;
      var price= parseInt(document.getElementById(aa+"price").value);
      var count= parseInt(document.getElementById(aa+"count").value);
      var list={"id":aa,"foodName":name,"foodPrice":price,"foodCount":count};
      $.ajax({
          type:"POST",
          url:"${pageContext.request.contextPath}/business/updateFood",
          data:JSON.stringify(list),
          success:function(data){
              alert(data)
          },
          contentType:'application/json;charset=utf-8'
      });
  }


    function Del(kk,obj, val) {
        var list={"id":kk}
        var a = window.confirm("您确定要删除吗？");
        if (a) {
            x("mytable").deleteRow(val);
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/business/deleteFood",
                data:JSON.stringify(list),
                success:function(data){
                    alert(data)
                },
                contentType:'application/json;charset=utf-8'
            });
        } else {
            window.alert("未删除！");
        }
    }
</script>
</html>
