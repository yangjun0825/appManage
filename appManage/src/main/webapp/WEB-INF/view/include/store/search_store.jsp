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
	</head>
	
	<body>
		<%@ include file="../../head.jsp"%>
		<input type="hidden" id="contextPath" value="${contextPath}" />
		<div class="section">
			<div class="section_header">药店搜索</div>
			<div class="search_drugstore">
				<input type="text" class="search_field" id="storeName" placeholder="请输入药店名称" value="${searchName}"/>
				<button class="search_button">搜索</button>
			</div>
			<div class="result_tips">共搜索到${storeSize}条相关结果</div>
			<div id="list_div">
				<ul class="drug_stores">
					<c:if test="${drugStoreList!=null}">
						 <c:forEach items="${drugStoreList}" var="store">
							<li>
								<input id="storeId" type="hidden" value="${store.id}"/>
								<div>${store.storename}</div>
							</li>
						</c:forEach>
					</c:if>
				</ul>
				
				<div class="clear"></div>
				<button class="show_more" id="store_search_more">点击查看更多</button>
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
