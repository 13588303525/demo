<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.lei.demo.dao.ProjectDAO" %>
<%@ page import="com.lei.demo.entity.Project" %>
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
<link href="<%=basePath%>css/looktravelmodel.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/commonNew.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/myMY.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/loPrCenter.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>

<title>报销汇总单</title>
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
		<div class="content_leftf">

			<a href="/demo/travelexpense/see" property="inpage">
				<div class="content_left-box1"><i class="fa fa-puzzle-piece" ></i></div>
				<div class="content_leftbox">我的差旅单</div>
			</a>
			<a href="/demo/expense/see" property="inpage">
				<div class="content_left-box1"><i class="fa fa-dot-circle-o" ></i></div>
				<div class="content_leftbox">我的报销单</div>			
			</a>
			<a href="/demo/project/see" property="inpage">
				<div class="content_left-box1"><i class="fa fa-home" ></i></div>
				<div class="content_leftbox">我的项目</div>
			</a>
		</div>
		<div class="content_rightf">
			<div class="content_rightbox1">
				<div class="content_rightbox_left">
					<div class="content_rightbox11">我的项目</div>
				</div>				
			</div>
		  <%               	
		  	Project project = (Project)request.getSession().getAttribute("projectdetail");
		  	
	       %>	
        <form  method="post" >
            <div class="info_box3">
            	<div class="typebox8">
            		<div class="typetitlef">
						<div class="faretype">项目信息</div>						
					</div>   
					<div class="writeboxf">
	                    <div class="writeboxf_title">项目代码：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"  value="<%=project.getProjectid() %>" readonly="true" />
	                    </div>
	                </div>                
					<div class="writeboxf">
	                    <div class="writeboxf_title">项目名称：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"  value="<%=project.getProjectname() %>" readonly="true" />
	                    </div>
	                </div>                              
					<div class="writeboxf">
	                    <div class="writeboxf_title">项目类别：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"   value="<%=project.getProjecttype() %>" readonly="true" />
	                    </div>
	                </div>                                     
					<div class="writeboxf">
	                    <div class="writeboxf_title">技术领域：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"   value="<%=project.getProjectfield() %>" readonly="true" />
	                    </div>
	                </div>  				     				     	
	 				<div class="writeboxf">
	                    <div class="writeboxf_title">技术来源：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"   value="<%=project.getProjectorigin() %>" readonly="true" />
	                    </div>
	                </div>  
	 				<div class="writeboxf">
	                    <div class="writeboxf_title">开始日期：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"   value="<%=project.getBegintime() %>" readonly="true" />
	                    </div>
	                </div> 
					<div class="writeboxf">
	                    <div class="writeboxf_title">完成日期：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"   value="<%=project.getFinishtime() %>" readonly="true" />
	                    </div>
	                </div>  				     				     	
	 				<div class="writeboxf">
	                    <div class="writeboxf_title">项目经费：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"   value="<%=project.getProjectexpense() %>" readonly="true" />
	                    </div>
	                </div>  
	 				<div class="writeboxf">
	                    <div class="writeboxf_title">已使用经费：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"   value="<%=project.getUsedexpense() %>" readonly="true" />
	                    </div>
	                </div>
	                <div class="writeboxf">
	                    <div class="writeboxf_title">未使用经费：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"   value="<%=project.getRestexpense() %>" readonly="true" />
	                    </div>
	                </div>
					<div class="writeboxf">
	                    <div class="writeboxf_title">项目负责人：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"   value="<%=project.getProjectleader() %>" readonly="true" />
	                    </div>
	                </div>  				     				     	
	 				<div class="writeboxf">
	                    <div class="writeboxf_title">项目成员：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"   value="<%=project.getProjectnumber() %>" readonly="true" />
	                    </div>
	                </div>  				                       
            	</div>            	
            </div>
        </form>
	</div>
<script type="text/javascript" src="<%=basePath%>js/jquery1.9.js"></script>
<script type="text/javascript" src="<%=basePath%>layer/layer.min.js"></script>
<script type="text/javascript" src="<%=basePath%>layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=basePath%>js/commonNew.js"></script>
<script type="text/javascript" src="<%=basePath%>js/frame.js"></script>
</body>
</html>