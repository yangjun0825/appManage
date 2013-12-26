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
		<div class="section_info">
		</div>
		
		<div class="section">
			<div class="section_header">药品查询</div>
			<div class="search_drug">
				<input type="text" class="search_field" id="drugName" placeholder="请输入药品名称" />
				<button class="search_button">搜索</button>
			</div>
		</div>
		
		<div class="section">
			<div class="section_header">药品分类</div>
			<div>
				<ul class="drugs_list">
					<c:if test="${drugInfoList!=null}">
						 <c:forEach items="${drugInfoList}" var="drug">
							<li>
							<div>
								<input id="drugSname" type="hidden" value="${drug.sname}"/>
								<span>${drug.sname}</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>${drug.scount}</span>
							</div>
							</li>
						</c:forEach>
					</c:if>
				</ul>
				<div class="clear"></div>
			</div>
		</div>
		
		
		<script src="${jsRoot}/plugins/jquery-2.0.0.min.js"></script>
		<script src="${jsRoot}/plugins/global.js"></script>
		<%@ include file="../../foot.jsp"%>
	</body>
</html>
