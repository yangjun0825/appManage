<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
			<div class="section_header">医院</div>
			<div>
				<c:set var="hosSize">${fn:length(hosList) }</c:set>
				<div class="nearby_result"><span>2000米</span> 范围内含 医院 结果 <span>${hosSize}</span> 条</div>
				<ul id="nearby_drugstores">
					<c:forEach items="${hosList}" var="nearby">
					<li>
						<div class="content">
							<div class="name">${nearby.name}</div>
							<div class="addr">地址：${nearby.address}</div>
							<div class="tel">电话：
							<c:choose>
								<c:when test="${nearby.phone != null && nearby.phone != 'undefined'}">
									${nearby.phone}
								</c:when>
								<c:otherwise>
									无
								</c:otherwise>
							</c:choose>							
							</div>
						</div>
					</li>
					</c:forEach>
				</ul>
					
				<div class="clear"></div>
			</div>
		</div>
		
		<script src="${jsRoot}/plugins/jquery-2.0.0.min.js"></script>
		<script src="${jsRoot}/plugins/global.js"></script>
		<%@ include file="../../foot.jsp"%>
	</body>
</html>
