<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="common/header.jsp" %>

	<div class="link">
		<h2>创建用户</h2>
		<c:if test="${saved == 'success'}">
			<p class="success">用户创建成功</p>
		</c:if>
		<c:if test="${saved == 'exist'}">
			<p class="error">用户创建失败</p>
		</c:if>
		<c:if test="${print == 'success'}">
			<p class="error">输出成功</p>
		</c:if>
		<c:if test="${deleted == 'success'}">
			<p class="success">用户删除成功</p>
		</c:if>
		<c:if test="${deleted == 'error'}">
			<p class="error">用户删除失败</p>
		</c:if>
		<c:if test="${status == 'exist'}">
			<p class="error">用户已存在</p>
		</c:if>
		<form:form modelAttribute="user" action="/demo/user/create" method="post">
			<form:label path="user_name">用户名</form:label><form:input path="user_name" />
			<form:label path="age">年龄</form:label><form:input path="age" />
			<form:label path="nick_name">昵称</form:label><form:input path="nick_name" />
			<form:label path="user_type">用户类型</form:label><form:input path="user_type" />
			<form:label path="password">密码</form:label><form:password  path="password" />
			<button type="submit" id="save">保存</button><button type="submit" id="search">搜索</button><br>
			<button type="submit" id="print">输出所有用户</button>
		</form:form>
	</div>

	<c:if test="${not empty users}">
	<table>	
	<tr>
	<th>用户名</th>
	<th>年龄</th>
	<th>昵称</th>
	<th>用户类型</th>
	<th colspan="2">操作</th>
	</tr>
	<c:forEach var="current" items="${users}">
		<tr>
		<td>${current.user_name}</td>
		<td>${current.age}</td>
		<td>${current.nick_name}</td>
		<td>${current.user_type}</td>
		<td><a href="/demo/user/edit/${current.user_name}">Edit</a></td>
		<td><a href="/demo/user/delete/${current.user_name}">Delete</a></td>
		</tr>
	</c:forEach>
	</table>
	</c:if>

<script type="text/javascript">

	$(function() {
		$("#save").click(function(event) {
        	$("#user").attr("action", "/demo/user/create")
			$("#user").submit();
		});

		$("#search").click(function(event) {
        	$("#user").attr("action", "/demo/user/search")
			$("#user").submit();

		});
		$("#print").click(function(event) {
        	$("#user").attr("action", "/demo/user/print")
			$("#user").submit();

		});
	});
</script>

<%@ include file="common/footer.jsp" %>
