<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
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
			<div class="section_header">安溪药店</div>
			<div>
				<div id="maps"></div>
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
		local.searchNearby("卫生服务站","云路街");
		
		$("#form").submit(function(){
			var alist = list;
					alert(alist);
				if (list) {
					$("#addrList").val(alist);
					return true;
				}
				return false;
		});
		</script>
			</div>
		</div>
		
			<div class="section">
			<div class="section_header">周边医讯</div>
			<form action="${contextPath}//drugStore/nearBy" id="form" method="post">
			<input type="hidden" value="" id="addrList" name="addrList"/>
			<input type="submit" id="sub" value="医院"/>
			</form>
			</div>
		<%@ include file="../../foot.jsp"%>
</body>

</html>