<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<meta name="format-detection" content="telephone=no" />
		<title>药店查询</title>
		<link rel="stylesheet" href="${cssRoot}/css/reset.css" />
		<link rel="stylesheet" href="${cssRoot}/css/global.css" />
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=YuzIVWfelKS2HKiId97OifXa"></script>
		<script src="${jsRoot}/plugins/jquery-2.0.0.min.js"></script>
		<script type="text/javascript">
			function reflash(){
			document.location.reload()
			}
		</script>
	</head>
	
	<body>
		<%@ include file="../../head.jsp"%>
		<input type="hidden" id="contextPath" value="${contextPath}" />
		<div class="section">
			<div class="section_header">我的位置</div>
			<div>
				<div class="section_content">
					<div>您现在：</div>
					<div id="location"></div>
					<div>如您的位置有误，请<a onclick="reflash()"><span class="relocate">重新定位</span></a></div>
				</div>
				<div id="maps"></div>
			</div>
		</div>
		
		<div class="section">
			<div class="section_header">周边医讯</div>
			<div class="section_content">
					<form action="${contextPath}/drugStore/nearBy" id="form" method="post">
					<input type="hidden" value="" id="addrList" name="addrList"/>
					<a href="#" onclick="nearby()"><span>医院</span></a>
					<a href="#" onclick="nearby()"><span>药店</span></a>
					<a href="#" onclick="nearby()"><span>卫生服务站</span></a>
					</form>
			</div>
		</div>
		
		<div class="section">
			<div class="section_header">周边公交站点</div>
			<div class="section_content">
				山大一院
			</div>
		</div>
		
		<script type="text/javascript">
					// 百度地图API功能
					 var map = new BMap.Map("maps"); // 创建Map实例
					 map.centerAndZoom("太原市",11);
					var address = "";
					var geolocation = new BMap.Geolocation();
					geolocation.getCurrentPosition(function(r){//获得浏览器定位的坐标信息
					    if(this.getStatus() == BMAP_STATUS_SUCCESS){
							map.centerAndZoom(r.point, 15);
					    	var gc = new BMap.Geocoder();
							gc.getLocation(r.point,function(rs){//将浏览器地位的坐标信息转换成地址信息
								address = rs.address;
								$("#location").text(address);
								//alert("地址："+address);
							});
							
					    }
					    else {
					        alert("定位失败!");
					    }        
					},{enableHighAccuracy: true});
					
					var local = new BMap.LocalSearch(map, {
						renderOptions : {
							map : map
						}
					});
					local.search(address);
					
					var list = [];
					var options = {
							onSearchComplete:function(results){
								//判断状态是否正确
								if(_local.getStatus() == BMAP_STATUS_SUCCESS){
									for(var i = 0;i<results.getCurrentNumPois();i++){
										list.push("&"+results.getPoi(i).title+","+results.getPoi(i).address+","+results.getPoi(i).phoneNumber);
									}
								}
							}
					};
					
					var _local = new BMap.LocalSearch(map, options);
					_local.searchNearby("医院",address);
					
					function nearby(){
						var alist = list;
						//alert(alist);
						//if(alist != ""){
						$("#addrList").val(alist);
						$("#form").submit();
						//}else{
							//alert("网络不给力，请稍后重试");
						//}
					}
					
				</script>
		<script src="${jsRoot}/plugins/global.js"></script>
		<%@ include file="../../foot.jsp"%>
	</body>
</html>
