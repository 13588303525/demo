<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.lei.demo.dao.TravelExpenseDAO" %>
<%@ page import="com.lei.demo.entity.TravelExpense" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="com.lei.demo.entity.User" %>


<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>">
<link href="<%=basePath%>css/3.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/model.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/commonNew.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/myMY.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/loPrCenter.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script language="javascript">
	    function mu() {
	        if (!confirm("确认要修改？")) {
	            window.event.returnValue = false;
	        }
	    }
	    function rp() {
	        if (!confirm("确认要重置密码？")) {
	            window.event.returnValue = false;
	        }
	    }
   </script>
<title>修改用户</title>
</head>
<body>
	<div class="headerTop">
		<div class="model-container">
			<div class="header-container-left">
				<div class="header-li-box2"><i class="fa fa-eercast" ></i></div>茶叶蛋财务报销系统
			</div>				
			<div class="header-container-right">
				<ul class="header-list">
					<li class="header-lix">
						<a href="#" property="inpage">
							<div class="header-li-boxx1"><i class="fa fa-cog" ></i>设置</div>
						</a>
					</li>
					<li class="header-lix">
						<a href="#" property="inpage">
							<div class="header-li-boxx1"><i class="fa fa-envelope-o" ></i>消息</div>
							
						</a>
					</li>  
					<li class="header-lix">
						<a href="/demo/user/" property="inpage">
							<div class="header-li-boxx1"><i class="fa fa-sign-out" ></i>退出</div>
						</a>
					</li>										
				</ul>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="content_left">
				<a href="/demo/travelexpense/check" property="inpage">
				<div class="content_left-box1"><i class="fa fa-puzzle-piece" ></i></div>
				<div class="content_leftbox">审核差旅单</div>
			</a>
			<a href="/demo/expense/check" property="inpage">
				<div class="content_left-box1"><i class="fa fa-dot-circle-o" ></i></div>
				<div class="content_leftbox">审核报销单</div>				
			</a>
			<a href="/demo/project/check" property="inpage">
				<div class="content_left-box1"><i class="fa fa-home" ></i></div>
				<div class="content_leftbox">项目管理</div>
			</a>
			<a href="/demo/user/manager_u" property="inpage">
				<div class="content_left-box1"><i class="fa fa-user-circle" aria-hidden="true"></i></div>
				<div class="content_leftbox">用户管理</div>
			</a>
			<a href="/demo/user/charts" property="inpage">
				<div class="content_left-box1"><i class="fa fa-bar-chart" aria-hidden="true"></i></div>
				<div class="content_leftbox">图表分析</div>
			</a>
		</div>
		<div class="content_right">
			<div class="content_rightbox2">
					<div class="content_rightbox21">修改用户信息</div>
					<div class="content_rightbox22"></div>		
			</div>
			<% User a=(User)request.getSession().getAttribute("eu"); %>
			<div class="content_rightbox4">	
			<center>
				<form:form modelAttribute="user" action="/demo/user/update" method="post" id="mm">
				 <input type="hidden" name="muserid"  value='<%=a.getUserID()%>' readonly="true">
				 	<p>用户名：
					    <input type="text" name="musername" value='<%=a.getUserName()%>'>
					  </p><br>
					  <p>密 &nbsp; &nbsp;码：
					    <label>
					    <input type="password" name="mpwd" value='<%=a.getPassword()%>' readonly=true>
					    </label>
					  </p><br>
					  <p class="lb">类&nbsp;&emsp;别：   
					    <select name="musertype" size="1">
					      <option value="admin" <%if(a.getUserType().equals("admin")) out.print("selected");%>>财务人员</option>
					      <option value="user" <%if(a.getUserType().equals("user")) out.print("selected");%>>教师</option>
					    </select>					    
					  </p><br>
					  <p>
					  	<button type="submit" id="m" onclick="mu();">确定修改</button> <button type="submit" id="r" onclick="rp();">密码重置</button> 
					  </p>
				 </form:form>
				 </center>
				</div>
			</div>			
		</div>
	<script type="text/javascript">

	$(function() {
		$("#m").click(function(event) {
        	$("#mm").attr("action", "/demo/user/update")
			$("#mm").submit();
		});

		$("#r").click(function(event) {
        	$("#mm").attr("action", "/demo/user/reset")
			$("#mm").submit();

		});
	});
</script>
</body>
</html>