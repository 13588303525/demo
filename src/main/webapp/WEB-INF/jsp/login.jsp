<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="common/header.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/2.css">
</head>
<body>
<div class="link">
		<center><h2>登&nbsp;&nbsp;录</h2></center>
		<c:if test="${status == 'psdwrong'}">
			<p class="error">密码错误</p>
		</c:if>
		<c:if test="${status == 'none'}">
			<p class="error">用户名不能为空</p>
		</c:if>
		<c:if test="${status == 'notexist'}">
			<p class="error">用户不存在</p>
		</c:if>
		<c:if test="${status == 'wrongifm'}">
			<p class="error">该用户类型不完整登录失败</p>
		</c:if>
		<form:form modelAttribute="user" action="/demo/user/login" method="post">
			<form:label path="UserName">用户名</form:label><form:input path="UserName" />
			<form:label path="Password">密码</form:label><form:password  path="Password" />
			&nbsp;&nbsp;&nbsp;<button type="submit" id="login">登&nbsp;&nbsp;录</button>
		</form:form>
	</div>
</body>