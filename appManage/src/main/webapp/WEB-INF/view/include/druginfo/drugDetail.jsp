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
		<div class="detail_title">药品查询</div>
		<ul id="tabs">
			<li class="curr"><a>概述</a></li>
			<li><a>详细信息</a></li>
		</ul>
		<div class="clear"></div><!-- 去除浮动 -->
		
		<div id="summary_section">
			<p class="detail_img">
				<img src="${drugInfo.medimg }" />
			</p>
			<div>
				<span>产品名称：</span>
				<div>${drugInfo.medname}</div>
			</div>
			<div>
				<span>通用名称：</span>
				<div>${drugInfo.comname}</div>
			</div>
			<div>
				<span>药品剂型：</span>
				<div>${drugInfo.medtype}</div>
			</div>
			<div>
				<span>产品规格：</span>
				<div>${drugInfo.medsize}</div>
			</div>
			<div>
				<span>功能主治：</span>
				<div>${drugInfo.purpose}</div>
			</div>
			<div>
				<span>用法用量：</span>
				<div>${drugInfo.directions }</div>
			</div>
			<div>
				<span>不良反应：</span>
				<div>${drugInfo.adrs}</div>
			</div>
		</div>
		
		<div id="detail_section">
			<div>
				<span>批准文号：</span>
				<div>${drugInfo.approvalnum}</div>
			</div>
			<div>
				<span>产品名称：</span>
				<div>${drugInfo.medname}</div>
			</div>
			<div>
				<span>通用名称：</span>
				<div>${drugInfo.comname}</div>
			</div>
			<div>
				<span>生产厂商：</span>
				<div>${drugInfo.manufacturer}</div>
			</div>
			<div>
				<span>药品剂型：</span>
				<div>${drugInfo.medtype}</div>
			</div>
			<div>
				<span>是否医保：</span>
				<div>${drugInfo.ismedicare }</div>
			</div>
			<div>
				<span>是否OTC：</span>
				<div>${drugInfo.isotc }</div>
			</div>
			<div>
				<span>产品规格：</span>
				<div>${drugInfo.medsize }</div>
			</div>
			<div>
				<span>功能主治：</span>
				<div>${drugInfo.purpose }</div>
			</div>
			<div>
				<span>用法用量：</span>
				<div>${drugInfo.directions }</div>
			</div>
			<div>
				<span>贮藏：</span>
				<div>${drugInfo.storage } </div>
			</div>
			<div>
				<span>不良反应：</span>
				<div>${drugInfo.adrs }</div>
			</div>
			<div>
				<span>禁忌症：</span>
				<div>${drugInfo.taboo }
				</div>
			</div>
			<div>
				<span>注意事项：</span>
				<div>${drugInfo.notes}
				</div>
			</div>
			<div>
				<span>成分：</span>
				<div>${drugInfo.inqredient }</div>
			</div>
			<div>
				<span>药理作用：</span>
				<div>${drugInfo.medeffect }</div>
			</div>
			<div>
				<span>药理相互作用：</span>
				<div>${drugInfo.medeffect2 }</div>
			</div>
		</div>
		
		<script src="${jsRoot}/plugins/jquery-2.0.0.min.js"></script>
		<script src="${jsRoot}/plugins/global.js"></script>
		<%@ include file="../../foot.jsp"%>
	</body>
</html>
