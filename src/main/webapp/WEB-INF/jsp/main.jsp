<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page  pageEncoding="UTF-8" %>
<%@ include file="common/header.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/1.css">
<title>主页</title>
</head>

<div id="bottom">
	<div class="wordt">
		浙江大学城市学院费用报销平台
	</div>

	<div class="bot">
		<a href="/demo/user/d" class="bot1">
			<span class="word">登陆</span>
		</a>
		<a href="/demo/user/m" class="bot1">
			<span class="word">修改密码</span>
		</a>
	</div>
</div>
</body>
</html>