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
	</head>
	
	<body>
		<%@ include file="../../head.jsp"%>
		<input type="hidden" id="contextPath" value="${contextPath}" />
		<div class="section">
			<div class="section_header">${drugStore.storename}</div>
			<div>
				<div id="maps"></div>
				<div class="drugstore_info_section">
					<span class="info_name">地址：</span>${drugStore.address}
				</div>
				<div class="drugstore_info_section">
					<span class="info_name">电话号码：</span><span class="tel_num">${drugStore.tel }</span>
				</div>
				<div class="drugstore_info_section">
					<span class="info_name">公交线路：</span>${drugStore.trans}。
				</div>
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
		map.centerAndZoom(new BMap.Point(112.550864, 37.866124), 15);
		var list = [];
		var options = {
				onSearchComplete:function(results){
					//判断状态是否正确
					if(local.getStatus() == BMAP_STATUS_SUCCESS){
						for(var i = 0;i<results.getCurrentNumPois();i++){
							list.push("&"+results.getPoi(i).title+","+results.getPoi(i).address+","+results.getPoi(i).phoneNumber);
						}
					}
				}
		};
	
		
		var local = new BMap.LocalSearch(map, options);
		local.searchNearby("医院",'${drugStore.address}');
		
		function nearby(){
			var alist = list;
			//alert(alist);
			//if(alist != ""){
			$("#addrList").val(alist);
			$("#form").submit();
			//}else{
			//	alert("网络不给力，请稍后重试");
			//}
		}
		</script>
		<%@ include file="../../foot.jsp"%>
	</body>
</html>
