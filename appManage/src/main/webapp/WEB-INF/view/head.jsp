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
		//String portaltype = request.getParameter("portaltype")==null?"1":request.getParameter("portaltype").toString();
		String portaltype = "1";
		
		if(StringUtils.isNotBlank(request.getParameter("portaltype"))) {
			portaltype = request.getParameter("portaltype");
		} else {
			if(session.getAttribute("portaltype") != null) {
				portaltype = (String)session.getAttribute("portaltype");
			}
		}
		
		if(StringUtils.isBlank(portaltype)) {
			portaltype = "1";
		}
		
		//String version = request.getParameter("version")==null?"3":request.getParameter("version").toString();
		String version = "3";
		if(StringUtils.isNotBlank(request.getParameter("version"))) {
			version = request.getParameter("version");
		} else {
			if(session.getAttribute("version") != null) {
				version = (String)session.getAttribute("version");
			}
		}
		
		if(StringUtils.isBlank(version)) {
			version = "3";
		}
		
		
		String ua = request.getParameter("ua")==null?"":request.getParameter("ua").toString();
		String columnid = request.getParameter("columnid")==null?"":request.getParameter("columnid").toString();
		String resourceid = request.getParameter("resourceid")==null?"":request.getParameter("resourceid").toString();
		String screenwidth = request.getParameter("screenwidth")==null?"":request.getParameter("screenwidth").toString();
		String areacode = request.getParameter("areacode")==null?"140100":request.getParameter("areacode").toString();
		String usessionid = request.getParameter("usessionid")==null?"":request.getParameter("usessionid").toString();
		String ext = request.getParameter("ext")==null?"":request.getParameter("ext").toString();

    	String bcpserver = "http://apps.wap.wxcs.cn/ajax/";
		   	
    	String backurl ="http://183.203.21.86:8088/yiyahars_wap";
    	String responseHead = "";
    	// 创建 HttpClient 的实例
    	// 创建Get连接方法的实例
    	String url=bcpserver+"requestHead.do?version="+version+"&columnid="+columnid+"&ua="+ua+"&ext="+ext+"&portaltype="+portaltype+"&backurl="+URLEncoder.encode(backurl,"utf-8")+"&resourceid="+resourceid+"&areacode="+areacode+"&screenwidth="+screenwidth+"&usessionid="+usessionid;
    	HttpGet getMethod = null;
    	try {
    		getMethod = new HttpGet(url);
    		// 设置Get方法提交参数时使用的字符集,以支持中文参数的正常传递
    		getMethod.addHeader("Content-Type", "text/html;charset=utf-8");
    		getMethod.addHeader("Connection", "keep-alive");
    		getMethod.addHeader("Host", "apps.wap.wxcs.cn");
    		Enumeration<String> headers = request.getHeaderNames();
    		HttpClient httpClient = new DefaultHttpClient();
    		// 执行Get方法并取得返回状态码，200表示正常，其它代码为异常
    		HttpResponse response1 = httpClient.execute(getMethod);
    		if (response1 == null || response1.getStatusLine() == null) {
    			System.out.println("server not respnose: response is null or response.getStatusLine() is null.");
    		}
    		if (response1.getStatusLine().getStatusCode() != HttpStatus.SC_OK) {			
    			System.out.println("server not respnose:" + url + "/"+response1.getStatusLine().getStatusCode());
    		} else {
    			HttpEntity entity = response1.getEntity();
    			if (entity != null) {
    				responseHead = EntityUtils.toString(entity, "utf-8");
    				} else {
    									System.out.println("response.getEntity() is null.");
    								}
    							}
    						} catch (Exception ex) {
    							ex.printStackTrace();
    							getMethod.abort();
    						} finally {
    							// 释放资源
    							if (getMethod != null) {
    								getMethod.releaseConnection();
    							}
    						}
    						
    						

     %>
     <%=responseHead %>
</body>
</html>