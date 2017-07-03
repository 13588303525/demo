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
		<center><h2>修改密码</h2></center>
			<c:if test="${status == 'notexist'}">
			<p class="error">用户名不存在</p>
		</c:if>
		<c:if test="${status == 'psdwrong'}">
			<p class="error">原密码错误</p>
		</c:if>
		<c:if test="${status == 'newsame'}">
			<p class="error">不能与原密码一样</p>
		</c:if>
		<c:if test="${status == 'nmatch'}">
			<p class="error">两次密码输入不匹配</p>
		</c:if>
		<c:if test="${status == 'success'}">
			<p class="success">修改成功</p>
		</c:if>
		<form:form modelAttribute="user" action="/demo/user/modify_pwd" method="post">
			<label >用户名</label><input type="text" name="uname">
			<label >原密码</label><input type="password" name="pwd">
			<label>新密码</label><input type="password" name="newpwd">
			<label>新密码确认密码</label><input type="password" name="confirmpwd">
			&nbsp;&nbsp;&nbsp;<button type="submit" id="modify_pwd">确&nbsp;&nbsp;定</button>
		</form:form>
	</div>
</body>