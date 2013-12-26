<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.apache.http.util.EntityUtils"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="org.apache.http.*"  %>
<%@ page import="org.apache.http.client.methods.*"  %>
<%@ page import="org.apache.http.impl.client.*" %>
<%@ page import="org.apache.http.client.*" %>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
			//String portaltype1 = request.getParameter("portaltype")==null?"1":request.getParameter("portaltype").toString();
			String portaltype1 = "1";
			if(StringUtils.isNotBlank(request.getParameter("portaltype"))) {
				portaltype1 = request.getParameter("portaltype");
			} else {
				if(session.getAttribute("portaltype") != null) {
					portaltype1 = (String)session.getAttribute("portaltype");
				}
			}
			
			if(StringUtils.isBlank(portaltype1)) {
				portaltype1 = "1";
			}

			//String version1 = request.getParameter("version")==null?"3":request.getParameter("version").toString();
			String version1 = "3";
			if(StringUtils.isNotBlank(request.getParameter("version"))) {
				version1 = request.getParameter("version");
			} else {
				if(session.getAttribute("version") != null) {
					version1 = (String)session.getAttribute("version");
				}
			}
			
			if(StringUtils.isBlank(version1)) {
				version1 = "3";
			}
			
			String ua1 = request.getParameter("ua")==null?"":request.getParameter("ua").toString();
			String columnid1 = request.getParameter("columnid")==null?"":request.getParameter("columnid").toString();
			String resourceid1 = request.getParameter("resourceid")==null?"":request.getParameter("resourceid").toString();
			String screenwidth1 = request.getParameter("screenwidth")==null?"":request.getParameter("screenwidth").toString();
			String areacode1 = request.getParameter("areacode")==null?"140100":request.getParameter("areacode").toString();
			String usessionid1 = request.getParameter("usessionid")==null?"":request.getParameter("usessionid").toString();
			String ext1 = request.getParameter("ext")==null?"":request.getParameter("ext").toString();
			
			String bcpserver1 = "http://apps.wap.wxcs.cn/ajax/";
			String backurl1 ="http://183.203.21.86:8088/yiyahars_wap";

			String responseBottom1 = "";
			// 创建 HttpClient 的实例
			// 创建Get连接方法的实例
			String url1 = bcpserver1+"requestBottom.do?version="+version1+"&columnid="+columnid1+"&ua="+ua1+"&ext="+ext1+"&portaltype="+portaltype1+"&backurl="+URLEncoder.encode(backurl1, "utf-8")+"&resourceid="+resourceid1+"&areacode="+areacode1+"&screenwidth="+screenwidth1+"&usessionid="+usessionid1;
			HttpGet getMethod1 = null;
			try {
				getMethod1 = new HttpGet(url1);
				// 设置Get方法提交参数时使用的字符集,以支持中文参数的正常传递
				getMethod1.addHeader("Content-Type", "text/html;charset=utf-8");
				getMethod1.addHeader("Connection", "keep-alive");
				getMethod1.addHeader("Host", "apps.wap.wxcs.cn");
				Enumeration<String> headers = request.getHeaderNames();
				
				HttpClient httpClient1 = new DefaultHttpClient();;
				// 执行Get方法并取得返回状态码，200表示正常，其它代码为异常
				HttpResponse response1 = httpClient1.execute(getMethod1);
				if (response1 == null || response1.getStatusLine() == null) {
					System.out.println("服务器未正常响应: response is null or response.getStatusLine() is null.");
				}
				if (response1.getStatusLine().getStatusCode() != HttpStatus.SC_OK) {
					
					System.out.println("服务器未正常响应:" + url1 + "/"
							+ response1.getStatusLine().getStatusCode());
					
				} else {
					HttpEntity entity = response1.getEntity();
					if (entity != null) {
						responseBottom1 = EntityUtils.toString(entity, "utf-8");
					} else {
						System.out.println("response.getEntity() is null.");
					}
				}
			} catch (Exception ex) {
				getMethod1.abort();
			} finally {
				// 释放资源
				if (getMethod1 != null) {
					getMethod1.releaseConnection();
				}
			}
			%>
		<%=responseBottom1 %>

</body>
</html>