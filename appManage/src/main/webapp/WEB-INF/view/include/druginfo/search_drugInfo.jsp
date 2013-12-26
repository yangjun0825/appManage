<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<meta name="format-detection" content="telephone=no" />
		<title>药品查询</title>
		<link rel="stylesheet" href="${cssRoot}/css/reset.css" />
		<link rel="stylesheet" href="${cssRoot}/css/global.css" />
	</head>
	
	<body>
		<%@ include file="../../head.jsp"%>
		<input type="hidden" id="contextPath" value="${contextPath}" />
		<div class="section">
			<div class="section_header">药品查询</div>
			
			<div class="search_drug">
				<input type="text" class="search_field" id="drugName" placeholder="请输入药品名称" value="${searchName}"/>
				<button class="search_button">搜索</button>
			</div>
			<div class="result_tips">共搜索到${drugSize}条相关结果</div>
			<div id="list_div">
				<ul class="drugs_info">
					<c:forEach items="${drugInfoList}" var="drugInfo">
						<li>
							<input id="drugInfoId" type="hidden" value="${drugInfo.id}"/>
							<div>${drugInfo.medname}</div>
						</li>
					</c:forEach>
				</ul>
				<div class="clear"></div>
				
				<button class="show_more" id="drug_search_more">点击查看更多</button>
				<input type="hidden" id="page" value="${page}"/>
			</div>
		</div>
		
		<script src="${jsRoot}/plugins/jquery-2.0.0.min.js"></script>
		<script src="${jsRoot}/plugins/global.js"></script>
		<script type="text/javascript">
		$(function(){
				var count = $("#page").val(); 
				if(count == -1){
					$("#list_div").find("button").remove(".show_more");
				}
			});
		</script>
		<%@ include file="../../foot.jsp"%>
	</body>
</html>
