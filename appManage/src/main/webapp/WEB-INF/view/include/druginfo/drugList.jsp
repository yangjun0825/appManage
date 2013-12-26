<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div class="search_drug">
				<input type="text" class="search_field" id="drugName" placeholder="请输入药品名称" />
				<button class="search_button">搜索</button>
			</div>
		</div>
		
		<div class="section">
			<div class="section_header">${sname}</div>
			
			<div id="list_div">
				<div id="top_news">
					<img src="${drugInfoList[0].medimg }"/>
					<input id="drugInfoId" type="hidden" value="${drugInfoList[0].id}"/>
					<div>${drugInfoList[0].medname }</div>
				</div>
				<ul class="drugs_info">
					<c:if test="${drugInfoList!=null}">
						<c:forEach items="${drugInfoList}" var="drugInfo" varStatus="s">
							<c:if test="${s.index == 0 }">
							</c:if>
							<c:if test="${s.index != 0 }">
							<li>
								<input id="drugInfoId" type="hidden" value="${drugInfo.id}"/>
								<div>${drugInfo.medname}</div>
							</li>
							</c:if>
						</c:forEach>
					</c:if>
				</ul>
				
				<div class="clear"></div>
				<button class="show_more" id="drug_more">点击查看更多</button>
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
