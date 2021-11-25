<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/11 0011
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>foodComments</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.js"></script>
</head>
<body>
<div class="modal" style="width: 50%;height: auto;margin: 0 auto">
<%--    <div class="close-btn"></div>--%>
    <b><span>评价</span></b>
    <form style="width: 100%;height: auto;margin-top: 10px">
        <c:forEach items="${commentList}" var="comment">
            <table style="width: 100%;height: auto;margin-top: 2px" border="1">

                <tr>
                    <td width="40%" height="30px" style="padding-left: 40px">${comment.user.userName}</td>
                    <td width="60%" height="30px" style="padding-left: 30px">评分：${comment.c_score}分</td>
                </tr>
                <tr>
                        <%--                <img style="cursor: pointer"onclick="selectById('${food.id}','${business.id}')" class="check goodspc" src="<%=request.getContextPath()%>/${food.foodPicture}"/>--%>
                    <td colspan="2" style="width: 120px;height: 120px">
                        <img style="width: 120px;height: 120px" src="<%=request.getContextPath()%>/${comment.c_picture}">
                    </td>

                </tr>
                <tr>
                    <td colspan="2" height="40px">${comment.c_word}</td>
                </tr>
            </table>
        </c:forEach>
        </table>
    </form>
</div>
</body>
</html>
