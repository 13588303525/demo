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
<link href="<%=basePath%>css/modelexpense.css" rel="stylesheet" type="text/css"/>
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
		<div class="content_left">
		<a href="/demo/travelexpense/check" property="inpage">
				<div class="content_left-box1"><i class="fa fa-home" ></i></div>
				<div class="content_leftbox">审核差旅单</div>
			</a>
			<a href="/demo/expense/check" property="inpage">
				<div class="content_left-box1"><i class="fa fa-puzzle-piece" ></i></div>
				<div class="content_leftbox">审核报销单</div>
			</a>
			<a href="/demo/project/check" property="inpage">
				<div class="content_left-box1"><i class="fa fa-dot-circle-o" ></i></div>
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
					<div class="content_rightbox21">项目详情</div>
					<div class="content_rightbox22"></div>		
			</div>
		  <%               	
		  	Project project = (Project)request.getSession().getAttribute("projectdetail");
		  	
	       %>	
        <form modelAttribute="project" action="/demo/project/edit" method="post">
            <div class="info_box3">
            	<div class="typebox8">
            		<div class="typetitlef">
						<div class="faretypef">项目信息</div>						
					</div>   
					<div class="writeboxf">
	                    <div class="writeboxf_title">项目代码：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName" name="projectid" value="<%=project.getProjectid() %>" readonly="true" />
	                    </div>
	                </div>                
					<div class="writeboxf">
	                    <div class="writeboxf_title">项目名称：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"  name="projectname"  value="<%=project.getProjectname() %>" />
	                    </div>
	                </div>                              
					<div class="writeboxf">
	                    <div class="writeboxf_title">项目类别：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"  name="projecttype"  value="<%=project.getProjecttype() %>"  />
	                    </div>
	                </div>                                     
					<div class="writeboxf">
	                    <div class="writeboxf_title">技术领域：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"  name="projectfield"  value="<%=project.getProjectfield() %>"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writeboxf">
	                    <div class="writeboxf_title">技术来源：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"  name="projectorigin"  value="<%=project.getProjectorigin() %>"  />
	                    </div>
	                </div>  
	 				<div class="writeboxf">
	                    <div class="writeboxf_title1">开始日期：</div>
	                    <div class="writeboxf_text1">
	                        <input type="date" class="textwritef" id="noName"  name="begintime"   value="<%=project.getBegintime() %>"  />
	                    </div>
	                </div> 
					<div class="writeboxf">
	                    <div class="writeboxf_title1">完成日期：</div>
	                    <div class="writeboxf_text1">
	                        <input type="date" class="textwritef" id="noName" name="finishtime"   value="<%=project.getFinishtime() %>"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writeboxf">
	                    <div class="writeboxf_title">项目经费：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName" name="projectexpense"  value="<%=project.getProjectexpense() %>"  readonly="true"  />
	                    </div>
	                </div>  
	 				<div class="writeboxf">
	                    <div class="writeboxf_title">已使用经费：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName" name="usedexpense"  value="<%=project.getUsedexpense() %>"  readonly="true" />
	                    </div>
	                </div>
	                <div class="writeboxf">
	                    <div class="writeboxf_title">未使用经费：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName" name="restexpense"  value="<%=project.getRestexpense() %>"  readonly="true" />
	                    </div>
	                </div>
					<div class="writeboxf">
	                    <div class="writeboxf_title">项目负责人：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"   name="projectleader"  value="<%=project.getProjectleader() %>" />
	                    </div>
	                </div>  				     				     	
	 				<div class="writeboxf">
	                    <div class="writeboxf_title">项目成员：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName"   name="projectnumber"  value="<%=project.getProjectnumber() %>" />
	                    </div>
	                </div>  				                       
            	</div>
            	<div class="typebox5">  
                    	<button type="submit" id="edit" style="margin-left: 180px;">修改</button>   
	    		</div>
            </div>
        </form>
    </div>
 <script type="text/javascript">
	$(function() {
		$("#edit").click(function(event) {
        	$("#project").attr("action", "/demo/project/edit")
			$("#project").submit();
		});
	}); 
</script>
<script type="text/javascript" src="<%=basePath%>js/jquery1.9.js"></script>
<script type="text/javascript" src="<%=basePath%>layer/layer.min.js"></script>
<script type="text/javascript" src="<%=basePath%>layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=basePath%>js/commonNew.js"></script>
<script type="text/javascript" src="<%=basePath%>js/frame.js"></script>
</body>
</html>