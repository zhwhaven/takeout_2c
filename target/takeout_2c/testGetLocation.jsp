<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/26 0026
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p id="demo">点击这个按钮，获得您的位置：</p>
<button onclick="getLocation()">试一下</button>

<div id=“weizhi” style="width:2000px;height:1000px"></div>
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script>
    function  getLocation(){

        var options={

            enableHighAccuracy:false, //精确定位

            maximumAge:1000//最长时间

        }

        if(navigator.geolocation){

            //浏览器支持geolocation

            navigator.geolocation.getCurrentPosition(onSuccess,onError,options);

        }else{

            console.log('你的浏览器不支持地理定位');//浏览器不支持geolocation

        }

    }

    //成功时

    function onSuccess(position){

        //经度

        var longitude =position.coords.longitude;

        //纬度

        var latitude = position.coords.latitude;

        //创建地图实例

        var map =new BMap.Map("container");

        //创建一个坐标

        var point =new BMap.Point(longitude,latitude);

        //地图初始化，设置中心点坐标和地图级别

        map.centerAndZoom(point,15);

    }

    //失败时

    function onError(error){

        switch(error.code){

            case 1:

                alert("位置服务被拒绝");

                break;



            case 2:

                alert("暂时获取不到位置信息");

                break;

        }

    }

    window.onload=getLocation;
</script>
</body>
</html>

