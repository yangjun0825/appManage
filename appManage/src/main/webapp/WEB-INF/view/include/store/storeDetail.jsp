<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<meta name="format-detection" content="telephone=no" />
		<title>药店查询</title>
		<link rel="stylesheet" href="${cssRoot}/css/reset.css" />
		<link rel="stylesheet" href="${cssRoot}/css/global.css" />
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=YuzIVWfelKS2HKiId97OifXa"></script>
	</head>
	
	<body>
		<%@ include file="../../head.jsp"%>
		<input type="hidden" id="contextPath" value="${contextPath}" />
		<input type="hidden" id="storeId" value="${drugStore.id }"/>
		<div class="section">
			<div class="section_header">${drugStore.storename}</div>
			<div>
				<div id="maps"></div>
				<script type="text/javascript">
					// 百度地图API功能
					var map = new BMap.Map("maps"); // 创建Map实例
					map.centerAndZoom(new BMap.Point(112.550864, 37.866124), 11);
					var local = new BMap.LocalSearch(map, {
						renderOptions : {
							map : map
						}
					});
					local.search('${drugStore.address}');
				</script>
				
				<table class="maps_operation">
					<tr>
						<td>
							<div id="location_info">位置详情</div>
						</td>
						<td>
							<div id="my_location">我的位置</div>
						</td>
					</tr>
				</table>
				
				<div class="drugstore_info_section">
					<span class="info_name">地址：</span>${drugStore.address}
				</div>
				<div class="drugstore_info_section">
					<span class="info_name">电话：</span><span class="tel_num">${drugStore.tel }</span>
				</div>
				<div class="drugstore_info_section">
					<span class="info_name">简介：</span>${drugStore.information}
				</div>
			</div>
		</div>
		
		<script src="${jsRoot}/plugins/jquery-2.0.0.min.js"></script>
		<script src="${jsRoot}/plugins/global.js"></script>
		<%@ include file="../../foot.jsp"%>
	</body>
</html>
