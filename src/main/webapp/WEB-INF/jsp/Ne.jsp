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
<link href="<%=basePath%>css/model.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/commonNew.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/myMY.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/loPrCenter.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<title>用户管理</title>
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
					<div class="content_rightbox21">所有用户</div>
					<div class="content_rightbox22"></div>		
			</div>

			<div class="content_rightbox3">
				<input type="button" value="添加用户" id="adduser" class="butt">
			</div>	
			<div class="content_rightbox4">	
			<c:if test="${not empty users}">				
					<table class="table1">
						<tr class="tabletitle">
							<td >用户ID</td>
							<td>用户名</td>
							<td>用户类型</td>
							<td colspan="2">操作</td>
						</tr>
					<c:forEach var="current" items="${users}">
						<tr class="tabletext">
							<td>${current.userID}</td>
							<td>${current.userName}</td>
							<td>${current.userType}</td>
							<td class="textcolor"><a href="/demo/user/edit/${current.userName}" id="edituser">编辑</a></td>
							<td class="textcolor"><a href="/demo/user/delete/${current.userName}">删除</a></td>
						</tr>
					</c:forEach>
					</table>
					</c:if>
				</div>
			</div>			
		</div>


<div id="sysNodeList" style="display: none" >
    <div class="grey_box Branch2">
        <form  action="/demo/user/create"  method="post" id="adduser">
            <div class="info_box1">
            	<div class="typebox1 width300" style="height:250px;margin-left:38px;;margin-top:20px;padding-top:30px;border-bottom:1px solid #6ba3f5;">
            		<p> 
            			<div class="writebox1">
	                    <div class="writebox_title1">用户名：</div>
	                    <div class="writebox_text">
	                        <input type="text" name="UserName" value=''>
	                    </div>
	                </div>
            		</p>
            		<p>
            			<div class="writebox1">
	                    <div class="writebox_title1">密&nbsp;&nbsp; 码：</div>
	                    <div class="writebox_text">
	                        <input type="password" name="Password" value=''>
	                    </div>
	                </div>
            		</p>
            		<p>
            		<div class="writebox1">
	                    <div class="writebox_title1">类&nbsp;&nbsp; 别：</div>   
            		<div class="writebox_text">
					    <select name="UserType" size="1">
					      <option value="admin" >财务人员</option>
					      <option value="user">教师</option>
					    </select>  
					</div> 
					</div>    
  					</p>
  					<p>
  					<div class="writebox1" >  
	              	<div class="box260 btn" style="margin-left:70px;margin-top:20px;">
                    	<button type="button" id="save">确定</button>                  		
                </div>                               
				</div> 
  					</p>                
				</div> 								                       
            </div>
        </form>
    </div>
</div> 

<script type="text/javascript">
	$(document).ready(function(){
	    $("#save").click(function(){    // 提交按钮触发事件
	        var tourl = "/demo/user/create";    // 获取 表单的 提交地址
	        // 序列化 表单数据 后提交 ，太简洁了
	        $.post(tourl,$("form").serialize(),function(data){
	            // data 是 ajaxreturn 返回的 数据
	            // layer 插件的方法，只一句话，够简单
	            layer.msg(data.info, 2, -1);        // 2秒后自动关闭，-1代表不显示图标
	            if(data.status==1){
	                // 刷新弹出层
	               $.each($('form input'),function(){
	            	   $(this).val('')
	               }) 
	                /* setTimeout("javascript:window.location.reload(tourl)",2100); */
	                setTimeout(function(){
	                	 $('.xubox_close').click();
	                },2000)
	            }
	        });
	    });
	 });
</script>	
<script type="text/javascript" src="<%=basePath%>js/jquery1.9.js"></script>
<script type="text/javascript" src="<%=basePath%>layer/layer.min.js"></script>
<script type="text/javascript" src="<%=basePath%>layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=basePath%>js/commonNew.js"></script>
<script type="text/javascript" src="<%=basePath%>js/frame1.js"></script>
</body>
</html>