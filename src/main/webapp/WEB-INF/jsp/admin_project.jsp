<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.lei.demo.dao.ExpenseDAO" %>
<%@ page import="com.lei.demo.entity.Expense" %>
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
			<div class="content_rightbox1">
				<div class="content_rightbox_left">
					<div class="content_rightbox11">所有项目</div>
					<div class="content_rightbox12">查看、管理所有项目</div>
				</div>
				<div class="content_rightbox_right">
				<input type="text" placeholder="  搜索项目" class="input1"><i class="fa fa-search" ></i>
				</div>				
			</div>
			<div class="content_rightbox2">
					<div class="content_rightbox21">全部项目</div>
					<div class="content_rightbox22"></div>		
			</div>

			<div class="content_rightbox3">
				<input type="button" value="增加项目" id="question1" class="butt">
			</div>

			<div class="content_rightbox4">	
				<c:if test="${not empty project}">				
					<table class="table1">
						<tr class="tabletitle">
							<td >项目代码</td>
							<td>项目名称</td>
							<td>项目类别</td>
							<td>项目经费</td>
							<td>项目负责人</td>
							<td>操作</td>
						</tr>
					<c:forEach var="current" items="${project}">
						<tr class="tabletext">
							<td>${current.projectid}</td>
							<td>${current.projectname}</td>
							<td>${current.projecttype}</td>
							<td>${current.projectexpense}</td>
							<td>${current.projectleader}</td>
							<td class="textcolor"><a href="/demo/project/checkdetail/${current.projectid}">查看详情</a></td>
						</tr>
					</c:forEach>
					</table>
					</c:if>
				</div>			
		</div>
	</div>
	
<div id="sysNodeList1" style="display: none" >
    <div class="grey_box Branch2">
        <form action="/demo/project/create" method="post">
            <div class="info_box4">
            	<div class="typebox9">
            		<div class="typetitlef">
						<div class="faretypef">项目信息</div>						
					</div>   
					<div class="writeboxf">
	                    <div class="writeboxf_title">项目代码：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName" name="projectid" />
	                    </div>
	                </div>                
					<div class="writeboxf">
	                    <div class="writeboxf_title">项目名称：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName" name="projectname" />
	                    </div>
	                </div>                              
					<div class="writeboxf">
	                    <div class="writeboxf_title">项目类别：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName" name="projecttype"  />
	                    </div>
	                </div>                                     
					<div class="writeboxf">
	                    <div class="writeboxf_title">技术领域：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName" name="projectfield"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writeboxf">
	                    <div class="writeboxf_title">技术来源：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName" name="projectorigin"  />
	                    </div>
	                </div>  
	 				<div class="writeboxf">
	                    <div class="writeboxf_title1">开始日期：</div>
	                    <div class="writeboxf_text1">
	                        <input type="date" class="textwritef" id="noName" name="begintime"  />
	                    </div>
	                </div> 
					<div class="writeboxf">
	                    <div class="writeboxf_title1">完成日期：</div>
	                    <div class="writeboxf_text1">
	                        <input type="date" class="textwritef" id="noName" name="finishtime"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writeboxf">
	                    <div class="writeboxf_title">项目经费：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName" name="projectexpense" />
	                        <input type="hidden"  name="restexpense" value="0"  />
	                        <input type="hidden"  name="usedexpense" value="0"  />
	                    </div>
	                </div>  
					<div class="writeboxf">
	                    <div class="writeboxf_title">项目负责人：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName" name="projectleader"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writeboxf">
	                    <div class="writeboxf_title">项目成员：</div>
	                    <div class="writeboxf_text">
	                        <input type="text" class="textwrite" id="noName" name="projectnumber"  />
	                    </div>
	                </div>  				                       
            	</div>
            	
				<div class="typebox5">  
	              	<div class="box260 btn">
                    	<button type="submit" id="save" >增加</button>             
              		</div>                               
				</div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
	$(function() {
		$("#save").click(function(event) {
        	$("#project").attr("action", "/demo/project/create")
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